const express = require('express');
const Book = require('../models/Book');
const router = express.Router();
const authMiddleware = require('../middlewares/authMiddleware');

router.get('/', authMiddleware, async (request, response) =>{
    try{
        const books = await Book.find();
        return response.status(200).json({books});
    }catch(error){
        response.status(500).json({message:error.message});
    }
});

router.get('/:id', authMiddleware, async (request, response) =>{
    try{
        const book = await Book.findById(request.params.id);
        if(!book){
            return response.status(404).json({message:'Book not found'});
        }
        return response.status(200).json({book});
    }catch(error){
        response.status(500).json({message:error.message});
    }
});

router.post('/', authMiddleware, async (request, response) =>{
    try{

        const user = request.user;
        if(user.role !== 'LIBRARIAN'){
            return response.status(403).json({message:'Access denied, only librarians can add books'});
        }

        const {title, description, author, price, quantity, imageUrl, pdfUrl, category} = request.body;

        const newBook = {
            title,
            description,
            author,
            price,
            quantity,
            imageUrl,
            pdfUrl,
            category
        };

        const book = new Book(newBook);
        await book.save();
        return response.status(201).json({message:'Book added successfully', book});
    }catch(error){
        response.status(500).json({message:error.message});
    }
});

router.put('/:id', authMiddleware, async (request, response) =>{
    try{
        const user = request.user;
        if(user.role !== 'LIBRARIAN'){
            return response.status(403).json({message:'Access denied, only librarians can update books'});
        }

        const book = await Book.findByIdAndUpdate(request.params.id, request.body, {new:true});
        if(!book){
            return response.status(404).json({message:'Book not found'});
        }
        return response.status(200).json({message:'Book updated successfully', book});
    }catch(error){
        response.status(500).json({message:error.message});
    }
});

router.delete('/:id', authMiddleware, async (request, response) =>{
    try{
        const user = request.user;
        if(user.role !== 'LIBRARIAN'){
            return response.status(403).json({message:'Access denied, only librarians can delete books'});
        }

        const book = await Book.findByIdAndDelete(request.params.id);
        if(!book){
            return response.status(404).json({message:'Book not found'});
        }
        return response.status(200).json({message:'Book deleted successfully', book});
    }catch(error){
        response.status(500).json({message:error.message});
    }
});

module.exports = router;