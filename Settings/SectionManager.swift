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

    let rootPath = NSSearchPathForDirectoriesInDomains(
        .documentDirectory,
        .userDomainMask,
        true)[0]

    var plistPathInDocument:String{
        get{
            return rootPath + "/Settings.plist"
        }
    }

    public init(sections:[Section]){
        self.sections = sections
        openPlist()

    }

    func openPlist(){
        if FileManager.default.fileExists(atPath: plistPathInDocument){
            dictionary = NSDictionary(contentsOfFile: plistPathInDocument) as! [String : Any]
            adjust(sections:self.sections)
        }
    }

    func adjust(sections:[Section]){
        for section in sections{
            for var pack in section.CellPacks{
                if var newPack = pack as? LoadPlist , dictionary[newPack.key] != nil{
                    newPack.value = dictionary[newPack.key]
                    pack = newPack as! MakeCellProtocol
                }
            }
        }
        self.sections = sections
    }

    func savePlist(){
        let nsDictionary = dictionary as NSDictionary
        if nsDictionary.write(toFile:plistPathInDocument, atomically:true) == false{
            print("Plist creat fail")
        }
    }

}
