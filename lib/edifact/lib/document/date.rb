def interpret_date(d, f)
    str = case f
    when "2"   # DDMMYY
        "#{d[0,2]}/#{d[2,2]}/#{d[4,2]}"
    when "3"   # MMDDYY
        "#{d[2,2]}/#{d[0,2]}/#{d[4,2]}"
    when "4"   # DDMMCCYY
        "#{d[0,2]}/#{d[2,2]}/#{d[4,4]}"
    when "101" # YYMMDD
        "#{d[4,2]}/#{d[2,2]}/20#{d[0,2]}"
    when "102" # CCYYMMDD
        "#{d[6,2]}/#{d[4,2]}/#{d[0,4]}"
    when "203" # CCYYMMDDHHMM
        "#{d[6,2]}/#{d[4,2]}/#{d[0,4]} #{d[8,2]}:#{d[10,2]}"
    when "204" # CCYYMMDDHHMMSS
        "#{d[6,2]}/#{d[4,2]}/#{d[0,4]} #{d[8,2]}:#{d[10,2]}:#{d[12,2]}"
    when "401" # HHMM
        "#{d[0,2]}:#{d[2,2]}"
    else
        d
    end
    # Return value
    unless str == nil
        return str
    else
        return nil
    end
end

#   2, DDMMYY
#   3, MMDDYY
#   4, DDMMCCYY
#   5, DDMMCCYYHHMM
#   6, CCYYMMB
#   7, CCYYMMW
#   8, CCYYMMDDS
#   9, CCYYMMDDPP
#  10, CCYYMMDDTHHMM
# 101, YYMMDD
# 102, CCYYMMDD
# 103, YYWWD
# 104, MMWW-MMWW
# 105, YYDDD
# 106, MMDD
# 201, YYMMDDHHMM
# 202, YYMMDDHHMMSS
# 203, CCYYMMDDHHMM
# 204, CCYYMMDDHHMMSS
# 205, CCYYMMDDHHMMZHHMM
# 206, YYMMDDHHMMZHHMM
# 207, YYMMDDHHMMSSZHHMM
# 208, CCYYMMDDHHMMSSZHHMM
# 209, HHMMSSZHHMM
# 210, HHMMSSZHHMM-HHMMSSZHHMM
# 301, YYMMDDHHMMZZZ
# 302, YYMMDDHHMMSSZZZ
# 303, CCYYMMDDHHMMZZZ
# 304, CCYYMMDDHHMMSSZZZ
# 305, MMDDHHMM
# 306, DDHHMM
# 307, CCYYMMDDHHMMSSFFF
# 308, CCYYMMDDHHMMZZZ-CCYYMMDDHHMMZZZ
# 401, HHMM
# 402, HHMMSS
# 404, HHMMSSZZZ
# 405, MMMMSS
# 406, ZHHMM
# 501, HHMMHHMM
# 502, HHMMSS-HHMMSS
# 503, HHMMSSZZZ-HHMMSSZZZ
# 602, CCYY
# 604, CCYYS
# 608, CCYYQ
# 609, YYMM
# 610, CCYYMM
# 613, YYMMA
# 614, CCYYMMA
# 615, YYWW
# 616, CCYYWW
# 701, YY-YY
# 702, CCYY-CCYY
# 703, YYS-YYS
# 704, CCYYS-CCYYS
# 705, YYPYYP
# 706, CCYYP-CCYYP
# 707, YYQ-YYQ
# 708, CCYYQ-CCYYQ
# 709, YYMM-YYMM
# 710, CCYYMM-CCYYMM
# 713, YYMMDDHHMM-YYMMDDHHMM
# 715, YYWW-YYWW
# 716, CCYYWW-CCYYWW
# 717, YYMMDD-YYMMDD
# 718, CCYYMMDD-CCYYMMDD
# 719, CCYYMMDDHHMM-CCYYMMDDHHMM
# 720, DHHMM-DHHMM
# 801, Year
# 802, Month
# 803, Week
# 805, Hour
# 806, Minute
# 807, Second
# 808, Semester
# 809, Four months period
# 810, Trimester
# 811, Half month
# 812, Ten days
# 813, Day of the week
# 814, Working days