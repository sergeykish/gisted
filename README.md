Gisted
======

The story
---------

There are a lot of not so good pages in the web. And I would like to help improve projects I use. Or at least show to others how it can be done.

Few steps required:

* take original page
* make some refactoring
* show result

It's easy to get page content. Gist is a great tool to share changes. I am able to access files in raw format (for example [https://gist.github.com/raw/714121/index.html]()). And browser shows them as plain text because of `Content-Type text/plain; charset=utf-8` header.

Here we are
-----------

This application is a proxy that takes data from [Github](http://github.com) and returns it to user with corresponding header. I've hosted it on [Heroku](http://heroku.com). For the gist above it would be [http://gisted.heroku.com/714121/index.html]().

I've also made gist page. It use Gist API to show files in gist [http://gisted.heroku.com/714121/](). Root page shows introduction and form to input gist id.
