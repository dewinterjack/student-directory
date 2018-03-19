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
  "Overall, we have #{names.count} great students".tap{|foot| puts names.count == 1 ? foot.chop.center(50) : foot.center(50)}
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
#nothing happens until we call the methods
students = input_students
#test_students = starts_with(students, "A")
#test_students = short_names(students, 12)
if students.length != 0 then
  print_header
  print(students)
  #print_by_cohort(students)
  print_footer(students)
else
  puts "No students to display.".center(50)
end
