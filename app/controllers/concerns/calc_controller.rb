class CalcController < ApplicationController
    def flexsquare
        @a_number = params.fetch("pat").to_i
        
        @sq_number = @a_number ** 2
        render("flex_templates/square.html.erb")
    end
end