function set_java_runtime -d 'Switch between Java versions'
	if test (count $argv) -ne 1
		echo "Usage: set_java_runtime <java-version-number>" >&2
		return
	end
	sudo archlinux-java set "java-$argv[1]-openjdk"
end
