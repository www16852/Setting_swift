//
//  SectionManager.swift
//  Settings
//
//  Created by waltoncob on 2016/10/21.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

public class SectionManager{

    let sections:[Section]

    public init(sections:[Section]){
        self.sections = sections
        savePlist()
    }

    func savePlist(){
        var plistPathInDocument:String = ""
        let rootPath = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true)[0]

        plistPathInDocument = rootPath + "/Settings.plist"

        var dictionary:[String:Any] = [:]
        for section in sections{
            for pack in section.CellPacks{
                if let loadPack = pack as? LoadPlist{
                    let (key,value) = loadPack.toPlist()
                    dictionary.updateValue(value, forKey: key)
                }
            }
        }

//        if FileManager.default.fileExists(atPath: plistPathInDocument) == false{
        let nsDictionary = dictionary as NSDictionary
        if nsDictionary.write(toFile:plistPathInDocument, atomically:true) == false{
            print("Plist creat fail")
        }
    }

}
