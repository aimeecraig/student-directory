#!/usr/bin/env ruby

def input_students
  # define a list of valid cohort months
  @months = [ "january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december" ]
  # prompt for user input
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter the cohort"
    cohort = gets.chomp
    # check for empty value
    if cohort == nil || @months.include?(cohort) == false
      cohort = "september"
    end
    # get student's birth country
    puts "Please enter #{name}'s birth country"
    birth_country = gets.chomp
    # pushes student entry to students array
    students << {name: name, cohort: cohort.to_sym, birth_country: birth_country}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villians Academy".center(50, "-")
  puts "\n"
end

# prints the list of students
def print(students)
  if students.empty? == true
    # do nothing
  else
    @months.each do |month|
      puts "#{month.capitalize} Cohort".center(50, "-")
      students.each_with_index do |student, index|
        if student[:cohort] == month.to_sym
          puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort), birth country: #{student[:birth_country]}"
        end
      end
    end
  end
end

# prints specific month
def print_month(students, month)
  puts "#{month.capitalize} Cohort".center(50, "-")
  students.each_with_index do |student, index|
    if student[:cohort] == month.to_sym
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort), birth country: #{student[:birth_country]}"
    end
  end
end

# prints the students whose name begins with a certain letter
def print_selected(students, letter)
  students.each_with_index do |student, index|
    if student[:name].start_with?(letter)
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# prints the students whose name is less than n characters
def print_shorter_than(students, character_limit)
  students.each_with_index do |student, index|
    if student[:name].length <= character_limit
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# prints the number of students
def print_footer(names)
  if names.count == 1
    puts "Overall we have #{names.count} great student"
  elsif names.count > 1
    puts "Overall we have #{names.count} great students"
  end
end

students = input_students
print_header
print(students)
print_footer(students)
