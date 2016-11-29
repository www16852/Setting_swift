/*
 * Copyright (C) 2016 Xu,Cheng Wei <www16852@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
//
//  SectionManager.swift
//  Settings
//
//  Created by waltoncob on 2016/10/21.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

public class PlistManager{

    private var cellContents:[CellContent] = []
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

    public init(){

    }

    public func setup(cellContents:[CellContent]){
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
        buildDictionary()
        let nsDictionary = dictionary as NSDictionary
        if nsDictionary.write(toFile:plistPathInDocument, atomically:true) == false{
            print("Settings:Plist creat fail")
        }
    }
    
}
