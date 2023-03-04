require_relative 'class'
#(last_name, first_name, paternal_name, id:nil, phone:nil, git:nil, telegram:nil, email:nil)
student = Student.new('Фамилин', 'Имя', 'Отчествов', id:1)
student_2 = Student.new('Гончаренко', 'Валентина', 'Викторовна', id:2, git:'yellowcat-dotcom', telegram:'@yellowcatdotcom',email:'valentinagoncarenko975@gmail.com')
student_3 = Student.new('Минаков','Владислав','Андреевич',email: "valdos777m@gmail.com")
puts student
puts student_2
puts student_3


