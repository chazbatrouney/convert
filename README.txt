Note: HandbrakeCLI has to be installed.
-----------------------------

To automatically convert downloaded movies on complete.

1. Ensure Downloads appear in Complete folder

2. Copy bin/Complete.scpt to Folder Action Scripts directory
	-	On Snow Leopard - ~/Library/Folder Action Scripts
	-	On Lion - /Library/Scripts/Folder Action Scripts

3. Right click on the Complete Folder and attach the Complete action to it.

4. Errors will be logged to /tmp/convert_log

5. Woo.

-------------------------

To remove nothing tracks:

./bin/remove_nothing.rb DIRECTORY

To convert all movie files in a directory:

./bin/handbrake.rb DIRECTORY

