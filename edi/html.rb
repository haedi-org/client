def html_table_row(params, type = "td", cols = 5, classes = "is-info is-light")
    puts "<tr>"
    params << "" until params.length >= cols
    params.each_with_index do |param, index|
        if (type == "td") && (index == 2)
            param = "<span class=\"tag #{classes}\">#{param}</span>"
        end
        puts "<#{type} style=\"vertical-align: middle\">#{param}</#{type}>"
    end
    puts "</tr>"
end

def segment_to_html_table(line)
    cols = line.raw[0, 3] == "UNA" ? 4 : 5
    # Begin table
    unless cols == 4
        headers = ['Code', 'Title', 'Value', 'Reference', 'Description']
    else
        headers = ['Code', 'Title', 'Value', 'Description']
    end
    table_class = "table is-bordered is-striped is-hoverable"
    table_style = "width: 100%; margin-bottom: 0; word-break: break-word;"
    puts "<table class='#{table_class}' style='#{table_style}'>"
    puts "<colgroup>"
    puts "<col style='width: 64px; max-width: 64px'>"    # Code
    puts "<col style='width: 160px; max-width: 160px'>"  # Title
    puts "<col style='width: 160px; max-width: 120px'>"  # Value
    unless cols == 4
        puts "<col style='width: 25%; max-width: 25%'>"  # Reference
    end
    puts "<col>"                                         # Description
    puts "</colgroup><thead>"
    html_table_row(headers, 'th', cols)
    puts "</thead><tbody>"
    # Line
    line.table.each_with_index do |row, index|
        classes = index == 0 ? "is-primary" : "is-link"
        html_table_row(row, "td", cols, classes)
    end
    # End table
    puts "</tbody></table>"
end