const mongoose = require('mongoose');

const uri = 'mongodb://127.0.0.1:27017/itm_flutter_lms';

mongoose
  .connect(uri)
  .then(() => {
    console.log('Connected to MongoDB Successfully');
  })
  .catch((err) => {
    console.log('Error connecting to MongoDB', err.message || err);
  });

const db = mongoose.connection;
db.on('error', (err) => {
  console.log('MongoDB connection error', err.message || err);
});

module.exports = db;
