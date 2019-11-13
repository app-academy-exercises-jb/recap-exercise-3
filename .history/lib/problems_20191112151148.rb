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
    primes = first_n_primes(approx_square(num))
    debugger
    primes.each { |p| 
        primes.each { |p2|  
            true if p2 * p == num
        } 
    }
    false
end

def first_n_primes(num)
    primes = []

    (num+1).times do |factor|
        debugger
        if is_prime?(factor)
            primes << factor
        end
    end

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

def approx_square(num)
    i = 1
    while i*i < num
        i += 1
    end
    i
end

__END__
rspec ./spec/problems_spec.rb:42 # General Problems #bi_prime?(num) should take a number, n, and return true iff n is a positive integer that can be obtained by multiplying two prime numbers
rspec ./spec/problems_spec.rb:53 # General Problems #vigenere_cipher(str, num arr) should take a string and an array of keys, and apply the vignere cipher to the string with each key in turn
rspec ./spec/problems_spec.rb:63 # General Problems #vowel_rotate(str) should return the unique elements of an array
rspec ./spec/problems_spec.rb:76 # Proc Problems String#select should take a proc as an arg, and return the chars of the string that satisfy the proc
rspec ./spec/problems_spec.rb:84 # Proc Problems String#map! should take a proc as an arg, and return the same string with each char mapped with the proc
rspec ./spec/problems_spec.rb:115 # Recursion Problems #multiply(num_1, num_2) should return the product of the two numbers
rspec ./spec/problems_spec.rb:127 # Recursion Problems #lucas_sequence(num) should return an array containing the first num numbers in the lucas sequence
rspec ./spec/problems_spec.rb:138 # Recursion Problems #prime_factorization(num) should return an array containing the prime factorization of num