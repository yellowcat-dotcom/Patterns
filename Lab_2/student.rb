class Student
    # создаем методы чтения и записи attr_accessor
    attr_accessor :id, :git, :telegram, :email
    attr_reader :last_name, :first_name, :paternal_name, :phone

    #валидатор телефона
    def self.valid_phone?(phone)
      phone.match(/^\+?[7,8] ?\(?\d{3}\)?-?\d{3}-?\d{2}-?\d{2}$/)
    end

    #валидатор для фамилии имени и отчества
    def self.valid_name?(name)
      name.match(/^[А-Я][а-я]+$/)
    end

    # конструктор
    def initialize(last_name, first_name, paternal_name, id:nil, phone:nil, git:nil, telegram:nil, email:nil)
      self.last_name = last_name
      self.first_name = first_name
      self.paternal_name = paternal_name
      self.id = id
      self.phone = phone
      self.git = git
      self.telegram = telegram
      self.email = email
    end


    #сеттер
    def phone=(phone)
      raise ArgumentError, "Incorrect value: phone=#{phone}!" if !phone.nil? && !Student.valid_phone?(phone)
      @phone = phone
    end


     def first_name=(first_name)
      raise ArgumentError, "Incorrect value: first_name=#{first_name}!" if !first_name.nil? && !Student.valid_name?(first_name)
  
      @first_name = first_name
    end
  

    def last_name=(last_name)
      raise ArgumentError, "Incorrect value: last_name=#{last_name}!" if !last_name.nil? && !Student.valid_name?(last_name)
  
      @last_name = last_name
    end
  

    def paternal_name=(paternal_name)
      raise ArgumentError, "Incorrect value: paternal_name=#{paternal_name}!" if !paternal_name.nil? && !Student.valid_name?(paternal_name)
  
      @paternal_name = paternal_name
    end


    def to_s
      res = self.last_name + " " + self.first_name + " " + self.paternal_name  
      res+=" id: #{self.id}" unless self.id.nil?
      res+=" phone: #{self.phone}" unless self.phone.nil?
      res+=" git: #{self.git}" unless self.git.nil?
      res+=" telegram: #{self.telegram}" unless self.telegram.nil?
      res+=" email: #{self.email}" unless self.email.nil?
      res
    end
  end