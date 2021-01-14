# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies  =  Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.new({username:'Erika'})
u1.avatar.attach(
    io: File.open('./app/assets/images/face11.jpg'),
    filename: 'face11.jpg',
    content_type: 'image/jpeg'
  )
u1.save

u2 = User.new({username:'John'})
u2.avatar.attach(
    io: File.open('./app/assets/images/face22.jpg'),
    filename: 'face22.jpg',
    content_type: 'image/jpeg'
  )
u2.save

u3 = User.new({username:'Christina'})
u3.avatar.attach(
    io: File.open('./app/assets/images/face33.jpg'),
    filename: 'face33.jpg',
    content_type: 'image/jpeg'
  )
u3.save

g1 = Group.new(name:'TakeOut', icon:'fa fa-cutlery', user_id:1)
g1.save

g2 = Group.new(name:'Trips', icon:'fa fa-plane', user_id:2)
g2.save

g3 = Group.new(name:'Games', icon:'fa fa-gamepad', user_id:2)
g3.save

e1 = Transaction.new(name:'Food', amount:25, user_id:1, group_id:1)
e1.save

e1 = Transaction.new(name:'Coffe', amount:10 , user_id:2, group_id:1)
e1.save

e1 = Transaction.new(name:'Dinner', amount:150 , user_id:3, group_id:1)
e1.save

e1 = Transaction.new(name:'Hotel', amount:1025, user_id:1, group_id:2)
e1.save

e1 = Transaction.new(name:'Plane', amount:1000 , user_id:2, group_id:2)
e1.save

e1 = Transaction.new(name:'Uber', amount:150 , user_id:3, group_id:2)
e1.save

e1 = Transaction.new(name:'Ipad', amount:329, user_id:1, group_id:3)
e1.save

e1 = Transaction.new(name:'Phone', amount:600 , user_id:2, group_id:3)
e1.save

e1 = Transaction.new(name:'Hotspot', amount:250 , user_id:3, group_id:3)
e1.save

e1 = Transaction.new(name:'Office papers', amount:50, user_id:1)
e1.save

e1 = Transaction.new(name:'Gifts', amount:100 , user_id:2)
e1.save

e1 = Transaction.new(name:'Tissues', amount:10 , user_id:3)
e1.save