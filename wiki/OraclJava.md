# Installation oracle java

1. Download JDK from [oracle website](https://www.oracle.com/java/technologies/javase-downloads.html) in .tar.gz format
2. Create java directory under /user/local
	```bash
	sudo mkdir /usr/local/java
	```
3. Extract download file
	```bash
	tar -xvf YOUR_DOWNLOADED_FILE.tar.gz
	```
4. Move extracted file to the java directory
	```bash
	mv EXTRACTED_DIRECTORY /usr/local/java/
	
	```
5. Add the following lines into your .profile directory under home
	```bash
	vim ~/.profile
	
	JAVA_HOME=/usr/local/java/EXTRAXTED_DIRECTORY
	PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
	export JAVA_HOME
	export PATH
	```
4. Run following commands
	```bash
	sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/EXTRAXTED_DIRECTORY/bin/java" 1
	
	sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/EXTRAXTED_DIRECTORY/bin/javac" 1
	
	sudo update-alternatives --set java 
	
	sudo update-alternatives --set javac
	```
5. Source your .profile
	```bash
	source ~/.profile
	```
6. Check java version
	```bash
	java -version
	```
