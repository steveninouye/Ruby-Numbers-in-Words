class Fixnum
    def num_to_name(num)
        num_obj = {
            1000000000000 => "trillion",
            1000000000 => "billion",
            1000000 => "million",
            1000 => "thousand",
            100 => "hundred",
            90 => "ninety",
            80 => "eighty",
            70 => "seventy",
            60 => "sixty",
            50 => "fifty",
            40 => "forty",
            30 => "thirty",
            20 => "twenty",
            19=> "nineteen",
            18=> "eighteen",
            17=> "seventeen", 
            16=> "sixteen",
            15=> "fifteen",
            14=> "fourteen",
            13=> "thirteen",              
            12=> "twelve",
            11 => "eleven",
            10 => "ten",
            9 => "nine",
            8 => "eight",
            7 => "seven",
            6 => "six",
            5 => "five",
            4 => "four",
            3 => "three",
            2 => "two",
            1 => "one",
            0 => "zero"
        }
        num_obj[num]
    end

    def in_words
        nums_less_than_hundred
    end

    def nums_less_than_hundred
        if self < 21 || (self % 10 == 0 && self < 100)
            num_to_name(self)
        elsif self < 100
            tens = self - (self % 10)
            ones = self % 10
            tens_str = num_to_name(tens)
            ones_str = num_to_name(ones)
            "#{tens_str} #{ones_str}"
        end
    end

    def digits(num)
        digit_arr = []
        while num > 0
            digit_arr << num % 10
            num = (num / 10).floor
        end
        return [0] if digit_arr.length == 0
        digit_arr
    end
end