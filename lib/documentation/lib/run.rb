START_HTML = "<article class=\"is-info block\">"
SEARCH_HTML = "<div class=\"panel-block\"><p class=\"control has-icons-left\"><input class=\"input is-info\" type=\"text\" placeholder=\"Search\"><span class=\"icon is-left\"><i class=\"fas fa-search\" aria-hidden=\"true\"></i></span></p></div>"
START_BUTTONS_HTML = "<p class=\"panel-tabs\">"
ACTIVE_CLASS = " class=\"is-active\""
END_BUTTONS_HTML = "</p>"
END_HTML = "</article>"

def html_header(caption)
    return "<p class=\"panel-heading\">#{caption}</p>"
end

def html_nav_button(id, caption, style)
    return "<a id=\"#{id}\" onclick=\"on#{caption}BtnClick()\"#{style}>#{caption}</a>"
end

def html_list_item(caption)
    icon = "fas fa-book"
    return "<a class=\"panel-block is-active\"><span class=\"panel-icon\"><i class=\"#{icon}\" aria-hidden=\"true\"></i></span>#{caption}</a>"
end

def html_list(tag)
    html = []
    # Start
    html << START_HTML
    # Header
    # html << html_header("Documentation")
    # Buttons
    html << START_BUTTONS_HTML
    html << html_nav_button("allBtn"    , "All"    , tag == "all"     ? ACTIVE_CLASS : "")
    html << html_nav_button("publicBtn" , "Public" , tag == "public"  ? ACTIVE_CLASS : "")
    html << html_nav_button("privateBtn", "Private", tag == "private" ? ACTIVE_CLASS : "")
    html << END_BUTTONS_HTML
    # Search
    html << SEARCH_HTML
    # List items
    html << html_list_item("Test")
    html << html_list_item("Test item")
    # End
    html << END_HTML
    # Return
    return html.join()
end

puts html_list("all"    ) if ARGV.include?("--all")
puts html_list("public" ) if ARGV.include?("--public")
puts html_list("private") if ARGV.include?("--private")

#   <article class="panel is-info block">
#       <p class="panel-heading">
#           Documentation
#       </p>
#       <p class="panel-tabs">
#           <a id="idBtn" class="is-active">All</a>
#           <a id="publicBtn">Public</a>
#           <a id="privateBtn">Private</a>
#       </p>
#       <div class="panel-block">
#           <p class="control has-icons-left">
#               <input class="input is-info" type="text" placeholder="Search">
#               <span class="icon is-left">
#                   <i class="fas fa-search" aria-hidden="true"></i>
#               </span>
#           </p>
#       </div>
#       <a class="panel-block is-active">
#           <span class="panel-icon">
#               <i class="fas fa-book" aria-hidden="true"></i>
#           </span>
#           bulma
#       </a>
#   </article>