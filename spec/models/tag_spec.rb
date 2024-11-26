require "rails_helper"

describe Tag do 
  it "requires name to be present" do
    tag = Tag.new(name: "programming")
    expect(tag).to be_valid
  end 

  it "is valid without a name" do
    tag = Tag.new(name: nil)
    expect(tag).to be_valid
  end
end