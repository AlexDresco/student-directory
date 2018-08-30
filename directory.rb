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
    puts "Now we have #{students.count} students"
    puts "Name:"
    name = gets.chomp
    if name.empty?
      break
    end
    puts "Cohort:"
    if cohort.empty?
      cohort = "N/A"
    else
      cohort = gets.chomp.to_sym
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  i = 0
  while i < names.length
    puts "#{names[i][:name]} from the #{names[i][:cohort]} cohort".center(100)
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#call the methods to make things happen
students = input_students
print_header
print(students)
print_footer(students)
