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
    table_class = "table is-bordered is-striped is-hoverable is-small"
    table_style = "width: 100%; margin-bottom: 0; word-break: break-word;"
    table_style += "font-size: 0.85em;"
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

def html_copy_btn
    click = "copyStdout()"
    icon = "<i id='copy-icon' class='far fa-copy'></i>"
    puts "<a onclick='#{click}'><b>#{icon}<b id='copy-indicator'></b></a>"
end

def html_timeline(times)
    puts "<div class='timeline is-centered' style='padding: 32px'>"
    # 'Start' heading
    puts "<header class='timeline-header'>"
    puts "<span class='tag is-medium is-primary'>Start</span>"
    puts "</header>"
    # Each time item
    times.each do |caption, time|
        content = "<p class='heading'>#{time}</p><p>#{caption}</p>"
        puts "<div class='timeline-item'>"
        puts "<div class='timeline-marker'></div>"
        puts "<div class='timeline-content'>#{content}</div>"
        puts "</div>"
    end
    # 'End heading'
    puts "<header class='timeline-header'>"
    puts "<span class='tag is-medium is-primary'>End</span>"
    puts "</header>"
    puts "</div>"
end

#<div class="timeline">
#  <header class="timeline-header">
#    <span class="tag is-medium is-primary">Start</span>
#  </header>
#  <div class="timeline-item">
#    <div class="timeline-marker"></div>
#    <div class="timeline-content">
#      <p class="heading">January 2016</p>
#      <p>Timeline content - Can include any HTML element</p>
#    </div>
#  </div>
#  <div class="timeline-item">
#    <div class="timeline-marker is-image is-32x32">
#      <img src="https://bulma.io/images/placeholders/32x32.png">
#    </div>
#    <div class="timeline-content">
#      <p class="heading">February 2016</p>
#      <p>Timeline content - Can include any HTML element</p>
#    </div>
#  </div>
#  <header class="timeline-header">
#    <span class="tag is-primary">2017</span>
#  </header>
#  <div class="timeline-item">
#    <div class="timeline-marker is-icon">
#      <i class="fa fa-flag"></i>
#    </div>
#    <div class="timeline-content">
#      <p class="heading">March 2017</p>
#      <p>Timeline content - Can include any HTML element</p>
#    </div>
#  </div>
#  <div class="timeline-header">
#    <span class="tag is-medium is-primary">End</span>
#  </div>
#</div>