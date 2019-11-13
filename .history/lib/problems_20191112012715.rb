require "byebug"
# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    multiple = [num_1, num_2].max
    until multiple % num_1 == 0 && multiple % num_2 == 0
        multiple += multiple
    end
    multiple
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigrams = Hash.new(0)
    str.each_char.with_index { |c, i| str[i+1] && bigrams[c+str[i+1]] += 1 }
    bigrams.reduce { |max, hash| hash[1] > max[1] ? hash : max }[0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        inverse = {}
        self.each { |k, v| inverse[v] = k }
        inverse
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        pairs = 0
        self.each_with_index { |e, i| self.each_with_index { |e2, i2| pairs += 1 if self[i] + self[i2] == num } }
        pairs/2
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new { |ele_1, ele_2| ele_1 <=> ele_2 }
        
        self.each_index { |idx|
            self[idx+1] && if prc.call(self[idx], self[idx+1]) > 0
                self[idx], self[idx+1] = self[idx+1], self[idx]
            end
        }

        if self.sorted?(prc)
            self
        else
            self.bubble_sort(&prc)
        end
    end

    def sorted?(prc)
        self.each_index { |idx|
            self[idx+1] && if prc.call(self[idx], self[idx+1]) > 0
                return false
            end
        }
        return true
    end
end
