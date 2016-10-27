//
//  ReturnVC.swift
//  Setting
//
//  Created by waltoncob on 2016/10/27.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class ReturnVC: UIViewController {

    private var tableView:UITableView
    private unowned var delegate:ReturnedVCDelegate

    public init(table:UITableView,delegate:ReturnedVCDelegate){
        self.delegate = delegate
        self.tableView = table
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view = tableView
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "＜Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton;
    }

    func back(sender: UIBarButtonItem) {
        delegate.backFromVC()
        let _ = self.navigationController?.popViewController(animated: true)
    }

}

