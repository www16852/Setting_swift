//
//  SettingController.swift
//  Setting
//
//  Created by waltoncob on 2016/9/29.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public struct Section {

    fileprivate let header: String
    fileprivate let footer: String
    fileprivate let settingsCells: [UITableViewCell]
    fileprivate var heightForHeader: CGFloat
    fileprivate var heightForFooter: CGFloat

    init(header: String,footer: String,settingsCells: [UITableViewCell],heightForHeader: CGFloat = 40,heightForFooter: CGFloat = 40){
        self.header = header
        self.footer = footer
        self.settingsCells = settingsCells
        self.heightForHeader = heightForHeader
        self.heightForFooter = heightForFooter
    }

}

open class SettingController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableview:UITableView!

    public var tableSections = [Section]()

    override open func viewDidLoad() {
        super.viewDidLoad()
//        tableview.dataSource = self
//        tableview.delegate = self
//        tableview.allowsSelection = false
    }

    //MARK: DataSource

    open func numberOfSections(in tableView: UITableView) -> Int {
        return tableSections.count
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableSections[section].settingsCells.count
    }

    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableSections[section].header
    }

    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return tableSections[section].footer
    }

    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableSections[section].heightForHeader == 0 { return 0.00001 }
        return tableSections[section].heightForHeader
    }

    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if tableSections[section].heightForFooter == 0 { return 0.00001 }
        return tableSections[section].heightForFooter
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableSections[indexPath.section].settingsCells[indexPath.row]
        if cell is CellSelectProtocol{
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SettingController.tapCell(gesture:)))
            cell.addGestureRecognizer(tapGesture)
        }
        return cell
    }

    //MARK: Target
    open func tapCell(gesture:UIPanGestureRecognizer){
        let cell = gesture.view as! UITableViewCell
        
        showDetail(title:(cell.textLabel?.text)!)
    }

    //MARK: 
    private func showDetail(title:String) {
        print("showDetail")
        let controller = SubTableContoller()
        controller.view.backgroundColor = UIColor.white
        controller.title = title
        navigationController?.pushViewController(controller, animated: true)
    }

}
