LSProgressView
=================

A UIView Category, can show progress with fan / rect shape, like a clock / slider.

####Installation

Add `UIView+Progress.h` and `UIView+Progress.m` to your project. 

####Usage

``` cpp

  #import "UIView+Progress.h"

  - (void)onProgressChanged:(CGFloat)progress
  {
    [self.progressButton1 setPieProgress:progress];
    [self.progressButton2 setRectProgress:progress];
  }
  
```

####Example

![Example](https://github.com/tinymind/LSPieProgressView/raw/master/example.png)