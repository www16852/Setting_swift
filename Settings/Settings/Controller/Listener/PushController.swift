//
//  PushController.swift
//  Setting
//
//  Created by waltoncob on 2016/10/6.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import  UIKit

public class PushController:CellListener,ReturnedVCDelegate{

    unowned let controller:UIViewController
    private var dataManager:SectionManager!

    public init(controller: UIViewController){
        self.controller = controller
    }

    public func set(manager:SectionManager){
        self.dataManager = manager
    }

    public func tapAction(cell:UITableViewCell){
        print("T:\(cell.textLabel?.text) PushController.tapAction ")
        pushVC(cell)
        save(cell)
    }

    func save(_ cell:UITableViewCell){
        if let eventCell = cell as? EventCell{
            let (key,value) = eventCell.getContent()
            dataManager.update(forKey: key, value: value)
        }
    }

    func pushVC(_ cell:UITableViewCell){
        let sender = cell as! AccessoryCell
        let VC = ReturnVC(table:sender.getTableView(), delegate:self)
        controller.navigationController?.pushViewController(VC, animated: true)
    }

//MARK:ReturnedVCDelegate

    public func backFromVC(){
        print("T: backFromVC")
    }

}
