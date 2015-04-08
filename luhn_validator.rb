module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    # TODO: use the integers in nums_a to validate its last check digit
    nums_a_reverse = nums_a.reverse
    nums_a_process = nums_a_reverse.each_with_index.map do |num, index|
      if index.odd?
        num = num.to_i * 2
        num.to_s.chars.map(&:to_i).reduce(:+)
      else 
        num.to_i
      end
    end

    checksum = nums_a_process.shift
    sum_of_digits = nums_a_process.reduce(:+)
    sum_of_digits * 9 % 10 == checksum
  end
end
