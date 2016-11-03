////
////  PushController.swift
////  Setting
////
////  Created by waltoncob on 2016/10/6.
////  Copyright © 2016年 waltoncob. All rights reserved.
////
//
//import  UIKit
//
//public class PushController:CellListener,ReturnedVCDelegate{
//
//    unowned let controller:UIViewController
//    private var dataManager:SectionManager!
//
//    public init(controller: UIViewController){
//        self.controller = controller
//    }
//
//    public func set(manager:SectionManager){
//        self.dataManager = manager
//    }
//
//    public func tapAction(sender:UITableViewCell){
//        print("T:\(sender.textLabel?.text) PushController.tapAction ")
//        pushVC(sender)
//    }
//
//    func save(_ cell:UITableViewCell){
//        if let eventCell = cell as? EventCell{
//            let (key,value) = eventCell.getContent()
//            dataManager.update(forKey: key, value: value)
//        }
//    }
//
//    func pushVC(_ cell:UITableViewCell){
//        let sender = cell as! AccessoryCell
//        let VC = ReturnVC(sender:sender, table:sender.getTableView(), delegate:self)
//        controller.navigationController?.pushViewController(VC, animated: true)
//    }
//
////MARK:ReturnedVCDelegate
//
//    public func backFromVC(accessoryCell:AccessoryCell, result:String?){
//        print("T: backFromVC return result = \(result)")
//        if let bindingString = result {
//            dataManager.update(forKey: accessoryCell.getContent().0, value: bindingString)
//            accessoryCell.detailTextLabel?.text = bindingString
//        }
//    }
//
//}
