[![View Code](https://img.shields.io/badge/View%20-Code-green)](https://github.com/berkovichpavel/simple_ruby_projects/tree/master/gallows)

<a text-align="center" href="#about">About</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#bw">Built With</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#ldl">Live Demo</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#cd">Class Definitions</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#gs">Getting Started</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#author">Author</a>

This project is to demonstrate my knowledge of Object Oriented Programming Language in Ruby, building a gallows game on the command line where player can play and the gallows is displayed in between turns.

# About the Game - Gallows <a name = "about"></a>

According to [Wikipedia](https://en.wikipedia.org/wiki/Hangman_(game))
Gallows (Hangman)  is a paper and pencil guessing game for two or more players. One player thinks of a word, phrase or sentence and the other(s) tries to guess it by suggesting letters within a certain number of guesses.


## Built With <a name = "bw"></a>

- Ruby

## 🔴 Live Demo <a name = "ldl"></a>

[![Run on Repl.it](https://repl.it/badge/github/berkovichpavel/simple_ruby_projects)](https://simplerubyprojects-1.berkovichpavel.repl.run)

# Class Definitions <a name = "cd"></a>

### **Game file**:
In Game file initializes the **_ResultPrinter class_** , **_WordReader class_** and the **_Gallows class_**.

### **_ResultPrinter Class_**:
Will interact with the game class to read the state of the game and display it.

### **_WordReader Class_**:
Will read words from the file and select one of them as the hidden word

### **_Gallows Class_**:
This class will be responsible for the logic of the game.
Reads a letter from the console and checks if it matches the hidden word

# Getting Started <a name = "gs"></a>

To get a local copy of the repository please run the following commands on your terminal:

```
$ cd <folder>

$ git clone https://github.com/berkovichpavel/simple_ruby_projects.git
```

**To run the code:** 

~~~bash
$ ruby gallows/game.rb
~~~



#### Testing

##### Install Rspec

~~~bash
$ gem install rspec
~~~

To test the code,  run the following commands on your terminal:

~~~bash
$ ruby gallows/spec/gallows_spec.rb
~~~


> Rspec is used for the test.





# Author <a name = "author"></a>

👤 **Berkovich Pavel**

- Github: [https://github.com/berkovichpavel](https://github.com/berkovichpavel)
- Telegram: [https://t.me/BerkovichPavel](https://t.me/BerkovichPavel)
- Linkedin: [https://www.linkedin.com/in/pavel-berkovich-9844251a4/](https://www.linkedin.com/in/pavel-berkovich-9844251a4/)
