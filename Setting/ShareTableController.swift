//
//  ShareTableController.swift
//  Setting
//
//  Created by waltoncob on 2016/10/3.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

class ShareTableController: SettingController {

    var detailTable:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTable = UITableView()
        self.view.addSubview(detailTable)
        self.tableSet()
        self.setupViews()

        // Do any additional setup after loading the view, typically from a nib.
    }

    private func tableSet(){
        detailTable.allowsSelection = true
        detailTable.delegate = self
        detailTable.dataSource = self
    }

    func setupViews(){
        detailTable.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .top, relatedBy: .equal, toItem: view , attribute: .top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .bottom, relatedBy: .equal, toItem: view , attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .left, relatedBy: .equal, toItem: view , attribute: .left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .right, relatedBy: .equal, toItem: view , attribute: .right, multiplier: 1, constant: 0))
    }

    //MAKE: Delegate

    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    }

    override public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
    }

    //MAKE:
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }  
    }
    
}

