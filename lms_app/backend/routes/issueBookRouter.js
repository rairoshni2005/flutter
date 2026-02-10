const express = require('express');
const Book = require('../models/Book');
const User = require('../models/User');
const IssueBook = require('../models/IssueBook');
const router = express.Router();
const authMiddleware = require('../middlewares/authMiddleware');

router.post('/issue', authMiddleware, async (request, response) => {
    try {
        const user = request.user;
        if (user.role !== 'LIBRARIAN') {
            return response.status(403).json({ message: 'Access denied, only librarians can issue books' });
        }

        const { bookId, bookName, studentId, studentName, issueDate, returnDate } = request.body;
        const book = await Book.findById(bookId);
        if (!book) {
            return response.status(404).json({ message: 'Book not found' });
        }
        const student = await User.findById(studentId);
        if (!student) {
            return response.status(404).json({ message: 'Student not found' });
        }
        if (book.title !== bookName) {
            return response.status(400).json({ message: 'Book title does not match' });
        }
        if (student.name !== studentName) {
            return response.status(400).json({ message: 'Student name does not match' });
        }
        if (book.quantity === 0) {
            return response.status(400).json({ message: 'Book is out of stock' });
        }

        const newIssueBook = {
            bookId,
            bookName,
            studentId,
            studentName,
            issueDate,
            returnDate,
            status: 'ISSUED'
        };

        const issueBookRecord = new IssueBook(newIssueBook);
        await issueBookRecord.save();
        book.quantity -= 1;
        if (book.quantity <= 0) {
            book.status = 'UNAVAILABLE';
            book.quantity = Math.max(0, book.quantity);
        }
        await book.save();
        return response.status(200).json({ message: 'Book issued successfully', issueBookRecord });
    } catch (error) {
        response.status(500).json({ message: error.message });
    }
});

router.post('/return/:id', authMiddleware, async (request, response) => {
    try {
        const user = request.user;
        if (user.role !== 'LIBRARIAN') {
            return response.status(403).json({ message: 'Access denied, only librarians can return books' });
        }

        const issueBook = await IssueBook.findById(request.params.id);
        if (!issueBook) {
            return response.status(404).json({ message: 'Issue book not found' });
        }
        if (issueBook.status === 'RETURNED') {
            return response.status(400).json({ message: 'Book is already returned' });
        }
        issueBook.status = 'RETURNED';
        await issueBook.save();
        const book = await Book.findById(issueBook.bookId);
        if (book) {
            book.quantity += 1;
            if (book.quantity > 0) {
                book.status = 'AVAILABLE';
            }
            await book.save();
        }
        response.status(200).json({ message: 'Book returned successfully' });
    } catch (error) {
        response.status(500).json({ message: error.message });
    }
});

module.exports = router;