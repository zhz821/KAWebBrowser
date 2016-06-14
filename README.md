# KAWebBrowser

KAWebBrowser is a web browser module written in Swift.

Powered by [WKWebView](https://developer.apple.com/library/IOs/documentation/WebKit/Reference/WKWebView_Ref/index.html) on iOS 8.

Support showing page's loading status with an animated progressBar.

![Screenshot](screenshots/1.png =100x)

## Features

- [x] Animated progress bar
- [x] Portrait and landscape orientation support
- [x] Work with existing UINavigationController or present modally
- [x] Installation with [CocoaPods](http://cocoapods.org/)
- [ ] Display title
- [ ] Customizable UI
- [ ] Customizable Toolbar & action buttons

## Requirements

- iOS 8.0+
- Xcode 7.3+

## Usage

### Push to the navigation stack:

```swift
let browser = KAWebBrowser()
showViewController(browser, sender: nil)

browser.loadURLString("https://github.com")
```

### Present Modally:

```swift
let navigationController = KAWebBrowser.navigationControllerWithBrowser()
showViewController(navigationController, sender: nil)

navigationController.webBrowser()?.loadURLString("https://github.com")
```

---

## Installation

#### CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the ["Getting Started" for more information](http://guides.cocoapods.org/using/getting-started.html).

###### Podfile

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'KAWebBrowser'
end
```




