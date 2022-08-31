install:
	bundle install
	
dev:
	bundle exec jekyll serve

run-docker:
	docker run --rm -it --mount type=bind,source=${PWD},target=/srv/jekyll -p 127.0.0.1:4000:4000 jekyll/jekyll:pages jekyll serve
