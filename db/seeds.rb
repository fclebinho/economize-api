# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create email: 'fake@user.com'
u2 = User.create email: 'fake2@user.com'

n1 = Entry.create user: u1, due_date: '2021-06-05', title: 'Bootcamp 2 OneBitCode', amount: 56.09, kind: 'debit'
n2 = Entry.create user: u2, due_date: '2021-06-05', title: 'Aprender Rails', amount: 100.11, kind: 'credit'

t1 = Tag.create title: 'Rails', user: u1
t2 = Tag.create title: 'React', user: u2

UsersEntry.create user: u1, entry: n2
UsersEntry.create user: u2, entry: n1

TagsEntry.create tag: t1, entry: n1
TagsEntry.create tag: t2, entry: n2