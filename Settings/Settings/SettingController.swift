//
//  SettingController.swift
//  Setting
//
//  Created by waltoncob on 2016/10/6.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

public class SettingController:NSObject{

    unowned let controller:UIViewController

    public init(controller: UIViewController){
        self.controller = controller
    }

    //MARK: Target
    func tapCell(gesture:UIPanGestureRecognizer){
        let cell = gesture.view as! AccessoryCell
        if cell.detailSections.isEmpty == false{
            showDetail(title:(cell.textLabel?.text)!,content:cell.tableContent,sections:cell.detailSections)
        }
    }

    //MARK:
    private func showDetail(title:String, content:TableContent, sections:[Section]) {
        print("T:showDetail \(title)")
        let pushController = SubTableController(content:content, tableSections:sections, controller: self)
        pushController.tableSections = sections
        pushController.view.backgroundColor = UIColor.white
        pushController.title = title
        self.controller.navigationController?.pushViewController(pushController, animated: true)
    }

}
