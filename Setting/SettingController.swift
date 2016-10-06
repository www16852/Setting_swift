//
//  SettingController.swift
//  Setting
//
//  Created by waltoncob on 2016/10/6.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

class SettingController:NSObject{
    
    var tableSections:[Section]

    init(sections: [Section]){
        self.tableSections = sections
    }

    //MARK: Target
    func tapCell(gesture:UIPanGestureRecognizer){
        let cell = gesture.view as! AccessoryCell
        print("T: tapCell")
        if cell.detailSections.isEmpty == false{
//            showDetail(title:(cell.textLabel?.text)!,sections:cell.detailSections,push:cell.pushType)
        }
    }

    //MARK:
//    private func showDetail(title:String, sections:[Section],push: AccessoryCell.PushType) {
//        let controller:SettingController
//        switch push {
//        case .sub:  controller = SubTableController()
//        case .share:controller = ShareTableController()
//        }
//        controller.tableSections = sections
//        controller.view.backgroundColor = UIColor.white
//        controller.title = title
//        navigationController?.pushViewController(controller, animated: true)
//    }

}
