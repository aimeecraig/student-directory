#!/usr/bin/env ruby

def input_students
  puts "Please enter the name of the student and their birth country,
separated with a comma"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  user_input = gets.chomp
  student = user_input.split(",")
  # while the name is not empty, repeat this code
  while !user_input.empty? do
    # add the student hash to the array
    students << {name: student[0], cohort: :november, birth_country: student[1]}
    puts "Now we have #{students.count} students"
    # get another name from the user
    user_input = gets.chomp
    student = user_input.split(",")
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villians Academy"
  puts "--------------------------------"
end

# prints the list of students
def print(students)
  students.each_with_index do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort), birth
country: #{student[:birth_country]}"
  end
end

# prints the list of students using control flow
def print_loop(students)
  index = 0
  until index = students.length
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    index += 1
  end
end

# prints the students whose name begins with a certain letter
def print_selected(students, letter)
  students.each_with_index do |student, index|
    if student[:name].start_with?(letter)
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# prints the students whose name is less than n characters
def print_shorter_than(students, character_limit)
  students.each_with_index do |student, index|
    if student[:name].length <= character_limit
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# prints the number of students
def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
