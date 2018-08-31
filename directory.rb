def input_students
  puts "Please enter your name and cohort"
  puts "To finish, just hit return twice when prompted for name"

  students = []
  puts "Name:"
  name = gets.chomp
  puts "Cohort:"
  cohort = gets.chomp

  while true do
    students << {name: name, cohort: cohort}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    puts "Name:"
    name = gets.delete "\n"
    if name.empty?
      break
    end
    puts "Cohort:"
    if cohort.empty?
      cohort = "N/A"
    else
      cohort = gets.chomp
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  puts names.sort_by { |hsh| hsh[:cohort] }
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student"
  else
  puts "Overall, we have #{names.count} great students"
  end
end

def interactive_menu
  students = []
  loop do
    puts "1. Enter students' details"
    puts "2. Show the students"
    puts "9. Exit"
  selection = gets.chomp
  case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
