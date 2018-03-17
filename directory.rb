#let's put all students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: ["climbing", "cooking"], age: 51},
  {name: "Darth Vader", cohort: :november, hobbies: ["swimming", "cooking"], age: 35},
  {name: "Nurse Ratched", cohort: :november, hobbies: ["running", "cooking"], age: 28},
  {name: "Michael Corleone", cohort: :november, hobbies: ["climbing", "swimming"], age: 22},
  {name: "Alex DeLarge", cohort: :november, hobbies: ["writing", "reading"], age: 64},
  {name: "The Wicked Witch of the West", cohort: :november, hobbies: ["drawing", "cooking"], age: 81},
  {name: "Terminator", cohort: :november, hobbies: ["climbing", "reading"], age: 44},
  {name: "Freddy Krueger", cohort: :november, hobbies: ["programming", "cooking"], age: 12},
  {name: "The Joker", cohort: :november, hobbies: ["climbing", "swimming"], age: 40},
  {name: "Joffrey Baratheon", cohort: :november, hobbies: ["writing", "cooking"], age: 21},
  {name: "Norman Bates", cohort: :november, hobbies: ["climbing", "running"], age: 78}
]
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  i = 0
  while i < students.length do
    puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
    i += 1
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
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

def shortNames(students, howShort)
  new_list = []
  students.each_with_index do |student, index|
    if student[:name].length < howShort then
      new_list << student
    end
  end
  return new_list
end
#nothing happens until we call the methods
students = input_students
#test_students = starts_with(students, "A")
#test_students = shortNames(students, 12)
print_header
print(students)
print_footer(students)
