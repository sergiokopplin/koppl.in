# Use a specific Ruby version compatible with github-pages (e.g., Ruby 2.7 or 3.0)
FROM ruby:3

# Install Bundler and Jekyll
RUN gem install bundler jekyll

# Set the working directory
WORKDIR /srv/jekyll

# Copy local files to the container
COPY . /srv/jekyll

# Install dependencies
RUN bundle install

# Run Jekyll on port 4000
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
