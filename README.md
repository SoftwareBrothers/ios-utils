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
  * AlertPresenter - protocol for presenting alerts
  * ActivityPresenter - protocol for showing activity
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

RSTUtils is available under the MIT license. See the LICENSE file for more info.
