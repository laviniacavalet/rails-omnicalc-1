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

end
