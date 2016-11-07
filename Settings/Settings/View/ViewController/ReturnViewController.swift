//
//  ReturnVC.swift
//  Setting
//
//  Created by waltoncob on 2016/10/27.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class ReturnViewController: UIViewController {

    private let tableView:UITableView
    private let sourceCell:AccessoryCell
    private let backFunc:()->()
    private var backTitle:String

//    public init(sender:AccessoryCell, table:UITableView, backTitle:String?, delegate:ReturnedViewControllerDelegate){
//        self.sourceCell = sender
//        self.delegate = delegate
//        self.tableView = table
//        self.backTitle = backTitle ?? "back"
//        super.init(nibName: nil, bundle: nil)
//    }

    public init(sender:AccessoryCell, table:UITableView, backTitle:String?, back: @escaping ()->()){
        self.sourceCell = sender
        self.tableView = table
        self.backTitle = backTitle ?? "back"
        self.backFunc = back
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view = tableView
        self.navigationItem.hidesBackButton = true
        setupTopBar()
    }

    func setupTopBar(){
        let newBackButton = UIBarButtonItem(title: "＜" + backTitle, style: UIBarButtonItemStyle.plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = newBackButton;
    }

    func back(){
        var result:String?
        if let indexPath = tableView.indexPathForSelectedRow{
            let cell = tableView.cellForRow(at: indexPath)
            result = cell?.textLabel?.text
            sourceCell.getCellContent().set(detail: result!)
            sourceCell.update()
        }
        self.backFunc()
        let _ = self.navigationController?.popViewController(animated: true)
    }

}

