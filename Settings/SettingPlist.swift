//
//  SettingPlist.swift
//  Settings
//
//  Created by waltoncob on 2016/10/21.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

//not usable
public class SettingPlist{

    public init(){

    }

    public func temp(){
        var plistPathInDocument:String = String()
        let rootPath = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true)[0]

        plistPathInDocument = rootPath + "/Settings.plist"
        let a = TextCell(text: "John",detail: "John")
        let A = TextCell(text: "LA",detail: "NEW")
        let D:[String:Any] = ["Name":["A","B","C"],"Lastname":"B"]

        let c = D as NSDictionary
//        if FileManager.default.fileExists(atPath: plistPathInDocument) == false{
            if c.write(toFile:plistPathInDocument, atomically:true) == false{
                print("false")
            }
//        }

        print(plistPathInDocument)

        let b = NSDictionary(contentsOfFile:plistPathInDocument)
        for (v,k) in b! {
            print(v)
            let a = type(of: k)
            print("k.class \(a)")
            print(k)
        }
    }

}
