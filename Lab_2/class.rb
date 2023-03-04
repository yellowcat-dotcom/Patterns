class Student
    # создаем методы чтения и записи attr_accessor
    attr_accessor :last_name, :first_name, :paternal_name, :id, :phone, :git, :telegram, :email

    # конструктор
    def initialize(last_name, first_name, paternal_name, id:nil, phone:nil, git:nil, telegram:nil, email:nil, )
      self.last_name = last_name
      self.first_name = first_name
      self.paternal_name = paternal_name
      self.id = id
      self.phone = phone
      self.git = git
      self.telegram = telegram
      self.email = email
    end
  end