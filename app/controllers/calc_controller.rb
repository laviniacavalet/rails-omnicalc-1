class CalcController < ApplicationController

  def application
    render({:template => "layouts/application" })
  end

  def new_square
    render({:template => "calc_templates/new_square" })
end


   def square_results
    @the_num = params.fetch("users_number").to_f

    @the_result = @the_num ** 2
    render({:template => "calc_templates/square_results" })
    
   end

   def new_square_root
    render({:template => "calc_templates/new_square_root" })
   end

  def square_root_results
    @the_num = params.fetch("users_number").to_f
 
  @the_result = Math.sqrt(@the_num) 
  render({:template => "calc_templates/square_root_results" })
  end

  def new_payment
    render({:template => "calc_templates/new_payment" })
  end 

  def payment_results
    @annual_rate = params.fetch("user_apr").to_f
    @monthly_rate = (@annual_rate / 100) / 12
    
    @years = params.fetch("user_years").to_i
    @number_of_payments = @years * 12
  
    @present_value = params.fetch("user_pv").to_f
  
    @monthly_payment = (@monthly_rate * @present_value) / (1 - (1 + @monthly_rate)**(-@number_of_payments))
  
 
    @formatted_annual_rate = (@monthly_rate*1200).to_fs(:percentage, precision: 4)
    @formatted_present_value = @present_value.to_fs(:currency)
    @formatted_monthly_payment = @monthly_payment.to_fs(:currency)
    
    render({ :template => "calc_templates/payment_results"})
  end


  def new_random
    render({:template => "calc_templates/new_random" })
  end

  def random_results
    @min_value = params.fetch("user_min").to_f
  @max_value = params.fetch("user_max").to_f
  
  @random_number = rand(@min_value..@max_value)

  render({:template => "calc_templates/random_results" })
  end
end
