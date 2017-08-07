# This file should contain all the record creation needed to seed the database with its default values.
 #The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
## Examples:
##
##   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
 #  Mayor.create(name: 'Emanuel', city: cities.first)
r1 = Role.create({name: "Regular", description: "Can read items"})
r2 = Role.create({name: "Admin", description: "Can read and create items. Can update and destroy own items"})
r3 = Role.create({name: "Superadmin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "Regular", email: "regular@example.com", password: "123456", password_confirmation: "123456", role_id: r1.id})
u2 = User.create({name: "Admin1", email: "admin1@example.com", password: "123456", password_confirmation: "123456", role_id: r2.id})
u3 = User.create({name: "Admin2", email: "admin2@example.com", password: "123456", password_confirmation: "123456", role_id: r2.id})
u4 = User.update({name: "Superadmin", email: "superadmin@example.com", password: "123456", password_confirmation: "123456", role_id: r3.id, approved: 't'})
u5 = User.create({name: "Superadmin2",email: "superadmin2@example.com", password: "123456", password_confirmation: "123456", role_id: r3.id, approved: "t"})

i1 = Item.create({name: "Rayban Sunglasses", description: "Stylish shades", price: 99.99, user_id: u2.id})
i2 = Item.create({name: "Gucci watch", description: "Expensive timepiece", price: 199.99, user_id: u2.id})
i3 = Item.create({name: "Henri Lloyd Pullover", description: "Classy knitwear", price: 299.99, user_id: u3.id})
i4 = Item.create({name: "Porsche socks", description: "Cosy footwear", price: 399.99, user_id: u3.id})
