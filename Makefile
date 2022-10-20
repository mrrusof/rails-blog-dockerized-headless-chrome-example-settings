IMAGE=ruby-node-chrome:2.6.3

.PHONY: all in-container image rm-image deps setup-db rm-db test enter clean

all: in-container deps setup-db test

in-container:
	@test -f /.dockerenv || (echo This target should be run inside the sandbox. See README.md. && false)

image:
	docker build --tag $(IMAGE) .

rm-image:
	docker rmi $(IMAGE) || true

deps:
	gem install bundler:2.2.31
	bundle install

setup-db:
	bundle exec rake db:migrate

rm-db:
	rm -f db/development.sqlite3

test:
	bundle exec rspec

server:
	bundle exec rails server -b 0.0.0.0

enter:
	docker run --rm --workdir /src --volume `pwd`:/src --tty --interactive --publish 3000:3000 $(IMAGE) /bin/bash

clean: rm-db rm-image
