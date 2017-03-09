class WomanworkerController < ApplicationController
  def home
  end
  def new
  	@case = Case.new
  end

  def create	
    @case = Case.create(case_params)
    if @case.save
      redirect_to '/worker'
    else
      render 'new'
    end
  
  end

  def case_params
        params.require(:case).permit(:continent , :country ,:district ,:case_category, :description )
  end
end
