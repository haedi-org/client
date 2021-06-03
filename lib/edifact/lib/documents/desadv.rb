# TODO:
# Turn this into a method you can pass a structure file to
# Then you can have multiple version for one document type
# Also allows for custom documents

class DESADV < Document
    def initialize(lines)
        super(lines)
        @group_count = 26
        @structure = {
             0 => ["BGM", "DTM", "ALI", "MEA", "MOA", "CUX"],
             1 => ["RFF", "DTM"],
             2 => ["NAD", "LOC", 3, 4],
             3 => ["RFF", "DTM",],
             4 => ["CTA", "COM"],
             5 => ["TOD", "LOC", "FTX"],
             6 => ["TDT", "PCD", "TMD", 7],
             7 => ["LOC", "DTM"],
             8 => ["EQD", "MEA", "SEL", "EQA", 9],
             9 => ["HAN", "FTX"],
            10 => ["CPS", "FTX", "QVR", 11, 17],
            11 => ["PAC", "MEA", "QTY", 12, 13],
            12 => ["HAN", "FTX"],
            13 => ["PCI", "RFF", "DTM", 14, 15, 16],
            14 => ["GIR", "DTM"],
            15 => ["GIN", "DLM"],
            16 => ["COD", "MEA", "QTY", "PCD"],
            17 => ["LIN", "PIA", "IMD", "MEA", "QTY", "ALI", "GIN", "GIR", 
                   "DLM", "DTM", "NAD", "TDT", "TMD", "HAN", "FTX", "MOA", 
                   18, 19, 20, 21, 22, 25],
            18 => ["RFF", "NAD", "CTA", "DTM"],
            19 => ["DGS", "QTY", "FTX"],
            20 => ["LOC", "NAD", "DTM", "QTY"],
            21 => ["SGP", "QTY"],
            22 => ["PCI", "DTM", "MEA", "QTY", 23, 24],
            23 => ["GIN", "DLM"],
            24 => ["HAN", "FTX", "GIN"],
            25 => ["QVR", "DTM"]
        }
        groups().each do |group, lines|
            lines.each do |line|
                puts "#{group}\t#{line}"
            end
            puts "\n"
        end
    end

    def exists_in_group?(tag, group_no, order = [])
        order << group_no
        @structure[group_no].each do |value|
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
        lines_dup, data = @lines.dup, {}
        # Remove document tags (UNA, UNH, ...)
        until @structure[0].include?(lines_dup.first.tag.value)
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