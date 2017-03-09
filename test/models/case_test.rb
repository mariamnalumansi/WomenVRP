require 'test_helper'

class CaseTest < ActiveSupport::TestCase

  fixtures :cases

  test "the truth" do
    assert true
  end

  test "should not save a case without required fields" do 
  	caseToSave = Case.new
  	assert_not  caseToSave.save , "saved the case without required fields"

  end


  test "book"  do
  	caseOne = Case.new 	 :continent => cases(:one).continent, 
                         :country => cases(:one).country,
                         :district => cases(:one).district,
                         :case_category => cases(:one).case_category,
                         :description => cases(:one).description,
                         :created_at => cases(:one).created_at 
  	#test if a case can be created
  	assert caseOne.save

  	#test if a case can be read
  	book_copy = Case.find(caseOne.id)
  	assert_equal caseOne.continent,book_copy.continent

  	#test if a case can be updated
  	caseOne.continent = "Asia"
  	assert_equal "Asia" , caseOne.continent
  	assert caseOne.save

  	#test if a case can be deleted
  	assert caseOne.destroy
  end

end
