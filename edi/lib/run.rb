def get_document(lines)
    document = Document.new(lines)
#    document = case document.message.value
#        when "DESADV"; DESADV.new(lines)
#        else; document
#    end
    return document
end

if ARGV.length == 0
    unit_test
else
    paths = ARGV.map { |param| File.file?(param) ? param : nil }.compact
    return if paths.empty?

    for path in paths do
        begin
            # Read lines from path
            lines = read_document(path)
            # Create document
            if valid_document?(lines)
                document = get_document(lines)
                if ARGV.include?("--refs")
                    document.lines.each do |line|
                        segment_to_html_table(line)
                    end
                elsif ARGV.include?("--debug")
                    document.debug
                elsif ARGV.include?("--html")
                    html_copy_btn()
                    document.html
                elsif ARGV.include?("--timeline")
                    html_timeline(document.timeline)
                else
                    document.raw
                end
            else
                puts "Invalid document."
            end
        rescue => exception
            puts exception.inspect
            puts exception.backtrace
            exit
        end
    end
end