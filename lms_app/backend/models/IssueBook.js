const mongoose = require('mongoose');

const issueBookSchema = new mongoose.Schema({
    bookId: {
        type: String,
        required: true
    },
    bookName: {
        type: String,
        required: true
    },
    studentId: {
        type: String,
        required: true
    },
    studentName: {
        type: String,
        required: true
    },
    issueDate: {
        type: Date,
        required: true,
        default: Date.now
    },
    returnDate: {
        type: Date,
        required: true,
        default: Date.now
    },
    fine: {
        type: Number,
        default: 0
    },
    status: {
        type: String,
        required: true,
        enum: ['ISSUED', 'RETURNED'],
        default: 'ISSUED'
    }
});

const IssueBook = mongoose.model('IssueBook', issueBookSchema);
module.exports = IssueBook;