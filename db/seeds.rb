# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

chef = Chef.create(chefname: "Mark Murphy", email: "markdmurphy@ymail.com")
chef = Chef.create(chefname: "Bob Knight", email: "bob@example.com")
recipe = Recipe.create(name: "chicken parm", summary: "this is my family recipe for chicken parm",
                              description: "heat oil, add chicken until golden brown", chef_id: 1)
recipe = Recipe.create(name: "Even better chicken parm", summary: "This is much better than Mark's recipe!!!",
                       description: "heat oil, add chicken until golden brown", chef_id: 2)

