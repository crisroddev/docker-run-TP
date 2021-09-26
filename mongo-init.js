db = db.getSiblingDB('course-goals');

db.createCollection('test');

db.createUser({
  user: 'root',
  pwd: 'secret',
  roles: [
    {
      role: 'dbOwner',
      db: 'course-goals',
    },
  ],
});
