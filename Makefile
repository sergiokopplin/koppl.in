install:
	bundle install
	
dev:
	bundle exec jekyll serve

run-docker:
	docker build -t my-jekyll-site .
	docker run --rm -it -p 127.0.0.1:4000:4000 --mount type=bind,source="${PWD}",target=/srv/jekyll my-jekyll-site
