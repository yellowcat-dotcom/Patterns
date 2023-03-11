class Student
    # создаем методы чтения и записи attr_accessor
    attr_accessor :id
    attr_reader :last_name, :first_name, :paternal_name, :phone, :git, :telegram, :email

    #валидатор телефона
    def self.valid_phone?(phone)
      phone.match(/^\+?[7,8] ?\(?\d{3}\)?-?\d{3}-?\d{2}-?\d{2}$/)
    end

    #валидатор для фамилии имени и отчества
    def self.valid_name?(name)
      name.match(/^[А-Я][а-я]+$/)
    end

     #валидатор для git и telegram
    def self.valid_account?(account)
      account.match(/^@[A-Za-z0-9\-_]+$/)
    end
  
    #валидатор почты
    def self.valid_email?(email)
      email.match(/^[A-Za-z0-9\-_]+@[A-Za-z]+\.([A-Za-z]+\.)*[A-Za-z]+$/)
    end


    # конструктор
    def initialize(last_name, first_name, paternal_name, id:nil, phone:nil, git:nil, telegram:nil, email:nil)
      self.last_name = last_name
      self.first_name = first_name
      self.paternal_name = paternal_name
      self.id = id
      self.git = git
      self.set_contacts(phone:phone, telegram:telegram, email:email)
     
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

    def git=(git)
      raise ArgumentError, "Incorrect value: git=#{git}!" if !git.nil? && !Student.valid_account?(git)
  
      @git = git
    end
  
    def telegram=(telegram)
      raise ArgumentError, "Incorrect value: telegram=#{telegram}!" if !telegram.nil? && !Student.valid_account?(telegram)
  
      @telegram = telegram
    end
  
    def email=(email)
      raise ArgumentError, "Incorrect value: email=#{email}!" if !email.nil? && !Student.valid_email?(email)
  
      @email = email
    end

    def validate
      !git.nil? && !contact.nil?
    end

    def set_contacts(phone: nil, telegram: nil, email: nil)
      self.phone = phone if phone
      self.telegram = telegram if telegram
      self.email = email if email
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