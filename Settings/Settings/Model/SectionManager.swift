//
//  SectionManager.swift
//  Settings
//
//  Created by waltoncob on 2016/10/21.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

public class SectionManager{

    var sections:[Section]
    var dictionary:[String:Any] = [:]

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
        adjust(sections:self.sections)
    }

    func openPlist(){
        if FileManager.default.fileExists(atPath: plistPathInDocument){
            dictionary = NSDictionary(contentsOfFile: plistPathInDocument) as! [String : Any]
        }
    }

    func adjust(sections:[Section]){
        for section in sections{
            for pack in section.CellPacks{
                let key = pack.getKey()
                if dictionary[key] != nil{
                    pack.set(key: key, value: dictionary[key])
                }
            }
        }
    }

    func update(forKey key:String, value:Any){
        self.dictionary.updateValue(value, forKey: key)
    }

    func savePlist(){
        let nsDictionary = dictionary as NSDictionary
        if nsDictionary.write(toFile:plistPathInDocument, atomically:true) == false{
            print("Plist creat fail")
        }
    }

}
