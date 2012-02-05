## What is it?

Markboard is a *very* simple web app developed to manage notes written in markdown.

I wrote this little app because I was tired of having text files with notes spread around on many different computers and devices. So I wrote this application to centralize my notes in one place.

Markdown takes advantage of HTML 5 and CSS 3 to make it available on mobile phones, tablets and desktop computers.

If you don't know what Markdown is you can read about it here: http://daringfireball.net/projects/markdown/

## Installation on Heroku

```bash
  git clone git://github.com/ricny046/Markboard.git # Clone the repository
  cd Markboard 
  gem install heroku # Installs the Heroku command line tool
  heroku create --stack cedar (The cedar stack must be used) # Adds Markboard to Heroku
  git push heroku master # Pushes the code up to Heroku's servers
  heroku run rake db:migrate # Creates the database
  heroku open # Opens the application in your browser
```

## Geek stuff

It's written in Ruby on Rails 3.2 and uses Twitter Bootstrap (http://twitter.github.com/bootstrap/)

## Upcoming features

* Authenticaton
* Versioning & diff
* Sharing (via e-mail & public url)
* Comments
* Invite people for collaboration
* Attach files to pages
* Autogrow markdown editor
* Dropbox integration

## License

Markboard is released under the MIT license:

www.opensource.org/licenses/MIT
