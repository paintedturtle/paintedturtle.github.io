remotes:
	git remote add paintedturtle.xyz core@paintedturtle.xyz:spaces/paintedturtle.xyz.git
	git remote add paintedturtle.github.io git@github.com:paintedturtle/paintedturtle.github.io.git

nodes:
	make paintedturtle.github.io
	make paintedturtle.xyz

paintedturtle.xyz:
	ssh core@paintedturtle.xyz "mkdir -p spaces/paintedturtle.xyz; git init --bare spaces/paintedturtle.xyz.git"
	scp paintedturtle.xyz.git-post-receive-hook core@paintedturtle.xyz:spaces/paintedturtle.xyz.git/hooks/post-receive
	ssh core@paintedturtle.xyz "chmod +x spaces/paintedturtle.xyz.git/hooks/post-receive"
	git push paintedturtle.xyz master

paintedturtle.github.io:
	git push paintedturtle.github.io master

pow:
	mkdir -p ~/.pow/paintedturtle
	ln -s $(PWD) ~/.pow/paintedturtle/public

unlink_pow:
	rm -rf ~/.pow/paintedturtle
