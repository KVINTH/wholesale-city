# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') #if Rails.env.development?

# OrderStatus.delete_all
# OrderStatus.create! id: 1, name: "In Progress"
# OrderStatus.create! id: 2, name: "Placed"
# OrderStatus.create! id: 3, name: "Shipped"
# OrderStatus.create! id: 4, name: "Cancelled"

# Province.create! name: "Alberta"
# Province.create! name: "British Columbia"
# Province.create! name: "Manitoba"
# Province.create! name: "New Brunswick"
# Province.create! name: "Newfoundland and Labrador"
# Province.create! name: "Nova Scotia"
# Province.create! name: "Ontario"
# Province.create! name: "Prince Edward Island"
# Province.create! name: "Quebec"
# Province.create! name: "Saskatchewan"
# Province.create! name: "North West Territories"
# Province.create! name: "Nunavut"
# Province.create! name: "Yukon"

provinces = Province.all

provinces.each do |province|
  province.gst_rate = 0.05
  province.save
end

ab = Province.find(1)
ab.pst_rate = 0
ab.hst_rate = 0
ab.save

bc = Province.find(2)
bc.pst_rate = 0.07
bc.hst_rate = 0
bc.save

mb = Province.find(3)
mb.pst_rate = 0.08
mb.hst_rate = 0
mb.save

nb = Province.find(4)
ab.pst_rate = 0
nb.hst_rate = 0.15
nb.save

nf = Province.find(5)
ab.pst_rate = 0
nf.hst_rate = 0.15
nf.save

ns = Province.find(6)
ab.pst_rate = 0
ns.hst_rate = 0.15
ns.save

on = Province.find(7)
ab.pst_rate = 0
on.hst_rate = 0.13

pei = Province.find(8)
ab.pst_rate = 0
pei.hst_rate = 0.15
pei.save

qc = Province.find(9)
qc.pst_rate = 0.0975
qc.save

sk = Province.find(10)
sk.pst_rate = 0.05
sk.hst_rate = 0
sk.save

nwt = Province.find(11)
nwt.pst_rate = 0
nwt.hst_rate = 0
nwt.save

nv = Province.find(12)
nv.pst_rate = 0
nv.hst_rate = 0
nv.save

yk = Province.find(13)
yk.pst_rate = 0
yk.hst_rate = 0
yk.save