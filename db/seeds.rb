p1 = Product.create(name: 'Spaghetti')
p2 = Product.create(name: 'Tiramisu')

pu1 = PricingUnit.create(product_id: p1.id, volume: 100.0, unit: 'g', price: 2.0)
pu2 = PricingUnit.create(product_id: p2.id, volume: 50.0, unit: 'g', price: 5.0)

pp1 = PricingPortion.create(product_id: p1.id, volume_per_unit: 100.0, unit: 'g', quantity: 3, price: 5.0)
pp2 = PricingPortion.create(product_id: p2.id, volume_per_unit: 50.0, unit: 'g', quantity: 3, price: 8.0)

ca1 = Category.create(name: "Main Courses")
ca2 = Category.create(name: "Desserts")

co1 = Course.create(name: "Single Spaghetti")
co2 = Course.create(name: "Combo Spaghetti + Dessert")
co3 = Course.create(name: "Family Spaghetti")

ci1 = CourseItem.create(category_id: ca1.id, course_id: co1.id, pricing_unit_id: pu1.id)
ci2 = CourseItem.create(category_id: ca1.id, course_id: co2.id, pricing_unit_id: pu1.id)
ci3 = CourseItem.create(category_id: ca2.id, course_id: co2.id, pricing_unit_id: pu2.id)
ci4 = CourseItem.create(category_id: ca1.id, course_id: co3.id, pricing_portion_id: pp1.id)

d1 = DailyMenu.create(created: DateTime.parse("01/05/2021"))

di1 = DailyMenuItem.create(daily_menu_id: d1.id, course_id: co1.id, price: 5.0)
di2 = DailyMenuItem.create(daily_menu_id: d1.id, course_id: co2.id, price: 20.0)
di3 = DailyMenuItem.create(daily_menu_id: d1.id, course_id: co3.id, price: 15.0)