////
////  ReturnVC.swift
////  Setting
////
////  Created by waltoncob on 2016/10/27.
////  Copyright © 2016年 waltoncob. All rights reserved.
////
//
//import UIKit
//
//public class ReturnVC: UIViewController {
//
//    private let tableView:UITableView
//    private let source:AccessoryCell
//    private unowned var delegate:ReturnedVCDelegate
//
//    public init(sender:AccessoryCell, table:UITableView, delegate:ReturnedVCDelegate){
//        self.source = sender
//        self.delegate = delegate
//        self.tableView = table
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override public func viewDidLoad() {
//        super.viewDidLoad()
//        self.view = tableView
//        self.navigationItem.hidesBackButton = true
//        let newBackButton = UIBarButtonItem(title: "＜Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(back))
//        self.navigationItem.leftBarButtonItem = newBackButton;
//    }
//
//    func back() {
//        var sourceValue:String?
//        if let indexPath = tableView.indexPathForSelectedRow{
//            let cell = tableView.cellForRow(at: indexPath) as! EventCell
//            let (key,_) = cell.getContent()
//            sourceValue = key
//        }
//        delegate.backFromVC(accessoryCell:source, result:sourceValue)
//        let _ = self.navigationController?.popViewController(animated: true)
//    }
//
//}
//
