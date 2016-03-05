## prime_number.rb
class PrimeNumber
  def self.is_it?(num)
    (2...num).each { |x| return false if num % x == 0 }
    true
  end
end
