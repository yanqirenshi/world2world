# World2world
multi language for messageing library

![](http://cdn.discogs.com/44n0Dn7b0YCE5IT2V-Fh314gF9Y=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb()/discogs-images/R-2123-1163629890.jpeg.jpg)  
[Underground Resistance ‎– World 2 World](http://www.discogs.com/Underground-Resistance-World-2-World/release/2123)


# Usage

``` lisp
CL-USER> (in-package :w2w)
#<PACKAGE "WORLD2WORLD">

W2W> (add-expression :msg1 :hiroshima "これはテストじゃけぇね。値は ~a よ")
#<EXPRESSION {1006936623}>

W2W> (add-expression :msg1 :en "This is test. value is ~a.")
#<EXPRESSION {10069D6E73}>

W2W> (setf (default-world) :hiroshima)
#<WORLD {100551D4D3}>

W2W> (w2w:format* t :msg1 1)
これはテストじゃけぇね。値は 1 よ
NIL

W2W> (setf (default-world) :en)
#<WORLD {10069D0243}>

W2W> (format* t :msg1 1)
This is test. value is 1.
NIL
```

## Installation
```lisp
(ql:quickload :world2world)
```

## Data structure
``` text
 +---------------+
 | hash-table    |
 |===============|
 | key | package |
 |-----+---------|
 | val | +----------------------+
 +-------| message [object]     |-+
         |======================| |-+
         | code    | [keyword]  | | |
         | default | nil        | | |
         | worlds  | +--------------------+
         +-----------| hash-table         |
           +---------|====================|
             +-------| key | +--------------+
                     |     | | world        |
                     |     | |==============|
                     |     | | code         |
                     |     | | description  |
                     |     | +--------------+
                     |-----+--------------|
                     | val | +--------------+
                     +-------| expression   |-+
                             |==============| |-+
                             | controller   | | |
                             | description  | | |
                             +--------------+ | |
                               +--------------+ |
                                  +-------------+
```

## Author

* Satoshi Iwasaki (yanqirenshi@gmail.com)

## Copyright

Copyright (c) 2015 Satoshi Iwasaki (yanqirenshi@gmail.com)

## License

Licensed under the LLGPL License.
