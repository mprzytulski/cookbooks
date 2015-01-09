name             'dbmail'
maintainer       'John Ko'
maintainer_email 'git@johnko.ca'
license          'Apache 2.0'
description      'Installs dbmail'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe           'dbmail', 'Installs dbmail'

%w(freebsd).each do |os|
  supports os
end
