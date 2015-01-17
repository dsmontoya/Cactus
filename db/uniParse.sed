
# country code
s_\([a-zA-Z][a-zA-Z]\),_{'countryCode': '\1',_

# university name

s_,\(.*\),_, 'universityName': '\1',_

# university domain

s_,\(http.*/\)_, 'universityDomain': '\1'}_
