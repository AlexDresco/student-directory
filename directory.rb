def input_students
  puts "Please enter the names, hobbies, country of birth and height of the students"
  puts "To finish, just hit return twice when prompted for name"

  students = []
  puts "Name:"
  name = gets.chomp
  puts "Favourite hobby:"
  hobby = gets.chomp
  puts "Country:"
  country = gets.chomp
  puts "Height"
  height = gets.chomp

  while true do
    students << {name: name, cohort: :november, hobby: hobby,
    country: country, height: height}
    puts "Now we have #{students.count} students"
    puts "Name:"
    name = gets.chomp
    if name.empty?
      break
    end
    puts "Favourite hobby:"
    hobby = gets.chomp
    puts "Country:"
    country = gets.chomp
    puts "Height"
    height = gets.chomp
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
    puts "#{names[i][:name]} from the #{names[i][:cohort]} cohort likes to #{names[i][:hobby]}, comes from #{names[i][:country]} and mesures #{names[i][:height]}"
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
