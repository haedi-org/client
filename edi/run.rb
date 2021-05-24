return if ARGV.length == 0
paths = ARGV.map { |param| File.file?(param) ? param : nil }.compact
return if paths.empty?

for path in paths do
    begin
        # Read lines from path
        lines = File.readlines(path, :encoding => 'utf-8')
        document = Document.new(lines)
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
    rescue => exception
        puts exception.inspect
        puts exception.backtrace
        exit
    end
end