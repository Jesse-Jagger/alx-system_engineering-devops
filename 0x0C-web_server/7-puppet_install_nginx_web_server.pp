# A Script to install nginx using puppet

#this command is for package installation
package {'nginx':
  ensure => 'present',
}

#this command is for installing nginx
exec {'install':
  command  => 'sudo apt-get update ; sudo apt-get -y install nginx',
  provider => shell,
}

#this command is to create an index file
exec {'Hello':
  command  => 'echo "Hello World!" | sudo tee /var/www/html/index.html',
  provider => shell,
}

#this command is to configure redirection
exec {'sudo sed -i "s/listen 80 default_server;/listen 80 default_server;\\n\\tlocation \/redirect_me {\\n\\t\\treturn 301 https:\/\/blog.ehoneahobed.com\/;\\n\\t}/" /etc/nginx/sites-available/default':
  provider => shell,
}

#restart web server
exec {'run':
  command  => 'sudo service nginx restart',
  provider => shell,
}
