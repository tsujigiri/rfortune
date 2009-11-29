= cookiejar

http://github.com/tsujigiri/cookiejar

== DESCRIPTION:

This gem provides a library for handling cookie jar files, known from the fortune program.

== FEATURES/PROBLEMS:

== SYNOPSIS:

To instantiate a CookieJar you have to give the relative path to a
cookie jar file as an argument. If there is no such file relative to the
current directory it will be searched beneath /usr/share/games/fortunes.

  cookies = CookieJar.new 'cookie_jar_file'

To get a random cookie from the jar simply do:

  puts cookies.random

== REQUIREMENTS:

To use this gem you need at least one cookie jar file as they are provided by fortune.

== INSTALL:

sudo gem install --source git://github.com/tsujigiri/cookiejar.git

== LICENSE:

(The MIT License)

Copyright (c) 2009 Helge Rausch

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
