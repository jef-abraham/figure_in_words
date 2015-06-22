USD_TO_INR = 63.54

def in_word(num)
  str = ''
  {
    'crore'    =>  1_00_00_000,
    'lakhs'    =>  1_00_000,
    'thousand' =>  1_000,
    'hundred'  =>  100
  }.each do |word,unit|
    if temp = (num / unit) and temp > 0
      str += " " + temp.to_s + " #{word}"
      num = num % unit
    end    
  end

  str += " " + num.to_s if num > 0
  str.strip
end

def usd_to_inr_word(number)
  return '-' if number.length == 0

  if number =~ /M/i
    number = number.scan(/\d/).join('').to_f * 10_00_000
  elsif number =~ /B/i
    number = number.scan(/\d/).join('').to_f * 100_00_00_000
  end
  
  in_word(USD_TO_INR * number.to_i)
end

puts usd_to_inr_word(ARGV[0])
