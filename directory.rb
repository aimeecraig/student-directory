#!/usr/bin/env ruby

require 'csv'

@students = []
@months = [ "january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december" ]

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "5. Find students with names below a specific character limit"
  puts "6. Find students with names beginning with a specific character"
  puts "7. Show source code"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  # run selection
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    puts "Specify the filename to load from"
    load_students(STDIN.gets.chomp)
  when "5"
    puts "Specify the character limit"
    print_shorter_than(STDIN.gets.chomp)
  when "6"
    puts "Specify the letter to search for"
    print_beginning_with(STDIN.gets.chomp.upcase)
  when "7"
    show_source
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter the cohort"
    cohort = STDIN.gets.chomp
    # check for empty value
    if cohort == nil || @months.include?(cohort) == false
      cohort = "september"
    end
    # get student's birth country
    puts "Please enter #{name}'s birth country"
    birth_country = STDIN.gets.chomp
    # pushes student entry to students array
    push_entry(name, cohort, birth_country)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list(@students)
  print_footer(@students)
end

def print_header
  puts "The students of Villians Academy".center(50, "-")
  puts "\n"
end

# prints the list of students
def print_student_list(students)
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

# prints the number of students
def print_footer(names)
  if names.count == 1
    puts "Overall we have #{names.count} great student"
  elsif names.count > 1
    puts "Overall we have #{names.count} great students"
  end
end

def push_entry(name, cohort, birth_country)
  @students << {name: name, cohort: cohort.to_sym, birth_country: birth_country}
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
def print_beginning_with(letter)
  @months.each do |month|
    puts "#{month.capitalize} Cohort".center(50, "-")
    @students.each_with_index do |student, index|
      if student[:name].start_with?(letter) && student[:cohort] == month.to_sym
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort), birth country: #{student[:birth_country]}"
      end
    end
  end
  puts "\n"
end

# prints the students whose name is less than n characters
def print_shorter_than(character_limit)
  @months.each do |month|
    puts "#{month.capitalize} Cohort".center(50, "-")
    @students.each_with_index do |student, index|
      if student[:cohort] == month.to_sym && student[:name].length <= character_limit.to_i
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort), birth country: #{student[:birth_country]}"
      end
    end
  end
  puts "\n"
end

def save_students
  puts "Specify the filename to save to"
  CSV.open(filename = STDIN.gets.chomp, "w") do |csv|
    @students.each do |student|
      csv << student.values
    end
  end
end

def load_students(filename)
  CSV.foreach(filename) do |row|
    push_entry(row[0], row[1], row[2])
  end
  puts "Loaded #{@students.count} students from #{filename}"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    load_students("students.csv")
  elsif File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def show_source
  puts File.read(__FILE__)
end

try_load_students
interactive_menu
