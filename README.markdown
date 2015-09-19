# World2world
multi language for messageing library

![](http://cdn.discogs.com/44n0Dn7b0YCE5IT2V-Fh314gF9Y=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb()/discogs-images/R-2123-1163629890.jpeg.jpg)  
[Underground Resistance ‎– World 2 World](http://www.discogs.com/Underground-Resistance-World-2-World/release/2123)


# Usage
``` lisp
W2W> (refresh-language)
NIL
W2W> (add-message :msg1 :ja "test: val1=~a, val2=~a")
"test: val1=~a, val2=~a"
W2W> (format* t :msg1 1 2)
test: val1=1, val2=2
NIL
W2W> (add-message :msg1 :en "test: arg1=~a, arg2=~a")
"test: arg1=~a, arg2=~a"
W2W> (setf *default-world* (make-instance 'world :language :en))
#<WORLD {10077004B3}>
W2W> (format* t :msg1 1 2)
test: arg1=1, arg2=2
NIL
```

## Installation
```lisp
(ql:quickload :world2world)
```

## Author

* Satoshi Iwasaki (yanqirenshi@gmail.com)

## Copyright

Copyright (c) 2015 Satoshi Iwasaki (yanqirenshi@gmail.com)

## License

Licensed under the LLGPL License.
