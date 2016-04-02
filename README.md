# README

Relate is a simple question and answer program written in Ruby 2.0.

As an example, suppose you have a file called langs.csv which looks something like this:

```
LANGUAGE,CREATOR,PARADIGM
C,Ken & Dennis,Procedural
Java,James Gosling,OO
Lisp,John McCarthy,Functional
```

Now if you run the following command:

```
ruby relate.rb langs.csv creator language
```

Relate will name each creator and your job will be to answer with the name of their language.

To limit the amount of questions you're asked, give a number at the end like so:

```
ruby relate.rb langs.csv creator language 2
```