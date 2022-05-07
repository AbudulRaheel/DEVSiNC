# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coupon.create(code: 'PAKARMY55', discount: 0.15, expiry_date: '2022-06-20')

Coupon.create(code: 'DEVSINC55', discount: 0.20, expiry_date: '2022-06-20')
