# pine64-config
This tool provides a straight-forward way to configure your Pine64.

To install this tool for your Pine64, you will need to run the following command:

<code>sudo ./install.sh</code>

This will build the scripts that is relevant to your distribution of Linux and installs it to /usr/local/sbin.

Once it is installed, you can execute it with:

<code>sudo pine64-config.sh</code>

Enjoy!


<h2>Source Layout</h2>

<p>main.sh -- Script for the main menu.</p>
<p>install.sh -- Script to build and install this tool.</p>
<p>common/* -- Scripts that is applicable to all distributions.</p>
<p>ubuntu/* -- Ubuntu-specific scripts.</p>
<p>debian/* -- Debian-specific scripts.</p>
<p>opesuse/* -- openSUSE-specific scripts.</p>
