# Inlinit
A new design pattern to allow closure initialization.

<!-- [![CI Status](http://img.shields.io/travis/Jo Albright/Inlinit.svg?style=flat)](https://travis-ci.org/Jo Albright/Inlinit) -->

[![Version](https://img.shields.io/cocoapods/v/Inlinit.svg?style=flat)](http://cocoapods.org/pods/Inlinit)
[![License](https://img.shields.io/cocoapods/l/Inlinit.svg?style=flat)](http://cocoapods.org/pods/Inlinit)
[![Platform](https://img.shields.io/cocoapods/p/Inlinit.svg?style=flat)](http://cocoapods.org/pods/Inlinit)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Motivation

> The desire is to initialize within a closure for unique customization while allowing the ability to use constants. 

##### Example 1

*Previous Code*

```swift
// needs to be "var" to allow append below
var randomNumbersArray: [Int] = []

for _ in 0...10 {
        
    randomNumbersArray.append(Int(arc4random_uniform(100)))
    
}
```

*New Code*

```swift
// can now use let and append within initializer closure
let randomNumbersArray: [Int] {

	for _ in 0...10 {
	        
	    $0.append(Int(arc4random_uniform(100)))
	    
	}

}
```

##### Example 2

```swift
struct Person: Inlinit {
        
    var age: Int = 0
    var name: String?
    
}

// initialize & set properties
var me = Person {
    
    $0.name = "Jo"
    $0.age = 32
    
}

// update properties
me <- {
    
    $0.age = 30
    $0.name = "John"
    
}
```

##### Example 3

```swift
func newLabel(text: String) -> UILabel {

	let label: UILabel = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 40))
	
	label.text = text
	label.textColor = UIColor.magentaColor()
	
	return label

}

newLabel("This is lame...")
```

*New Code*

```swift
func newLabel(text: String) -> UILabel {

	return UILabel {

		$0.frame = CGRect(x: 10, y: 10, width: 100, height: 40)
		$0.textColor = UIColor.magentaColor()
	
	}.text = text

}

newLabel("This is Awesome!")
```

So many possibilities unlocked with this new design pattern

<!--## Requirements-->

## Installation

Inlinit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Inlinit"
```

Inlinit is also available through [Swift Package Manager](https://swift.org/package-manager/). Please take a look at the link to learn more about how to use SPM.

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PACKAGE_NAME",
    dependencies: [
        .Package(url: "https://github.com/joalbright/Inlinit.git", majorVersion: 0)
    ]
)
```

## Author

[Jo Albright](https://github.com/joalbright)

## License

Inlinit is available under the MIT license. See the LICENSE file for more info.
