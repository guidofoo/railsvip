require 'spec_helper'

describe Customer do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Customer.create!(@valid_attributes)
  end
  it "customer deberia crearse si le paso todos los datos" 
end
