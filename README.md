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
![Phone Demo1](https://github.com/www16852/Setting_swift/blob/master/README_content/Phone_Demo1.png "Phone Demo1")

# Cell Type
Cell Type is determined by content of the CellContent
## Text Cell
![Text Cell](https://github.com/www16852/Setting_swift/blob/master/README_content/Text_Cell.png "Text Cell")
```swift
Class CellContent{
 init(title: String,detail: String, addTrigger:Bool = true)
```
- title: title text displayed on a UILabel
- detail: detail text displayed on a UILabel
- addTrigger: select if use listener system(use listener would cover native UITableViewCell selection 

## Options Cell
![Options Cell](https://github.com/www16852/Setting_swift/blob/master/README_content/Options_Cell.png "Options Cell")
```swift
Class CellContent{
 init(title:String, push:TableContent, detailIndex:Int?)
```
- title: title text displayed on a UILabel
- push: set TableContent of View that will be pushed
- detailIndex: set initial detail content

## Switch Cell
![Switch Cell](https://github.com/www16852/Setting_swift/blob/master/README_content/Switch_Cell.png "Switch Cell")
```swift
Class CellContent{
 init(title: String, isOn:Bool)
```
- title: title text displayed on a UILabel
- isOn: set initial ON/OFF

## Color Button
![Color Button](https://github.com/www16852/Setting_swift/blob/master/README_content/Color_Button.png "Color Button")
```swift
Class CellContent{
 init(title: String, buttonColor:UIColor)
```
- title: title text displayed on a UILabel
- buttonColor: set button color

# Listener
How to add listeners for cell

## AlertListener
```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Setting"

        //...

        let section2 = Section(header: "SETTING")

        let alertContent = CellContent(title:"Carmera Uploads", isOn:false)
        let alertListener = AlertListener(controller:self,plist:plistManager, alert:makeAlert())
        alertContent.add(tapListener: alertListener)
        section2.add(content:(alertContent))
        sections.append(section2)
        
        //...
```
AlertListener is used in the Switch Cell

It is a listener that is responsible for push alert and storage

## PushListener
```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Setting"

        //...

                let section3 = Section(header: "MANAGEMENT")
        section3.add(content:CellContent(title: "Space Used",detail: ""))

        let LegalPsuhTable = TableContent(header:"", options:[], factory:factory)
        let LegalCellContent = CellContent(title: "Legal and Privacy", push:LegalPsuhTable, detailIndex:nil)
        section3.add(content: LegalCellContent)

        let keepDaysPushTable = TableContent(header:"choose Keep Days", options:dayOption, factory:factory, delegate: TickTableDelegate())
        let keepDaysCellContent = CellContent(title: "Keep Days", push:keepDaysPushTable, detailIndex:0)
        let pushListener = PushListener(controller:self, plist:plistManager)
        keepDaysCellContent.add(tapListener:pushListener)
        section3.add(content:(keepDaysCellContent))

        section3.add(content:CellContent(title: "Connected",detail: "UPnP"))
        //...
```
PushListener is used in the Options Cell

It is a listener that is responsible for push optionView and storage

## Custom Listener
Conform CellTapListener protocol to make a Custom Listener

```swift
public protocol CellTapListener{
    func tapAction(sender:EventCell)
}
```
