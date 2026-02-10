const mongoose = require('mongoose');

const bookSchema = {
    title:{
        type:String,
        required:true
    },
    description:{
        type:String,
        required:true
    },
    price:{
        type:Number,
        required:true
    },
    quantity:{
        type:Number,
        required:true
    },
    author:{
        type:String,
        required:true
    },
    imageUrl:{
        type:String,
        required:true
    },
    pdfUrl:{
        type:String,
        required:true
    },
    category:{
        type:String,
        enum:['FYIT','SYIT','TYIT','FYCS','SYCS','TYCS']
    },
    status:{
        type:String,
        enum:['AVAILABLE','UNAVAILABLE'],
        default:'AVAILABLE'
    }
}
const Book = mongoose.model('Book', bookSchema);
module.exports = Book;