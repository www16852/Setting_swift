# Setting_swift

Setting_swift is a Swift library for building and presenting in app settings. It helps to declare complex settings trees, provides a manager to store and retrieve data,and  provides a potocol of listener to controll action of view
and supports both iPhone and iPad

## Features

- [x] Declarative settings model
- [x] iOS Settings app look & feel
- [x] Easy to use store and retrieve

## Requirements
- Swift 3
- iOS 8.0+ (iPhone and iPad compatible)
- Xcode 8

## Set Cells

- Declare a storage manager using PlistManager
- Create a Section Array
- Put in different parameters for CellContent
- Add the CellContent to Section
- Add the Section to Section Array

```swift

import Settings

let userEmail = "Box03@walton.com.tw"
let userDevice = "IOS-66-789"
let version = "1.0.13"
var dayOption:[String] = ["5days","10days","15days","20days"]
var shareOption:[String] = ["t1@walton.com.tw","t2@walton.com.tw","t3@walton.com.tw","t4@walton.com.tw"]

class CustomController: UIViewController {
    let plistManager = PlistManager()
    let factory = SimpleCellFactory()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Setting"

        var sections = [Section]()
        let section1 = Section(header: "ACCOUNT")
        section1.add(content:CellContent(title: "Email",detail: userEmail))
        section1.add(content:CellContent(title: "Device",detail: userDevice))
        section1.add(content:CellContent(title: "Version",detail: version))
        sections.append(section1)

//...

```

## Import Cells and set the table

- Use sections and CellFactory create a tableContent
- Get cellContent Array of tableContent for plistManager
- Call plistManager.adjustCellContents() to retrieve content of cellContents 
- Build SettingTableView

```swift

//...

        let tableContent = TableContent(sections:sections, factory:factory)
        let cellContents = tableContent.getCellContents()

        plistManager.setup(cellContents:cellContents)
        print("Plist path : \(plistManager.plistPathInDocument)")
        plistManager.adjustCellContents()

        let tableview = SettingTableView(content:tableContent)
        view = tableview

    }
    
}

```
#### result:
![](https://github.com/www16852/Setting_swift/tree/master/README_content/Phone_Demo1.png "Phone Demo1")

# UI of the cell are determined by content of the CellContent:

## Text Cell
![](https://github.com/www16852/Setting_swift/tree/master/README_content/TextCell.png "Text Cell")
```swift
Class CellContent{
 init(title: String,detail: String, addTrigger:Bool = true)
```
- title: title text displayed on a UILabel
- detail: detail text displayed on a UILabel
- addTrigger: select if use listener system(use listener would cover native UITableViewCell selection 

## Pushable Options Cell
![](https://github.com/www16852/Setting_swift/tree/master/README_content/Pushable_Options_Cell.png "Pushable Options Cell")
```swift
Class CellContent{
 init(title:String, push:TableContent, detailIndex:Int?)
```
- title: title text displayed on a UILabel
- push: set TableContent of View that will be pushed
- detailIndex: set initial detail content

## Switch Cell
![](https://github.com/www16852/Setting_swift/tree/master/README_content/Switch_Cell.png "Switch Cell")
```swift
Class CellContent{
 init(title: String, isOn:Bool)
```
- title: title text displayed on a UILabel
- isOn: set initial ON/OFF

## Color Button
![](https://github.com/www16852/Setting_swift/tree/master/README_content/Color_Button.png "Color Button")
```swift
Class CellContent{
 init(title: String, isOn:Bool)
```
- title: title text displayed on a UILabel
- isOn: set initial ON/OFF

