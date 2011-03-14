= little_money

* https://github.com/robrasmussen/little_money

== DESCRIPTION:
The problem: I needed non-floating point calculations to 4 decimal places. 
Much like the money gem, this gem allows you to avoid floating point
errors by performing calculations using whole numbers. Unlike the money
gem, this one supports an arbitrary number of decimal places for things
with sub-cent prices (commodities, etc.)

== FEATURES/PROBLEMS:

Division is floating point, but I didn't need division.

== SYNOPSIS:

See tests for examples. Quickly:

LittleMoney.parse('1.2408') +
LittleMoney.parse('5.4')).round(3).to_s(:dollar) #=> $6.641


== REQUIREMENTS:

None

== INSTALL:

gem install little_money

== DEVELOPERS:

After checking out the source, run:

  $ rake newb

This task will install any missing dependencies, run the tests/specs,
and generate the RDoc.

== LICENSE:

(The MIT License)

Copyright (c) 2011 

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
