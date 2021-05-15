# About
This is a simple CRUD application using Ruby on Rails.</br>
The business model is based on a Cafe Shop that has a goal to manage products, pricing and daily menus.

# Running

**Requirements:**
- Ruby 3.0.1
- Rails 6.1.3

rails db:migrate</br>
rails db:seed</br>
rails s

# Model
```
product
  name: string

pricing_unit
  product_id: integer
  volume: float
  unit: string
  price: float

pricing_portion
  product_id: integer
  volume_per_unit: float
  unit: string
  quantity: integer
  price: float

category
  name: string

course
  name: string

course_item
  category_id: integer
  course_id: integer
  pricing_unit: integer
  princing_portion: integer

daily_menu
  created: date

daily_menu_item
  daily_menu_id: integer
  course_id: integer
  price: float
```