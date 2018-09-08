class Fixnum
    def num_to_name(num)
        num_obj = {
            "90" => "ninety",
            "80" => "eighty",
            "70" => "seventy",
            "60" => "sixty",
            "50" => "fifty",
            "40" => "forty",
            "30" => "thirty",
            "20" => "twenty",
            "19"=> "nineteen",
            "18"=> "eighteen",
            "17"=> "seventeen", 
            "16"=> "sixteen",
            "15"=> "fifteen",
            "14"=> "fourteen",
            "13"=> "thirteen",              
            "12"=> "twelve",
            "11" => "eleven",
            "10" => "ten",
            "09" => "nine",
            "08" => "eight",
            "07" => "seven",
            "06" => "six",
            "05" => "five",
            "04" => "four",
            "03" => "three",
            "02" => "two",
            "01" => "one"
        }
        num_obj[num]
    end

    def in_words
        return "zero" if self == 0

        result = []

        digits = get_digits
        digits.each_with_index do |el, idx|

            if idx % 3 == 0

                # test to see if all digits are zero
                is_three_digits_zero = [el, digits[idx+1], digits[idx+2]]
                        .delete_if{|x| !x }.all?{|x| x== "0"}

                # if there is one digit that is not zero, add corresponding unit
                result.unshift("trillion") if idx == 12 && !is_three_digits_zero
                result.unshift("billion") if idx == 9 && !is_three_digits_zero
                result.unshift("million") if idx == 6 && !is_three_digits_zero
                result.unshift("thousand") if idx == 3 && !is_three_digits_zero

                # skip to next iteration if there is an element in the next digit
                if !digits[idx+1]

                    num_arr = ["0", el]
                    num = get_num_under_hundred(num_arr)
                    result.unshift(num) if num

                end
            elsif (idx - 1) % 3 == 0

                # get tens with ones
                num_arr = [el, digits[idx-1]]
                num = get_num_under_hundred(num_arr)
                result.unshift(num) if num

            elsif (idx - 2) % 3 == 0 && el != "0"

                result.unshift("hundred")

                # get hundreds place
                num_arr = ["0", el]
                num = get_num_under_hundred(num_arr)
                result.unshift(num)

            end
        end
        result.join(" ")
    end

    def get_num_under_hundred(arr)
        tens, ones = arr

        if tens == "0" || tens == "1"
            num_str = (tens + ones)
            num_to_name(num_str)

        elsif ones == "0"
            tens = tens + "0"            
            num_to_name(tens)

        else
            tens = tens + "0"
            ones = "0" + ones
            num_to_name(tens) + " " + num_to_name(ones)

        end
    end

    def get_digits
        self.to_i.to_s.chars.reverse
    end
    
end