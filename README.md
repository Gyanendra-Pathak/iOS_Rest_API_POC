# WiproTest

## Requirements:

* iOS 11.0+

* Xcode 11.2

* Swift 5.0

## Objective:

This proof of concept app which consumes a REST api and displays photos with headings and descriptions to demonstrate some aspect of clean architecture using  MVVM pattern, dependency injection, **SOLID principles** , loose coupling, **unit testing** and some of the best practices used in modern iOS programming using `Swift`.

## Specification:

* This project was intended as proof of concept app which consumes a REST api and displays photos with headings and descriptions. 

* The demo uses the [Web API](https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json) which returns information in a JSON format.

* Implemented Unit test for business logic.

* The response of api contains a title and a list of rows.

* Use TableView to display the content.

* TableViewCell size is dynamic and which should vary based on the description.

* Restrict the image to go to outside of the device width if image is having a larger width then your device.

* Loads the images lazily and Don’t download them all at once, but only as needed.

* Refresh function

* Each image having title and descrotion on cell.

* Note - Should not block UI when loading the data from the json feed.

## Installation

- Xcode **11.2**(required)

- Clean `/DerivedData` folder if any

- Run the pod install `pod install`

- Then clean and build the project in Xcode

## 3rd Party Libraries

 - **`SDWebImage`** - A framework to download image. 

## Technical notes:

- MVVM - My preferred architecture.

    - MVVM stands for “Model View ViewModel”

    - It’s a software architecture often used by Apple developers to replace MVC. Model-View-ViewModel (MVVM) is a structural design pattern that separates objects into three distinct groups:

- Models hold application data. They’re usually structs or simple classes.

- Views display visual elements and controls on the screen. They’re typically - subclasses of UIView.

- View models transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.

![Alt text](/README/MVVM.jpeg?raw=true)

## Screenshot:

![Screen Shot 1](/README/iPhone11ProMax.png?raw=true)
