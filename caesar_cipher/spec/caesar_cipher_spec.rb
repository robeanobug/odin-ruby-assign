require_relative '../lib/caesar_cipher'

describe "#caesar_cipher" do
  it "shifts a lowercase string down the alphabet" do
    expect(caesar_cipher('abcde', 5)).to eq("fghij")
  end
  it "wraps from lowercase z to a" do
    expect(caesar_cipher('z', 1)).to eq('a')
  end
  it "wraps from uppercase Z to A" do
    expect(caesar_cipher('Z', 1)).to eq('A')
  end
  it "keeps the string uppercase" do
    expect(caesar_cipher('A', 1)).to eq('B')
  end
  it "ignores punctuation" do
    expect(caesar_cipher('abc!?', 3)).to eq('def!?')
  end
  it "ignores spaces" do
    expect(caesar_cipher('a b c', 3)).to eq('d e f')
  end
end
