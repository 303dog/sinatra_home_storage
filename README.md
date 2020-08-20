
# sinatra_home_storage


Welcome to the Home Storage Application. This is a school project created with the help of Sinatra and a Corneal gem.  After cloning into your local environment you will need to create a (.env) file in the root directory, this is where you will store your SESSION_SECRET= "hash"

Next run: bundle

Copy and paste:  ruby -e "require 'securerandom'; puts SecureRandom.hex(64)"  :into your terminal and hit return, this should create an alphanumeric tag with close to 100 characters.  Once this has been done, go ahead and copy the tag into the .env file you created in the root directory, it should look something like this:

(.env)
1. SESSION_SECRET= "de5f52cafc7cd5f0766e3dea4f414b1ec422c9514ba7e43cb14fa704c5eeba3c8c99ee84a151d99c5106306a9b9f6c6d7dbd2b30bcab3481280a361bfabc9ce9"

Now in your terminal you will type (shotgun) and hit return. You should see something that looks like this:

== Shotgun/Thin on http://127.0.0.1:9393/
Thin web server (v1.7.2 codename Bachmanity)
Maximum connections set to 1024
Listening on 127.0.0.1:9393, CTRL+C to stop

Next , open a browser and type the http:/ into the address bar, this will render the application

Using your email address and name, you will need to create an account to start logging and tracking all your things that you want stored in your personal "vault". NOTE: This application will not allow you do anything unless an account is created.

Hopefully you find this app useful for keeping an updated list of your belongings. If you want to add new or more items remember to log-in and use the "new items" link to add to your "vault"

I don't anticipate any confusion with the operation of this application but if you do find any please feel free to leave notes.
