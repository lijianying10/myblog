#mulitple version of QT library

##Introduction
In our running system. most time we need have to use multiple version of qt library
cause of different dependance of QT library dependance.

So we need choice different version of QT library 
in different program.But How to do that?

##solve method

Step 1
-------------------

touch a new directoy and use **~/.bashrc** add the directory path to environment variable $PATH

step2
-------------------

touch a new script file use the same name to the target program name .
in the file contect. clear environment variable **LD_LIBRARY_PATH** and add the target QT library
 path to the variable. Then running the program by absolute path. Don't forget add **$1 $2 $3**
 (according to U need) after the system order.
```shell
export LD_LIBRARY_PATH=~/anaconda/lib/
~/anaconda/bin/python $1 $2 $3 $4 $5 $6

```

step3
-------------------

add **alias** in your **.bashrc** file 
```shell
alias python=/home/lijianying/bin/python
```
