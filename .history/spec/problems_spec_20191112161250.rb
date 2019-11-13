require "problems"

describe "General Problems" do

    describe "#no_dupes(arr)" do
        it "should return the unique elements of an array" do
            expect(no_dupes([1, 1, 2, 1, 3, 2, 4])).to eq([3, 4])
            expect(no_dupes(['x', 'x', 'y', 'z', 'z'])).to eq(['y'])
            expect(no_dupes([true, true, true])).to eq([])
        end
    end


    describe "#no_consecutive_repeats?(arr)" do
        it "should return false iff any two consecutive elements are the same" do
            expect(no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])).to eq(true)
            expect(no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])).to eq(false)
            expect(no_consecutive_repeats?([10, 42, 3, 7, 10, 3])).to eq(true)
            expect(no_consecutive_repeats?([10, 42, 3, 3, 10, 3])).to eq(false)
            expect(no_consecutive_repeats?(['x'])).to eq(true)
        end
    end

    describe "#char_indices(str)" do
        it "should return a hash where each key corresponds to the unique chars of a string, the value of which is an array containing the indices where the char is found" do
            expect(char_indices('mississippi')).to eq({"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]})
            expect(char_indices('classroom')).to eq({"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]})
        end
    end

    describe "#longest_streak(str)" do
        it "should return the longest substring" do
            expect(longest_streak('a')).to eq('a')
            expect(longest_streak('accccbbb')).to eq('cccc')
            expect(longest_streak('aaaxyyyyyzz')).to eq('yyyyy')
            expect(longest_streak('aaabbb')).to eq('bbb')
            expect(longest_streak('abc')).to eq('c')
        end
    end

    describe "#bi_prime?(num)" do
        it "should take a number, n, and return true iff n is a positive integer that can be obtained by multiplying two prime numbers" do
            expect(bi_prime?(14)).to eq(true)
            expect(bi_prime?(22)).to eq(true)
            expect(bi_prime?(25)).to eq(true)
            expect(bi_prime?(94)).to eq(true)
            expect(bi_prime?(24)).to eq(false)
            expect(bi_prime?(64)).to eq(false)
        end
    end

    describe "#vigenere_cipher(str, num arr)" do
        it "should take a string and an array of keys, and apply the vignere cipher to the string with each key in turn" do
            expect(vigenere_cipher("toerrishuman", [1])).to eq("upfssjtivnbo")
            expect(vigenere_cipher("toerrishuman", [1, 2])).to eq("uqftsktjvobp")
            expect(vigenere_cipher("toerrishuman", [1, 2, 3])).to eq("uqhstltjxncq")
            expect(vigenere_cipher("zebra", [3, 0])).to eq("ceerd")
            expect(vigenere_cipher("yawn", [5, 1])).to eq("dbbo")
        end
    end

    describe "#vowel_rotate(str, num)" do
        it "should return the string with its vowels rotated num times" do
            expect(vowel_rotate('computer', 1)).to eq('cempotur')
            expect(vowel_rotate('oranges', 1)).to eq('erongas')
            expect(vowel_rotate('headphones', 1)).to eq('heedphanos')
            expect(vowel_rotate('bootcamp', 2)).to eq('boatcomp')
            expect(vowel_rotate('bootcamp', 3)).to eq('bootcamp')
        end
    end
end


describe "Proc Problems" do
    describe "String#select" do
        it "should take a proc as an arg, and return the chars of the string that satisfy the proc" do
            expect("app academy".select { |ch| !"aeiou".include?(ch) }).to eq('pp cdmy')
            expect("HELLOworld".select { |ch| ch == ch.upcase }).to eq('HELLO')
            expect("HELLOworld".select).to eq('')
        end
    end

    describe "String#map!" do
        it "should take a proc as an arg, and return the same string with each char mapped with the proc" do

            word_1 = "Lovelace"
            prc1 = Proc.new { |ch| 
                if ch == 'e'
                    '3'
                elsif ch == 'a'
                    '4'
                else
                    ch
                end
            }

            word_2 = "Dijkstra"
            prc_2 = Proc.new { |ch, i|
                if i.even?
                    ch.upcase
                else
                    ch.downcase
                end
            }

            expect(word_1.map!(&prc_1)).to eq('Lov3l4c3')
            expect(word_2.map!(&prc_2)).to eq('DiJkStRa')
        end
    end
end


describe "Recursion Problems" do
    describe "#multiply(num_1, num_2)" do
        it "should return the product of the two numbers" do
            expect(multiply(3, 5)).to eq(15)
            expect(multiply(5, 3)).to eq(15)
            expect(multiply(2, 4)).to eq(8)
            expect(multiply(0, 10)).to eq(0)
            expect(multiply(-3, -6)).to eq(18)
            expect(multiply(3, -6)).to eq(-18)
            expect(multiply(-3, 6)).to eq(-18)
        end
    end

    describe "#lucas_sequence(num)" do
        it "should return an array containing the first num numbers in the lucas sequence" do
            expect(lucas_sequence(0)).to eq([])
            expect(lucas_sequence(1)).to eq([2])    
            expect(lucas_sequence(2)).to eq([2, 1])
            expect(lucas_sequence(3)).to eq([2, 1, 3])
            expect(lucas_sequence(6)).to eq([2, 1, 3, 4, 7, 11])
            expect(lucas_sequence(8)).to eq([2, 1, 3, 4, 7, 11, 18, 29])
        end
    end

    describe "#prime_factorization(num)" do
        it "should return an array containing the prime factorization of num" do
            expect(prime_factorization(12)).to eq([2, 2, 3])
            expect(prime_factorization(24)).to eq([2, 2, 2, 3])
            expect(prime_factorization(25)).to eq([5, 5])
            expect(prime_factorization(60)).to eq([2, 2, 3, 5])
            expect(prime_factorization(7)).to eq([7])
            expect(prime_factorization(11)).to eq([11])
            expect(prime_factorization(2017)).to eq([2017])
        end
    end
end