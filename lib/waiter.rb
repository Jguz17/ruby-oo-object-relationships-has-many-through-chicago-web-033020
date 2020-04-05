class Waiter

    attr_accessor :name, :yrs_experience
  
    @@all = []
  
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all.push(self)
    end
  
    def self.all
      @@all
    end
  
    def new_meal(customer, total, tip=0)
      Meal.new(self, customer, total, tip)
    end
  
    def meals
      Meal.all.select do |meal|
        meal.waiter == self 
      end
    end
  
    def best_tipper
      best_tipped_meal = meals.max do |meal_a, meal_b|
        # a <=> b :=
            # if a < b then return -1
            # if a = b then return  0
            # if a > b then return  1
            # if a and b are not comparable then return nil
        # source : https://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator
        meal_a.tip <=> meal_b.tip
      end
    
      best_tipped_meal.customer
    end
  end