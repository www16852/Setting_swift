//
//  SectionManager.swift
//  Settings
//
//  Created by waltoncob on 2016/10/21.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

public class SectionManager{

    private var sections:[Section]
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

    public init(sections:[Section]){
        self.sections = sections
        openPlist()
        adjustSections()
    }

    public func getSections() -> [Section]{
        return sections
    }

//MARK:Dictionary_Section

    func adjustSections(){
        for section in sections{
            for pack in section.CellPacks{
                let key = pack.getKey()
                if dictionary[key] != nil{
                    pack.set(key: key, value: dictionary[key])
                }
            }
        }
    }

    func update(cell:EventCell){
        let (key,value) = cell.getContent()
        update(forKey: key, value: value)
    }

    func update(forKey key:String, value:Any){
        self.dictionary.updateValue(value, forKey: key)
        savePlist()
    }

//MARK:Plist_Section

    func openPlist(){
        if FileManager.default.fileExists(atPath: plistPathInDocument){
            dictionary = NSDictionary(contentsOfFile: plistPathInDocument) as! [String : Any]
        }
    }

    func savePlist(){
        let nsDictionary = dictionary as NSDictionary
        if nsDictionary.write(toFile:plistPathInDocument, atomically:true) == false{
            print("Plist creat fail")
        }
    }

}
