class Document
    attr_reader :raw, :lines

    def initialize(lines)
        @raw = lines.dup
        @lines = @raw.map { |line| line.chomp }.join
        @version = nil
        # Get critical values from document and reformat
        assign_values
        # Create line object dependant on tag
        @lines.map! do |line|
            begin
                params = [line, @version, @chars]
                case line[0, 3]
                when "UNA"; UNA.new(*params)
                when "UNH"; UNH.new(*params)
                when "UNB"; UNB.new(*params)
                when "UNT"; UNT.new(*params)
                when "UNZ"; UNZ.new(*params)
                when "BGM"; BGM.new(*params)
                when "DTM"; DTM.new(*params)
                when "FTX"; FTX.new(*params)
                when "NAD"; NAD.new(*params)
                when "RFF"; RFF.new(*params)
                when "TAX"; TAX.new(*params)
                when "LIN"; LIN.new(*params)
                when "QTY"; QTY.new(*params)
                when "IMD"; IMD.new(*params)
                when "MEA"; MEA.new(*params)
                when "PIA"; PIA.new(*params)
                when "PRI"; PRI.new(*params)
                when "GIN"; GIN.new(*params)
                when "CPS"; CPS.new(*params)
                when "PCI"; PCI.new(*params)
                when "LOC"; LOC.new(*params)
                when "INV"; INV.new(*params)
                else; Line.new(*params)
                end
            rescue => exception
                puts exception.inspect
                puts exception.backtrace
                exit
            end
        end
    end

    def assign_values
        # Get punctuation values from UNA line
        una = lines[0, 3] == 'UNA' ? lines[0, 9] : nil
        @chars = format_punctuation(una)
        # Split by segment terminator
        terminator = @chars.segment_terminator
        @lines = @lines.split(terminator).map { |line| line + terminator}
        @raw = @lines.dup
        # Get document information
        @lines.each do |line|
            if line[0, 3] == "UNH"
                unh = UNH.new(line, @version, @chars)
                @version = unh.message_version
            end
        end
    end

    def format_punctuation(line = nil)
        unless line == nil
            return UNA.new(line, @version).punctuation
        else
            return Punctuation.new(':', '+', '.', '?', '\'')
        end
    end

    def debug
        @lines.each do |line|
            line.debug
        end
    end

    def highlighted
        @lines.each do |line|
            puts line.html
        end
    end
end

return if ARGV.length == 0
paths = ARGV.map { |param| File.file?(param) ? param : nil }.compact
return if paths.empty?

for path in paths do
    begin
        # Read lines from path
        lines = File.readlines(path, :encoding => 'utf-8')
        document = Document.new(lines)
        if ARGV.include?("--html")
            document.lines.each do |line|
                segment_to_html_table(line)
            end
        elsif ARGV.include?("--debug")
            document.debug
        elsif ARGV.include?("--highlighted")
            document.highlighted
        else
            document.highlighted
        end
    rescue => exception
        puts exception.inspect
        puts exception.backtrace
        exit
    end
end