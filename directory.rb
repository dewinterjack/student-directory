#let's put all students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: ["climbing", "cooking"], age: 51, height: 5.11},
  {name: "Darth Vader", cohort: :november, hobbies: ["swimming", "cooking"], age: 35, height: 5.7},
  {name: "Nurse Ratched", cohort: :november, hobbies: ["running", "cooking"], age: 28, height: 5.3},
  {name: "Michael Corleone", cohort: :november, hobbies: ["climbing", "swimming"], age: 22, height: 6.5},
  {name: "Alex DeLarge", cohort: :november, hobbies: ["writing", "reading"], age: 64, height: 5.5},
  {name: "The Wicked Witch of the West", cohort: :november, hobbies: ["drawing", "cooking"], age: 81, height: 5.11},
  {name: "Terminator", cohort: :november, hobbies: ["climbing", "reading"], age: 44, height: 6.1},
  {name: "Freddy Krueger", cohort: :november, hobbies: ["programming", "cooking"], age: 12, height: 4.11},
  {name: "The Joker", cohort: :november, hobbies: ["climbing", "swimming"], age: 40, height: 5.8},
  {name: "Joffrey Baratheon", cohort: :november, hobbies: ["writing", "cooking"], age: 21, height: 5.11},
  {name: "Norman Bates", cohort: :november, hobbies: ["climbing", "running"], age: 78, height: 5.2}
]

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  i = 0
  while i < students.length do
    puts "#{i + 1}. #{students[i][:name].capitalize} (#{students[i][:cohort].capitalize} cohort)".center(50)
    i += 1
  end
end

def input_students
  cohorts = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  puts "Please enter the names & cohorts of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  # create an empty array
  students = []
  # while the name is not empty, repeat this code
  name = " "
  while !name.empty? do
    puts "Name:".center(50)
    name = gets.chomp
    puts "Cohort:".center(50)
    cohort = gets.chomp.to_sym
    cohorts.each do |c|
      if cohort.to_s.downcase == c.downcase then
        puts "Are these details correct? y/n"
        puts "Name: #{name}, Cohort: #{cohort}."
        input = gets.chomp
        if input == "y" then
          # add the student hash to the array
          students << {name: name, cohort: cohort}
          "Now we have #{students.count} students".tap{|now| puts students.count == 1 ? now.chop.center(50) : now.center(50)}
          break
        else
          next
        end
      end
    end
  end
  # return the array of students
  students
end

def print_footer(names)
  if names.length == 0 then
    puts "No students to display.".center(50)
  else
    "Overall, we have #{names.count} great students".tap{|foot| puts names.count == 1 ? foot.chop.center(50) : foot.center(50)}
  end
end

def starts_with(students, letter)
  new_list = []
  students.each_with_index do |student, index|
    if student[:name][0] == letter then
      new_list << student
    end
  end
  return new_list
end

def short_names(students, howShort)
  new_list = []
  students.each_with_index do |student, index|
    if student[:name].length < howShort then
      new_list << student
    end
  end
  return new_list
end

def print_by_cohort(students)
  cohorts = []
  students.each do |student|
    cohorts.push(student[:cohort].capitalize)
  end
  cohorts = cohorts.uniq # Removing duplicates
  cohorts.each do |cohort|
    puts " " # new line for styling
    puts "#{cohort.capitalize} Cohort:\n".center(50)
    index = 1
    students.each do |student|
      if student[:cohort].capitalize == cohort then
        puts "#{index}. #{student[:name].capitalize}".center(50)
        index += 1
      end
    end
  end
end

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

#test_students = starts_with(students, "A")
#test_students = short_names(students, 12)
#print_by_cohort(students)
interactive_menu
