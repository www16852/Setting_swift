//
//  SectionManager.swift
//  Settings
//
//  Created by waltoncob on 2016/10/21.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

public class PlistManager{

    private var cellContents:[CellContent]
    private var dictionary:[String:Any] = [:]

    private let rootPath = NSSearchPathForDirectoriesInDomains(
        .documentDirectory,
        .userDomainMask,
        true)[0]

    public var plistPathInDocument:String{
        get{
            return rootPath + "/Settings.plist"
        }
    }

    public init(cellContents:[CellContent]){
        self.cellContents = cellContents
        if openPlist() == false{
            buildDictionary()
            savePlist()
        }
    }

    //MARK:get set

    //MARK:Dictionary

    func buildDictionary(){
        for content in cellContents{
            let key = content.getKey()
            let value = content.getValue()
            self.dictionary[key] = value
        }
    }

    public func adjustCellContents(){
        for content in cellContents{
            let key = content.getKey()
            if let plistValue = dictionary[key]{
                content.set(value:plistValue)
            }
        }
    }

    func update(cell:EventCell){
//        let (key,value) = cell.getContent()
//        update(forKey: key, value: value)
    }

    func update(forKey key:String, value:Any){
        self.dictionary.updateValue(value, forKey: key)
        savePlist()
    }

    //MARK:Plist

    func openPlist() -> Bool{
        if FileManager.default.fileExists(atPath: plistPathInDocument){
            dictionary = NSDictionary(contentsOfFile: plistPathInDocument) as! [String : Any]
            return true
        }else{
            return false
        }
    }

    func savePlist(){
        let nsDictionary = dictionary as NSDictionary
        if nsDictionary.write(toFile:plistPathInDocument, atomically:true) == false{
            print("Plist creat fail")
        }
    }
    
}
