# RSTUtils

[![Version](https://img.shields.io/cocoapods/v/RSTUtils.svg?style=flat)](http://cocoapods.org/pods/RSTUtils)
[![License](https://img.shields.io/cocoapods/l/RSTUtils.svg?style=flat)](http://cocoapods.org/pods/RSTUtils)

## Motivation

Set of helpful protocols, classes, extensions etc. used in iOS projects at RST-IT.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

```
pod 'RSTUtils'
```

## TOC

* Classes
  * NibInstantiableView - subclass this view to instantiate a view from Nib. Set the class as the Nib owner for it to work.
* Extensions
  * UIView+Extensions - extensions for adding subviews with constraints and other frequent view styling operations
  * UITableView+Extensions - typed api for cell registration and cell dequeueing
  * UICollectionView+Extensions - typed api for cell registration and cell dequeueing
* Protocols
  * NibLoadable - protocol and UIView extension for loading views from nibs
  * ReuseIdentifiable - protocol for views that have a reuse identifier
* Structs
  * Angle - use radians or degrees to initialize and angle, transform between the two
* Utils
  * KeyboardManager - used for managing the keyboard through the manager delegate methods

## Author(s)

pgorzelany, piotr.gorzelany@gmail.com
RST-IT iOS Team

## License

ios-utils is Copyright © 2018 SoftwareBrothers.co. It is free software, and may be redistributed under the terms specified in the [LICENSE](LICENSE) file.

## About SoftwareBrothers.co

<img src="https://softwarebrothers.co/assets/images/software-brothers-logo-full.svg" width=240>


We’re an open, friendly team that helps clients from all over the world to transform their businesses and create astonishing products.

* We are available to [hire](https://softwarebrothers.co/contact).
* If you want to work for us - checkout the [career page](https://softwarebrothers.co/career).
