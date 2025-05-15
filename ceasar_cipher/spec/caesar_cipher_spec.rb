describe "#caesar_cipher" do
  it "returns a string shifted down the alphabet" do
    expect(caesar_cipher('What a string!', 5)). to eql("Bmfy f xywnsl!")
  end
end