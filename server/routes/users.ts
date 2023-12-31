import express from 'express';
import prisma from '../client'
var router = express.Router();
var debug = require('debug')('prisma-sample:server');

/* GET users listing. */
router.get('/', async function(req, res, next) {
  const allUsers = await prisma.user.findMany();
  debug('Found users: %o', allUsers);
  const usersText: string[] = allUsers.map((user) => `${user.name} [${user.id}] at ${user.notemail}`);
  res.render('users', { title: 'Viewing Users', usersText });
});

module.exports = router;
