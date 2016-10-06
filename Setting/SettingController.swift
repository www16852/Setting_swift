//
//  SettingController.swift
//  Setting
//
//  Created by waltoncob on 2016/10/6.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

class SettingController:NSObject{

    unowned let controller:UIViewController

    init(controller: UIViewController){
        self.controller = controller
    }

    //MARK: Target
    func tapCell(gesture:UIPanGestureRecognizer){
        let cell = gesture.view as! AccessoryCell
        if cell.detailSections.isEmpty == false{
            showDetail(title:(cell.textLabel?.text)!,sections:cell.detailSections,push:cell.pushType)
        }
    }

    //MARK:
    private func showDetail(title:String, sections:[Section],push: AccessoryCell.PushType) {
        print("T:showDetail")
        let pushController = SubTableController(tableSections: sections,controller: self)
//        switch push {
//        case .sub:  controller = SubTableController()
//        case .share:controller = ShareTableController()
//        }
        pushController.tableSections = sections
        pushController.view.backgroundColor = UIColor.white
        pushController.title = title
        self.controller.navigationController?.pushViewController(pushController, animated: true)
    }

}
