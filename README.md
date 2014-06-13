LSPieProgressView
=================

A UIView Category, can show progress with fan shape, like a clock timer.


####Installation

Add `UIView+LSPieProgress.h` and `UIView+LSPieProgress.m` to your project. 

####Usage

``` cpp

  #import "UIView+LSPieProgress.h"

  - (void)onProgressChanged:(CGFloat)progress
  {
    [self.progressButton setProgress:progress];
  }
  
```

####Example

![Example](https://github.com/tinymind/LSPieProgressView/raw/master/example.png)