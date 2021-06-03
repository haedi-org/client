class Structure
    attr_reader :document, :structure, :data
    
    def initialize(document, rules)
        @document = document
        @rules = rules
        @group_count = rules.length
        @data = groups()
        # Load structure data
        @data.each do |group, lines|
            lines.each { |line| puts "#{group}\t#{line}" }
            puts "\n"
        end
    end

    def exists_in_group?(tag, group_no, order = [])
        order << group_no
        @rules[group_no.to_s].each do |value|
            if value.is_number?
                return exists_in_group?(tag, value, order)
            elsif value == tag
                return true, order
            end
        end
        return false, order
    end

    def groups()
        # Initialize values
        lines_dup, data = @document.lines.dup, {}
        # Remove document tags (UNA, UNH, ...)
        until @rules["0"].include?(lines_dup.first.tag.value)
            lines_dup = lines_dup[1..-1]
        end
        # Breakdown by group
        line_no, group_no = 0, 0
        until (line_no >= lines_dup.length) or (group_no >= @group_count)
            line = lines_dup[line_no]
            exists, order = exists_in_group?(line.tag.value, group_no)
            if exists
                if data.key?(group_no)
                    data[group_no] << line.raw
                else
                    data[group_no] = [line.raw]
                end
                line_no += 1
            else
                group_no += 1
            end
        end
        # Return
        return data
    end
end