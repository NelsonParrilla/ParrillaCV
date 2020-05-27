# CV MVVM SwiftUI

![Version](https://img.shields.io/badge/version-1.0.1-blue.svg)
![Platforms](https://img.shields.io/badge/platform-iOS-blue.svg)
![Swift version](https://img.shields.io/badge/swift-5.0-blue.svg)

## Description

This project is a template of SwiftUI MVVM project and represents my resume. It uses the [Factory Pattern](https://en.wikipedia.org/wiki/Factory_method_pattern) and is connected to a simple API so it can be easily editable.

## Prerequisites

- Xcode 11.3
- Swift 5.0
- iOS 13.2+
- [CocoaPods 1.7.1](#cocoapods)

## CocoaPods

To install the [current version](https://github.com/CocoaPods/CocoaPods/releases/tag/1.7.1) used in the project, enter the following in the Terminal:

```
sudo gem install cocoapods -v 1.7.1
```

Then run pod install to install needed frameworks in the project.

The only pod used is iOSSnapshotTestCase in order to write and launch easily UITests.

## iOSSnapshotTestCase

[iOSSnapshotTestCase](https://github.com/uber/ios-snapshot-test-case/) is used to take snapshots of the app in order to compare it with screens on UITests.

First of all, I added 

```
IMAGE_DIFF_DIR=$(SOURCE_ROOT)/$(PROJECT_NAME)UITests/Screenshots/FailureDiffs
```
and 

```
FB_REFERENCE_IMAGE_DIR=$(SOURCE_ROOT)/$(PROJECT_NAME)UITests/Screenshots/ReferenceImages 
```
into "Edit scheme" -> "Run Debug" -> "Arguments" -> "Environment variables". It sets path where I save snapshots.

Then, you can take snapshots of the app during UITests if you uncomment the line "recordMode = true" in "MainUITests.swift". Once snapshots are saved, comment the recordMode line and UITests will compare screen with saved snapshots when "verifyView()" is called.


