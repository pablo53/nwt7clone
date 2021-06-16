# NWT7-compatible clone project

### Install necessary tools firsst:

```brew install avrdude```

```brew tap osx-cross/avr```

```brew install avr-gcc```

### Programming ATmega chip:

Prepare hex file with binary image to be burned out into ATmega chip later:

```make```

Burn out into ATmega chip:


```make flash```
