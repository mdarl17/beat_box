# Beat Box

### Overview ###
Simple, fun beat box machine that uses a LinkedList class to store and play beats with the OS's installed accessibility voices.

**Making Sounds**

The first step is to create a new BeatBox. It can be created with or without a data argument. Hear what beats are in the list with BeatBox's *play* method.

``
bb = BeatBox.new  
``

``           
bb = BeatBox.new('dee dee')  
``

*bb.play*
```
`say -v Boing -r 500 'dee dee'`
```


New beats can be added to the list with the BeatBox's *append* method:

``
bb = BeatBox.new('dee dee')
``

``
bb.append('womp womp')
``

*bb.play*
```
`say -v Boing -r 500 'dee dee'`
```

New beats can also be added to the front of the list with BeatBox's *prepend* method.

*bb.play => \`say -v 'Boing' -r 500 'dee dee womp womp'\`*


``
bb = BeatBox.new('dee dee')
bb.prepend('womp womp')
``

*bb.play*
```
`say -v Boing -r 500 'womp womp dee dee'`
```

#### Beats are validated ####
The beats sound better when they are short and are given names similar to what a beat actually *sounds* like. Because of this, the BeatBox program will disregard any beats ***NOT INCLUDED IN A PREDETERMINED LIST, AND IT WILL ONLY ACCEPT ANY BEATS MORE THAN 5 ALPHA CHARACTERS IN LENGTH***
For example, if a BeatBox instance is given the following as input:

``
bb = BeatBox.new("tee tee tee Mississippi)
``

The list will not save *Mississippi*, and subsequently, it will not be heard when a BeatBox instance's *play* method is called. To see all of the valid beats in the program, use BeatBox's *all* method:

``
bb = BeatBox.new("tee tee tee Mississippi")
``

*bb.all => "tee tee tee"*

One of the coolest features of the program is the ability to change both the speaker and the rate at which the speaker will say the beats!! This is done by setting BeatBox's *rate* instance variable. By default, the speaking voice is set to 'Boing' and the rate is set to 500.

``
bb = BeatBox.new('tee tee tee')
``

*bb.rate => 500*

``
bb.rate = 100
``

*bb.rate => 100*
``

*bb.play*

```
`say -v Boing -r 100 'tee tee tee'
```

*bb.voice => 'Boing'*

``
bb.voice = 'Cello'
``

*bb.voice => 'Cello'*

*bb.play*
```
`say -v Cello -r 100 'tee tee tee'`
```

The BeatBox class also gives the options to reset both the voice and the rate.

``
bb = BeatBox.new('tee tee tee')
``

``
bb.reset_rate
``

*bb.play*
```
`say -v Cello -r 500 'tee tee tee'`
```
``
bb.reset_voice
``

*bb.play*
```
`say -v Boing -r 500 'tee tee tee'`
```

Have fun, experiment, and make some ***great beats!!!***












