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
    if ARGV.include?("--test")
        tests = paths.map.with_index { |a, i| [nil, a, true] }
        unit_test(tests)
    else
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
                    elsif ARGV.include?("--structure")
                        document.structure
                    elsif ARGV.include?("--html")
                        html_copy_btn()
                        document.html
                    elsif ARGV.include?("--timeline")
                        html_timeline(document.timeline)
                    else
                        tests = paths.map.with_index { |a, i| [nil, a, true] }
                        html_unit_test(tests)
                    end
                else
                    tests = paths.map.with_index { |a, i| [nil, a, true] }
                    html_unit_test(tests)
                end
            rescue => exception
                html_error(exception)
                #puts exception.inspect
                #puts exception.backtrace
                exit
            end
        end
    end
end