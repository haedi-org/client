DEFAULT_SEGMENT_TERMINATOR = '\''

Punctuation = Struct.new(
    :component_element_seperator,
    :data_element_seperator,
    :decimal_mark,
    :release_character,
    :segment_terminator
)

class String
    def split_with_release(split_char, release_char)
        temp, word, is_released = [], "", false
        self.chars.each_with_index do |char, index|
            if is_released
                word += char
                is_released = false
            elsif char == split_char
                temp << word
                word = ""
            elsif char == release_char
                is_released = true
            elsif index == self.length - 1
                word += char
                temp << word
            else
                word += char
            end
        end
        return temp
    end
end