def glob_min(list, index)
  list.each_with_index.min[1] ==index    
end

def min_max_reverse(list)
  max=list.each_with_index.max[0]
  index_max=list.each_with_index.max[1]
  min=list.each_with_index.min[0]
  index_min=list.each_with_index.min[1]
  list[index_min]=max
  list[index_max]=min
  return(list)
end

def max_in_interval(list, a, b)
  list.each_with_index.max[1].between?(a,b)     
end

def sred_arifmetich_abs(list)
  list_abs=list.map{|x| 
    if x<0 then 
      x=x*(-1)
    else x
    end}
  return(list_abs.sum/list.length)
end


def new_massif(list)
  if list.empty? then
    return 0
  end
  def sred_arifmetich_abss(list, sum_abs, i)
    if i>=list.length then 
      return (sum_abs/list.length)
    else
      new_i=i+1
      new_sum= sum_abs + list[i]
      sred_arifmetich_abss(list,new_sum,new_i)
    end
  end
  sred_arif=sred_arifmetich_abss(list, 0, 0)
  max_znach=list.max

  #эл-ты больше sred_arif и меньше max_znach
  def new_massiff(list, sred_arif, max_znach, n_list, i)
    if i>=list.length then
      return(n_list)     #Вернет новый лист
    else
      if list[i]>sred_arif && list[i]<max_znach then
        n_list.push(list[i])
      end
      new_i=i+1
      new_massiff(list, sred_arif, max_znach, n_list, new_i)
    end
  end
  new_massiff(list, sred_arif, max_znach, [], 0)
end

file_name = ARGV[0]
array = File.open(file_name) {|file| file.readlines.map(&:to_i)}

puts 'Выберите:'
puts '1. Необходимо определить является ли элемент по указанному индексу глобальным минимумом (ВВЕСТИ ИНДЕКС)
2. Необходимо поменять местами минимальный и максимальный элементы массива.
3. Необходимо проверить наличие максимального элемента массива в интервале. (ВВЕСТИ ИНТЕРВАЛ)
4. Найти среднее арифметическое модулей массива
5. Построить новый массив с элементами, большими, чем среднее арифметическое списка, но меньшими, чем его максимальное значение.'

method_num = STDIN.gets.chomp.to_i


case method_num
  when 1
    puts 'Введите индекс проверяемого элемента:'
    print"index="
    index_el=STDIN.gets.chomp.to_i
    if index_el > array.length then
      puts "Неверный индекс, введите индекс меньше #{array.length}"
    else
      if glob_min(array, index_el-1) then
        print("Элемент по указанному индексу является глобальным минимумом")
      else 
        print("Элемент по указанному индексу не является глобальным минимумом")
      end  
    end

  when 2
    print(min_max_reverse(array))

  when 3
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
      if max_in_interval(array,a,b) then
        print("Максимальный элемент находится в данном интервале")
      else 
        print("Максимальный элемент не находится в данном интервале")
      end
    end

  when 4
    print(sred_arifmetich_abs(array))

  when 5
    print(new_massif(array))

  else 
    puts 'Команды с таким номером нет'
end
