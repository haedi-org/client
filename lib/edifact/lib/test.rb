TESTS = [
    ["Line separated INVRPT message"                           , "./tests/punct_good_0.edi", true ],
    ["Single line INVRPT message"                              , "./tests/punct_good_1.edi", true ],
    ["Line separated INVRPT message w/ UNA segment"            , "./tests/punct_good_2.edi", true ],
    ["Line separated INVRPT message w/o segment terminators"   , "./tests/punct_bad_0.edi" , false],
    ["Single line INVRPT message w/o segment terminators"      , "./tests/punct_bad_1.edi" , false],
    ["INVRPT message w/ UNA segment and no segment terminators", "./tests/punct_bad_2.edi" , false],
    ["Single line made-up INVXXX message"                      , "./tests/mssge_bad_0.edi" , false],
    ["Single line message w/ empty message type (0065)"        , "./tests/mssge_bad_1.edi" , false],
    ["Single line message w/ UNH and w/o UNT segment"          , "./tests/mssge_bad_2.edi" , false],
    ["Line separated message w/ UNZ and w/o UNB segment"       , "./tests/mssge_bad_3.edi" , false],
    ["Single line message w/ made-up LXN segment"              , "./tests/segmt_bad_0.edi" , false],
]

def get_segment_terminator(data)
    # Remove any control characters
    data.map! { |line| line.gsub("\n", "").gsub("\r", "") }
    # Return segment terminator
    if data[0][0, 3] == "UNA"
        return data[0].length == 9 ? data[0][8] : nil
    else
        return DEFAULT_SEGMENT_TERMINATOR
    end
end

def segment_terminator_test(data)
    segment_terminator = get_segment_terminator(data)
    return false, ["invalid 'UNA' segment"] if segment_terminator == nil
    # Check if segment terminator is valid
    if data.join == data.join.split(segment_terminator)[0]
        return false, ["invalid segment terminator"]
    end
    return true, ["valid segment terminator"]
end

def document_name_test(data, documents = [])
    documents = strip_csv_column(EDIFACT_DOCUMENTS_PATH, 1) if documents == []
    document = Document.new(data)
    if document.message == nil
        return false, ["empty message type"]
    else
        unless documents.include?(document.message.value)
            return false, ["unknown message type '#{document.message.value}'"]
        else
            return true, ["valid message type"]
        end
    end
end

def document_segment_test(data, segments = [])
    segments = strip_csv_column(EDIFACT_SEGMENTS_PATH, 0) if segments == []
    document = Document.new(data)
    for line in document.lines do
        unless segments.include?(line.tag.value)
            return false, ["unknown message segment '#{line.tag.value}'"]
        end
    end
    return true, ["valid message segments"]
end

def document_envelope_test(data, envelopes = [["UNB", "UNZ"], ["UNH", "UNT"]])
    document = Document.new(data)
    segments = document.lines.map { |line| line.tag.value }.uniq
    for a, b in envelopes do
        if segments.include?(a) != segments.include?(b)
            return false, ["invalid '#{a + b}' envelope"]
        end
    end
    return true, ["complete envelopes"]
end

def valid_document?(data)
    report = []
    report << segment_terminator_test(data.dup)
    return false unless report[0][0]
    report << document_name_test(data.dup)
    report << document_segment_test(data.dup)
    report << document_envelope_test(data.dup)
    return report.map { |bool, error| bool }.all?
end

def unit_test(tests = TESTS)
    def valid_report?(report)
        actual = true
        report.each { |r| actual = false if r[1] == false }
        return actual
    end
    require 'colorize'
    index = 0
    passed = 0
    documents = strip_csv_column(EDIFACT_DOCUMENTS_PATH, 1)
    segments = strip_csv_column(EDIFACT_SEGMENTS_PATH, 0)
    for scenario, path, expected in tests do
        report = []
        # Read lines from path
        data = read_document(path)
        # Segment terminator test
        report << ["segment terminator test"] + segment_terminator_test(data.dup)
        # Only continue tests if segment terminator is valid
        if valid_report?(report)
            report << ["document name test"] + document_name_test(data.dup, documents)
            report << ["document segment test"] + document_segment_test(data.dup, segments)
            report << ["document envelope test"] + document_envelope_test(data.dup)
        end
        # Completed tests
        actual = valid_report?(report)
        is_failure = actual != expected
        passed += 1 unless is_failure
        # Print scenario
        color = is_failure ? :red : :green
        title = "Scenario #{(index += 1).to_s.rjust(2, "0")}. [#{File.basename(path)}]"
        title += " \"#{scenario}\"" unless scenario == nil or scenario == ""
        puts title.colorize(color)
        # Print report
        for desc, actual, output in report do
            symbol = actual ? "✓".colorize(:green) : "✗".colorize(:red)
            output = (output.empty? ? desc : output.join(", ")).colorize(actual ? :light_green : :light_red)
            puts "  #{symbol} #{output}"
        end
        puts ""
    end
    puts "Completed #{tests.length} scenario(s)."
    puts "#{passed} passed; #{tests.length-passed} failed.", "\n"
end

#<div class="notification is-success"></div>
def html_unit_test(tests = TESTS)
    def valid_report?(report)
        actual = true
        report.each { |r| actual = false if r[1] == false }
        return actual
    end
    require 'colorize'
    index = 0
    passed = 0
    documents = strip_csv_column(EDIFACT_DOCUMENTS_PATH, 1)
    segments = strip_csv_column(EDIFACT_SEGMENTS_PATH, 0)
    for scenario, path, expected in tests do
        report = []
        # Read lines from path
        data = read_document(path)
        # Segment terminator test
        report << ["segment terminator test"] + segment_terminator_test(data.dup)
        # Only continue tests if segment terminator is valid
        if valid_report?(report)
            report << ["document name test"] + document_name_test(data.dup, documents)
            report << ["document segment test"] + document_segment_test(data.dup, segments)
            report << ["document envelope test"] + document_envelope_test(data.dup)
        end
        # Completed tests
        actual = valid_report?(report)
        # Print report
        for desc, actual, output in report do
            style = actual ? "is-success" : "is-danger"
            output = (output.empty? ? desc : output.join(", "))
            icon_type = actual ? "fas fa-check-circle" : "fas fa-times-circle"
            icon = "<i class=\"#{icon_type}\" style=\"padding-right: 8px\"></i>"
            puts "<div class=\"notification p-2 m-0 #{style}\">#{icon}#{output}</div>"
        end
    end
end

def website_unit_test(tests = TESTS)
    def valid_report?(report)
        actual = true
        report.each { |r| actual = false if r[1] == false }
        return actual
    end
    index = 0
    passed = 0
    documents = strip_csv_column(EDIFACT_DOCUMENTS_PATH, 1)
    segments = strip_csv_column(EDIFACT_SEGMENTS_PATH, 0)
    for scenario, path, expected in tests do
        report = []
        # Read lines from path
        data = read_document(path)
        # Segment terminator test
        report << ["segment terminator test"] + segment_terminator_test(data.dup)
        # Only continue tests if segment terminator is valid
        if valid_report?(report)
            report << ["document name test"] + document_name_test(data.dup, documents)
            report << ["document segment test"] + document_segment_test(data.dup, segments)
            report << ["document envelope test"] + document_envelope_test(data.dup)
        end
        # Completed tests
        actual = valid_report?(report)
        is_failure = actual != expected
        passed += 1 unless is_failure
        # Print scenario
        color = expected ? "green" : "red"
        flag = expected ? "VALID" : "INVALID"
        puts "Scenario #{(index += 1).to_s.rjust(2, "0")} #{scenario} ... <em class=\"#{color}\">#{flag}</em>"
        puts " " * 12 + "<a href=\"#{path}\">#{File.basename(path)}</a> ... #{Date.today.strftime("%d/%m/%y")}"
        puts ""
        # Print report
        for desc, actual, output in report do
            symbol = actual ? "`" : "x"
            color = actual ? "green" : "red"
            puts " " * 12 + "<em class=\"#{color}\">#{symbol}</em> <em class=\"light-#{color}\">#{output.join(", ")}</em>"
        end
        puts ""
    end
    puts "Completed #{tests.length} scenario(s)."
    puts "#{passed} passed; #{tests.length-passed} failed.", "\n"
end


# │ Scenario 03  Line separated INVRPT message w/ UNA segment ................ <em class="green">VALID</em> │
# │              <a href ="./tests/punct_good_2.edi">punct_good_2.edi</a> ....................................... 27/05/2021 │
# │                                                                                  │
# │              <em class="green">`</em> <em class="light-green">valid segment terminator</em>                                          │
# │              <em class="green">`</em> <em class="light-green">valid message type</em>                                                │