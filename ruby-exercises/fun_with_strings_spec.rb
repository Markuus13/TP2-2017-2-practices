require_relative 'fun_with_strings'

RSpec.describe "Fun with strings" do
  describe "#palindrome?" do
    context "when string passed is a palindrome" do
      it "returns true" do
        expect(palindrome? 'level').to eq true
      end

      context "with case characters" do
        it "returns true" do
          expect(palindrome? 'LevEl').to eq true
        end
      end

      context "with nonword characters" do
        it "returns true" do
          expect(palindrome? 'A man, a plan, a canal -- Panama').to eq true
        end
      end
    end

    context "when string passed isn't a palindrome" do
      it "returns false" do
        expect(palindrome? 'genaina').to eq false
      end
    end
  end

  describe "#count_words" do
    it "returns a hash whose keys are words in the string argument" do
      expect(count_words("good night").keys).to contain_exactly("good", "night")
    end

    it "returns a hash whose values are the number of times each word appears" do
      expect(count_words("ruby ruby ruby java python").values).to contain_exactly(3, 1, 1)
    end

    it "ignore case" do
      expect(count_words("DoO beE Doo bEe dOo").values).to contain_exactly(3, 2)
    end

    it "ignore nonwords" do
      expect(count_words("A man, a plan, a canal -- Panama").values).to contain_exactly(3, 1, 1, 1, 1)
    end
  end
end
