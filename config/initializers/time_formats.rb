Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}, %Y") }
Time::DATE_FORMATS[:short_db] = lambda { |time| time.strftime("%Y-%m-%d") }