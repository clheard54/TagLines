## TagLine Fun Times

TagLine was inspired by my own yearning for some place to store my favorite quotes, sentences, passages, etc. from books I'm reading or movies I've just watched. This web app is a simple one that allows users to store their favorite quotes (from both literary and cinematic works), and browse the favorites of other users.

## Installation

 - Clone down this project repository by clicking the green "Clone or download" button above. Copy the SSH link, and open up your computer's Terminal. Inside, type "git clone <the link you've just copied>". This should open up the project: You'll see folders labeled "bin", "config", "db", "lib", etc.

 - Back in your terminal, type "bundle install".
  ```
   bundle install
  ```
 - Then, from the root directory, run "rake db:migrate" to create the database locally.
  ```
   rake db:migrate
  ```
 - Lastly, run "rake db:seed". Now you're ready to go!
  ```
   rake db:seed
  ```

## Running the Application

To open the app, you'll have to start up a local server. In your Terminal, navigate to the TagLine directory (which you've just downloaded from git). Then type "rails s".
 ```
 rails.s
 ```
In your favorite web browser, head to "localhost:3000/" and get to saving your favorite quotes!

## Navigating the Site

When you first enter the site, you will be asked to sign up or login. On your first visit, click on the Sign Up button and follow the given instructions. The next time you visit the site, simply click Log In and enter the information you previously entered. If you don't log in, you'll be able to see a list of books and movies that other folks have entered favorite quotes for. But in order to store your own favorites, you will need to create an account. You can enter new favorite quotes, tag them with various categories, and browse your former entries.

## Preview
Home Screen
<br /> 
<img src="./images/homescreen.png" width="600">

Log-In Menu for Returning Players
<br /> 
<img src="./images/mainmenu.png" width="600">

Category Selection
<br /> 
<img src="./images/selectq.png" width="600">

Celebration for a Correct Answer
<br /> 
<img src="./images/winning.png" width="600">

Player's Statistics Page
<br /> 
<img src="./images/stats.png" width="600">

## Credits

Thank you to...

... the <a href="https://opentdb.com/api_config.php">Open Trivia DB</a>, which provided all the questions!

... Piotr Murach for his gem <a href="https://github.com/piotrmurach/tty-prompt">TTY-prompt</a>

... Michael Tierney for the gem <a href="https://github.com/miketierney/artii">artii</a>

... Francisco Juan for the gem <a href="https://github.com/fjuan/activerecord_reset_pk_sequence">reset-pk-sequence</a>

... Chris Wanstrath for the gem <a href="https://github.com/defunkt/colored">colored</a>

## Contributing

Contributions are most welcome. This is very much a beginner project, and constructive criticism is appreciated. Feel free to open a pull request or branch from this project.

## License

This project is licensed under the [GNU GPL](https://www.gnu.org/licenses/gpl-3.0.en.html)

Enjoy.