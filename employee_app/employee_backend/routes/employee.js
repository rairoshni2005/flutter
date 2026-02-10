const express = require('express');
const router = express.Router();
const Employee = require('../models/employee');

// CREATE
router.post('/', async (req, res) => {
  try {
    const employee = new Employee(req.body);
    await employee.save();
    res.status(201).send(employee);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
});

// READ ALL
router.get('/', async (req, res) => {
  try {
    const employees = await Employee.find();
    res.status(200).send(employees);
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
});

// DELETE
router.delete('/:id', async (req, res) => {
  try {
    await Employee.findByIdAndDelete(req.params.id);
    res.status(200).send({ message: "Deleted successfully" });
  } catch (err) {
    res.status(500).send({ message: err.message });
  }
});

module.exports = router;
