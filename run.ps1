docker run --rm --volume="${PWD}:/srv/jekyll" -p4000:4000 -it jekyll/jekyll:4.2.0 jekyll serve --livereload --force_polling
