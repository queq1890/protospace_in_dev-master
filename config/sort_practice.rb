students = []

def bubble_sort(students)
  l = students.length
  for i in 1..l do
    for j in 1..(l-i) do
      if students[j - 1][:score] < students[j][:score]
        t = students[j][:score]
        students[j][:score] = students[j - 1][:score]
        students[j - 1][:score] = t
      end
    end
  end
  return students
end

def quick_sort(students)
  return students if students.length < 2
  pivot = students.shift
  pivot = pivot[:score]

  smallers = []
  biggers = []
  students.each do |num|
      if num[:score] < pivot
          smallers << num
      else # num >= pivot
          biggers << num
      end
  end
  smallers.quick_sort + [pivot] + biggers.quick_sort
end

def student_info(students)
  student = {}

  puts "生徒の名前を入力してください:"
  student[:name] = gets.to_s

  puts "得点を入力してください:"
  student[:score] = gets.to_i

  students << student
end

def sort_student(students)
  line = "--------------------------"

  puts line
  students.each do |student|
    puts "#{student[:name]} : #{student[:score]} "
  end
  puts line
end

while true do
  puts "得点を入力しますか: [0]yes [1]no"
  input = gets.to_i

  if input == 0
    student_info(students)
  else
    quick_sort(students)
    sort_student(students)
  end
end
