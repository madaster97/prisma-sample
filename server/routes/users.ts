import express from 'express';
import prisma from '../client'
var router = express.Router();

/* GET users listing. */
router.get('/', async function(req, res, next) {
  const allUsers = await prisma.user.findMany();
  const usersText: string[] = allUsers.map((user) => `${user.name} [${user.id}] at ${user.email}`);
  res.render('users', { title: 'Viewing Users', usersText });
});

module.exports = router;
