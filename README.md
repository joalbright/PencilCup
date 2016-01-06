# PencilCup
Tools built to help use CoreGraphics more Swiftly

<!-- [![CI Status](http://img.shields.io/travis/Jo Albright/PencilCup.svg?style=flat)](https://travis-ci.org/Jo Albright/PencilCup) -->

[![Version](https://img.shields.io/cocoapods/v/PencilCup.svg?style=flat)](http://cocoapods.org/pods/PencilCup)

<!-- [![License](https://img.shields.io/cocoapods/l/PencilCup.svg?style=flat)](http://cocoapods.org/pods/PencilCup)
[![Platform](https://img.shields.io/cocoapods/p/PencilCup.svg?style=flat)](http://cocoapods.org/pods/PencilCup) -->

![Pencil Cup](./pencilcup.png)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Add these [Code Snippets](./XcodeSnippets) into Xcode to help with using the new operators.

### Motivation

> Core Graphics is an amazingly useful library that I work with in every app I build. But I also have spent a lot of time writing lines of code to draw things that are very simple.

**Main Problems**

- each point on a path uses a new line of code
- you must pass "context" with every CGContext function
- CGContext options set using functions instead of methods

```swift
let context = UIGraphicsGetCurrentContext()
UIColor(white: 0.9, alpha: 1).set()
CGContextFillRect(context, rect)
UIColor(white: 0.2, alpha: 1).set()
    
CGContextSetLineCap(context, .Round)
CGContextSetLineJoin(context, .Round)
CGContextSetLineWidth(context, 1)
CGContextTranslateCTM(context, (rect.width - 188) / 2, (rect.height - 300) / 2)

CGContextMoveToPoint(context,126.01,89.44)
CGContextAddCurveToPoint(context,116.37, 89.19, 105.65, 89.06, 94.35, 89.06)
CGContextAddCurveToPoint(context, 52.35, 89.06, 18.3, 90.8, 18.3, 94.24)
CGContextAddCurveToPoint(context, 18.3, 97.68, 52.35, 101.51, 94.35, 101.51)
CGContextAddCurveToPoint(context, 104.7, 101.51, 114.57, 101.28, 123.57, 100.87)
CGContextAddLineToPoint(context,126.01,89.44)
CGContextFillPath(context)

CGContextMoveToPoint(context,140, 99.75)
CGContextAddLineToPoint(context, 150.28, 49.72)
CGContextAddCurveToPoint(context, 150.5, 48.64, 151.56, 47.94, 152.64, 48.17)
CGContextAddLineToPoint(context, 162.37, 50.18)
CGContextAddCurveToPoint(context, 163.46, 50.4, 164.15, 51.46, 163.93, 52.54)
CGContextAddLineToPoint(context, 154.43, 98.52)
CGContextStrokePath(context)
```
*22 lines of code*

---

### New Pattern

> You now have the ability to set context options using extension methods. Infix operators open up the ability to build a multi point path on a single line of code.

**New Features**

- typealiases PCPoint, PCSize, PCScale, PCDelta
- CGRect extended with inset methods and global initializer functions
- CGContextRef extended with methods that simplify setup
- infix operators for points and paths

```swift
let (bgColor,cupColor) = (UIColor(white: 0.9, alpha: 1), UIColor(white: 0.2, alpha: 1))

let context = PCGraphicsGetCurrentContext()?.round()?.color(bgColor)?.rect(rect)?.fill()
context?.color(cupColor)?.round()?.line(1)?.offset((rect.width - 188) / 2, (rect.height - 300) / 2)

context ->- (126.01,89.44) -~- (116.37,89.19,105.65,89.06,94.35,89.06) -~- (52.35,89.06,18.3,90.8,18.3,94.24)
context -~- (18.3,97.68,52.35,101.51,94.35,101.51) -~- (104.7,101.51,114.57,101.28,123.57,100.87) -+- (126.01,89.44) -■ nil

context ->- (140,99.75) -+- (150.28,49.72) -~- (150.5,48.64,151.56,47.94,152.64,48.17) -+- (162.37,50.18)
context -~- (163.46,50.4,164.15,51.46,163.93,52.54) -+- (154.43,98.52) -□ nil
```
*7 lines of code*

<!--## Requirements-->

## Installation

PencilCup is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PencilCup"
```

## Author

[Jo Albright](http://github.com/joalbright)

## License

PencilCup is available under the MIT license. See the LICENSE file for more info.
