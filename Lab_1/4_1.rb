def glob_min(list, index)
  if list.each_with_index.min[1] ==index then
    print("Элемент по указанному индексу является глобальным минимумом")
  else
    print("Элемент по указанному индексу не является глобальным минимумом")
  end
end

def min_max_reverse(list)
  max=list.each_with_index.max[0]
  index_max=list.each_with_index.max[1]
  min=list.each_with_index.min[0]
  index_min=list.each_with_index.min[1]
  list[index_min]=max
  list[index_max]=min
  #print(list.each_with_index.min)
  print(list)
end

def max_in_interval(list, a, b)
  if list.each_with_index.max[1].between?(a,b) then
    print("Максимальный элемент находится в данном интервале")
  else
    print("Максимальный элемент не находится в данном интервале")
  end
end


file_name = ARGV[0]
array = File.open(file_name) {|file| file.readlines.map(&:to_i)}
methods = [:glob_min, :min_max_reverse, :max_in_interval, :sred_arifmetich, :new_massif]
puts 'Выберите:'
puts '1. Необходимо определить является ли элемент по указанному индексу глобальным минимумом (ВВЕСТИ ИНДЕКС)
2. Необходимо поменять местами минимальный и максимальный элементы массива.
3. Необходимо проверить наличие максимального элемента массива в интервале. (ВВЕСТИ ИНТЕРВАЛ)
4. Найти среднее арифметическое модулей массива
5. Построить новый массив с элементами, большими, чем среднее арифметическое списка, но меньшими, чем его максимальное значение.'

method_num = STDIN.gets.chomp.to_i

unless method_num.between?(1, methods.length)
  puts 'Команды с таким номером нет'
  return
end

if method_num==1
  puts 'Введите индекс проверяемого элемента:'
  print"index="
  index_el=STDIN.gets.chomp.to_i  
  if index_el > array.length then
    puts "Неверный индекс, введите индекс меньше #{array.length}"
  else
    res = method(methods[method_num-1]).call(array,index_el)
  end
end

if method_num==3
  puts 'Введите границы интервала:'
  print"a="
  a=STDIN.gets.chomp.to_i
  print"b="
  b=STDIN.gets.chomp.to_i
  if a>b then 
    puts 'Введен неправельный интервал'
  end
  if b>array.length then
    puts'неверный интервал'
  else 
    res = method(methods[method_num-1]).call(array,a,b)
  end
end

if method_num!=1&& method_num!=3
  then method(methods[method_num-1]).call(array)
end
