require 'csv'
@students = []

def print_menu
  puts "1. Enter students' details"
  puts "2. Show the students"
  puts "3. Save the list in students.csv"
  puts "4. Load the list form students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
    puts "Thanks for entering the names"
  when "2"
    show_students
    puts "There are all the students"
  when "3"
    save_students
    puts "List saved"
  when "4"
    load_students
    puts "The students from the loaded file are now here"
  when "9"
    puts "Bye!"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the students' names"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp

  while !name.empty? do
    add_to_list(name, :november)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def add_to_list(name, cohort)
  @students << {name: name, cohort: cohort}
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |row|
      name, cohort = row
      add_to_list(name, cohort)
    end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Enter file name, if empty students.csv for default"
  file_name = STDIN.gets.chomp
  if file_name.empty?
    file_name = "students.csv"
  end
  CSV.open(file_name,"w") do |cvs|
    @students.each do |student|
    csv << [student[:name], student[:cohort]]
    end
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = "students.csv"
  end
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

try_load_students
interactive_menu
