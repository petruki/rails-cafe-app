# About
This is a simple CRUD application using Ruby on Rails.</br>
The business model is based on a Cafe Shop that has a goal to manage products, pricing and daily menus.

Status: incomplete

# Running

**Requirements:**
- Ruby 3.0.1
- Rails 6.1.3

rails db:migrate</br>
rails db:seed</br>
rails s

# Model
```
category
  name: string

pricing_unit
  course_id: integer
  volume: float
  unit: string
  price: float

pricing_portion
  course_id: integer
  volume_per_unit: float
  unit: string
  quantity: integer
  price: float

course
  name: string
  category_id: integer

daily_menu
  created: date

daily_menu_item
  daily_menu_id: integer
  course_id: integer
  price: float
```