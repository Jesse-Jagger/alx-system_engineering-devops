# we are using puppet to make changes to the default ssh config file
# so that one can connect to a server without typing a password.

include stdlib

file_line { 'SSH Private Key':
  path               => '/etc/ssh/ssh_config',
  line               => '    IdentityFile ~/.ssh/school',
  match              => '^[#]+[\s]*(?i)IdentityFile[\s]+~/.ssh/id_rsa$',
  replace            => true,
  append_on_no_match => true
}

# Regex expressions match explanation
#
# ^ means beginning of the line
# [#]* means atleast one hash character
# [\s]* means zero or more white space characters
# (?i) means IdentityFile case insensitive "IdentityFile"
# [\s]+ means at least one whitespace character
# ~/.ssh/id_rsa means The ssh private key file path we want to replace
# $ means end of the line

file_line { 'Deny Password Auth':
  path               => '/etc/ssh/ssh_config',
  line               => '    PasswordAuthentication no',
  match              => '^[#]+[\s]*(?i)PasswordAuthentication[\s]+(yes|no)$',
  replace            => true,
  append_on_no_match => true
}

# Regex expressions match explanation
#
# ^ means beginning of the line
# [#]* means atleast one hash character
# [\s]* means zero or more white space characters
# (?i) means PasswordAuthentication case insensitive "PasswordAuthentication"
# [\s]+ means at least one whitespace character
# (yes|no) means with the value "yes" or the value "no"
# $ means end of the line
