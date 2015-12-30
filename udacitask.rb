require './todolist.rb'

# Creates a new todo list
chores_list = TodoList.new(User.new("Karim"), "Chores List")

# Add four new items
chores_list.add_item Item.new "Do the dishes"
chores_list.add_item Item.new "Get groceries"
chores_list.add_item Item.new "Clean the house"
chores_list.add_item Item.new "Finish Udacity project"

# Print the list
chores_list.print

# Delete the first item
chores_list.delete_item 1

# Print the list
chores_list.print

# Delete the second item
chores_list.delete_item 2

# Print the list
chores_list.print

# Update the completion status of the first item to complete
chores_list.complete_item 1

# Print the list
chores_list.print

# Update the title of the list
chores_list.update title: 'Updated Chores List'

# Print the list
chores_list.print

# Save the list to a text file
chores_list.save

# Creates a new todo list for a new user
fun_list = TodoList.new(User.new("Adam"), "Fun List")

# Add four new items
fun_list.add_item Item.new "Buy Rome II Total War"
fun_list.add_item Item.new "Clean my room"
fun_list.add_item Item.new "Enjoy, Rome II Total War :)"
fun_list.add_item Item.new "Go to bed, NEVER!"

# Update the completion status of the first and second items to complete
fun_list.complete_item 1
fun_list.complete_item 2

# Print the list
fun_list.print

# Save the list to a text file
fun_list.save
