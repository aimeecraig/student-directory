#!/usr/bin/env ruby

# array of students
students = [
  "Dr Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Kruger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# prints the list of students
puts "The students of Villians Academy"
puts "--------------------------------"
students.each do |student|
  puts student
end
# prints the number of students
puts "Overall we have #{students.count} great students"
