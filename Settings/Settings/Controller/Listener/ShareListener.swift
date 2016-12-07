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
//  ShareListener.swift
//  Settings
//
//  Created by waltoncob on 2016/11/4.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

public class ShareListener:CellTapListener{

    unowned let controller:UIViewController

    public init(controller: UIViewController){
        self.controller = controller
    }

    public func tapAction(sender:EventCell){
        print("\(sender.textLabel?.text) trigger ShareController")
        pushViewController(sender)
    }

    func pushViewController(_ cell:EventCell){
        let title = controller.navigationItem.title
        let viewController = ShareViewController(sender:cell, table:cell.makeTableView(), backTitle:title)
        if controller.navigationController == nil {
            print("Settings:the UIViewController don't have navigationController")
        }
        controller.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
