require "byebug"
def no_dupes(arr)
    unique = []
    arr.each { |ele| unique << ele if arr.find_all { |ele2| ele == ele2 }.length == 1 }
    unique
end

def no_consecutive_repeats?(arr)
    arr.each_with_index.none? { |ele, idx| arr[idx+1] && (arr[idx] == arr[idx+1]) }
end

def char_indices(str)
    chars = Hash.new { |h, k| h[k] = Array.new }
    str.each_char.with_index { |c, idx| chars[c] << idx }
    chars
end

def longest_streak(str)
    chars = char_indices(str)
    
    indices = chars.inject { |max, c| 
        c[1].length >= max[1].length ? c : max
    }

    istart, iend = indices[1][0].to_i, indices[1][-1].to_i

    str[istart..iend]
end

def bi_prime?(num)
    primes = primes_up_to(num/2)
    
    primes.each_with_index { |p, i| 
        primes[i..-1].each { |p2|  
            return true if p2 * p == num
        } 
    }
    false
end

def primes_up_to(num)
    return [] if num < 2
    primes = [2]
    i = 3

    while primes[-1] < num
        if is_prime?(i)
            primes << i
        end
        i += 1
    end

    primes.pop if primes[-1] > num

    primes
end

def is_prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    
    return true
end

def vigenere_cipher(str, keys)
    str.each_char.with_index.map { |c, i| caesar_cipher(c, keys[i % keys.length]) }.join("")
end

def caesar_cipher(message, number)
    number %= 26
    message.each_codepoint.map { |c| (c>96 && c<123) ? (c+number > 122 ? (((c+number) % 123) + 97).chr : (c+number).chr) : c.chr }.join("")
end

def vowel_rotate(str, num=1)
    vowels = Hash.new
    rotated = Hash.new

    #fill in our vowels
    str.each_char.with_index { |chr, idx| vowels[idx] = chr if /[aeiou]/i.match?(chr) }
    
    #rotate them
    vowels.keys.each_with_index { |k, i| 
        rotated[k] = vowels.values[i-num]
    }

    #and replace em
    str.each_char.with_index.map { |c, i| rotated[i] ? rotated[i] : c }.join("")
end

class String
    def select(&prc)
        prc ||= Proc.new { |c| false }

        selected = []

        self.each_char.with_index { |c, i| 
            selected << c if prc.call(c)
        }

        selected.join("")
    end

    def map!(&prc)
        prc ||= Proc.new { |c| c }

        self.length.times { |c| self[c] = prc.call(self[c], c) }

        self 
    end
end

def multiply(num_1, num_2)

    if num_1 == 0 || num_2 == 0
        0
    elsif num_2 == 1
        num_1
    elsif num_2 > num_1
        multiply(num_2, num_1)
    elsif (num_1 < 0) ^ (num_2 < 0)
        0 - multiply(num_1.abs, num_2.abs)
    elsif num_1 < 0 && num_2 < 0
        multiply(num_1.abs, num_2.abs)
    else
        multiply(num_1, num_2 - 1) + num_1
    end
end

def lucas_sequence(num, lucas=[])
    if num == lucas.length
        return lucas
    elsif lucas.length + 1 <= num
        if lucas.length == 0
            lucas_sequence(num, [2])
        elsif lucas.length == 1
            lucas_sequence(num, [2, 1])
        else
            lucas << lucas[-1] + lucas[-2]
            lucas_sequence(num, lucas)
        end
    else
        lucas
    end
end

def prime_factorization(num, primes=[], idx=2)
    if num < 2
        return nil
    end

    if primes.empty?
        idx += 1 until num % idx == 0
        primes.push(idx)
        prime_factorization(num, primes)
    elsif primes.reduce(:*) / num == 1
        primes
    else
        new_num = num / primes.reduce(:*)
        idx += 1 until new_num % idx == 0
        primes.push(idx)
        prime_factorization(num, primes)
    end

end

def iterative_prime_factorization(num)
    primes = primes_up_to(approx_square(num))
    primes.select! { |factor| num % factor == 0 }
    factors = []
    while num != 1
        factor = primes.find { |i| i % num == 0 }
        factor && num /= factor
    end
    factors
end

def approx_square(num)
    i = 1
    while i*1 < num
        i += 1
    end
    i
end