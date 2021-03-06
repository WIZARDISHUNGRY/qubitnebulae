# Copyright 2014 Qu-Bit Electronix
# Author: Andrew Ikenberry (andrewikenberry@gmail.com)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
# See http://creativecommons.org/licenses/MIT/ for more information.
#
# -----------------------------------------------------------------------------

use 5.010;

system("ls /mnt/memory/* >> /var/tmp/drive_contents");

open FILE, "/var/tmp/drive_contents";

$preset_flag = 0;

while (<FILE>) {
	
	chomp $_;

	if ($_ =~ /\.csd$/i) {
	
		system("csound $_");
	
	} elsif ($_ =~ "preset1\.txt") {

		$preset_flag++;
		
	} elsif ($_ =~ "preset2\.txt") {

		$preset_flag++;		
		
	} elsif ($_ =~ "preset3\.txt") {

		$preset_flag++;
			
	}	

}

if ($preset_flag < 3) {

	system("perl /home/scripts/preset_Initializer.pl");

}

