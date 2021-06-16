class Line
    attr_reader :raw

    def initialize(data, version, chars)
        @raw = data
        @version = version
        @chars = chars
        @data = @raw.dup
        @elements = []
        # Remove last character if segment terminator
        @data = @data[0..-2] if (@data[-1] == @chars.segment_terminator)
        # Split component data elements within line
        @data = @data.split_with_release(
            @chars.data_element_seperator, @chars.release_character
        )
        # Split data elements within components
        @data.map! do |component| 
            component.split_with_release(
                @chars.component_element_seperator, @chars.release_character
            ) 
        end
    end

    def define(loc, code, title, coded = false, version = nil)
        value = val(*loc)
        value = value.join("\n") if value.is_a?(Array)
        return nil if (value == nil) or (value == "") or (value == [])
        version = @version.ref if version == nil && coded
        data = coded ? ref(code, value, version) : nil
        desc, ref = data == nil ? ["", ""] : [data.desc, data.ref]
        return Element.new(
            loc, code, title, desc, value, ref, coded
        )
    end

    def val(a, b = nil, code = nil, version = nil)
        return nil unless (len() > a) && (b == nil || len(a) > b)
        return @data[a] if b == nil
        version = @version.ref if version == nil && code != nil
        return code == nil ? @data[a][b] : ref(code, val(a, b, version))
    end

    def len(index = nil)
        return index == nil ? @data.length : @data[index].length
    end

    def ref(code, value, version = @version.ref, list = "UNCL")
        return nil if value == nil
        code_list = list + "_" + version
        return lookup_reference(code_list, code, value)
    end

    def tag
        # Service tags
        lookup = lookup_tag("40100_0135", val(0, 0))
        return lookup unless lookup == nil
        # Other tags
        lookup = lookup_tag("EDSD", val(0, 0))
        return lookup unless lookup == nil
        # Return with no reference
        return Reference.new(val(0, 0), "", "", val(0, 0))
    end

    def push_elements(elements)
        elements.compact.each { |e| @elements << e }
    end

    def debug
        puts "[ #{tag.ref} ] #{@raw}\n\n"
    end

    def html(codes = [], typed = [], mssge = [], warng = [], error = [])
        return @data.map.with_index { |component, c|
            component.map.with_index { |data, d|
                # Set CSS styling
                clr, fwt = "#2B2B2B", "normal"
                clr, fwt = "#2B2B2B", "bold" if [c, d] == [0, 0]
                clr, fwt = "#3273DC", "bold" if codes.include?([c, d])
                clr, fwt = "#00D1B2", "bold" if typed.include?([c, d])
                clr, fwt = "#D512E2", "bold" if mssge.include?([c, d])
                clr, fwt = "#FFE08A", "bold" if warng.include?([c, d])
                clr, fwt = "#F14668", "bold" if error.include?([c, d])
                style = "color: #{clr}; font-weight: #{fwt}"
                # Return <b> tag with CSS styling
                "<b style='#{style}'>#{data}</b>"
            }.join(@chars.component_element_seperator)
        }.join(@chars.data_element_seperator) + @chars.segment_terminator
    end

    def coded_row(code, title, struct)
        return [code, title, struct.value, struct.ref, struct.desc]
    end

    def header_row(with_ref = true)
        data = tag
        if with_ref
            return ["", "Segment tag", data.value, data.ref, data.desc]
        else
            return ["", "Segment tag", data.value, data.desc]
        end
    end

    def table
        rows = [header_row]
        @elements.each do |e|
            if e.is_a?(Element)
                rows << [
                    e.code, e.title, e.value, e.ref, e.desc
                ]
            elsif e.is_a?(Version)
                rows << [
                    e.code, e.title, e.ref, e.ref, ""
                ]
            end
        end
        return rows
    end
end