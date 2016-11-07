//
//  ShareViewController.swift
//  Settings
//
//  Created by waltoncob on 2016/11/4.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class ShareViewController: UIViewController {

    private let tableView:UITableView
    private let sourceCell:AccessoryCell
    private var backTitle:String

    public init(sender:AccessoryCell, table:UITableView, backTitle:String?){
        self.sourceCell = sender
        self.tableView = table
        self.backTitle = backTitle ?? "back"
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
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareAction(bar:)))
        self.navigationItem.rightBarButtonItem = shareButton;
    }

    func shareAction(bar:UIBarButtonItem){
        var shareMessage = ""
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        let cell = tableView.cellForRow(at: indexPath)
        shareMessage = (cell!.textLabel?.text)!
        let shareActivity = UIActivityViewController(activityItems: [shareMessage], applicationActivities: nil)
        shareActivity.modalPresentationStyle = .popover
        shareActivity.popoverPresentationController?.barButtonItem = bar
        shareActivity.popoverPresentationController?.permittedArrowDirections = .up
        self.present(shareActivity, animated: true)
    }

    func back(){
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
}
