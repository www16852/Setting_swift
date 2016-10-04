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
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareAction(sender:)))
        self.navigationItem.rightBarButtonItem = shareButton;

    //Constraints
        detailTable.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .top, relatedBy: .equal, toItem: view , attribute: .top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .bottom, relatedBy: .equal, toItem: view , attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .left, relatedBy: .equal, toItem: view , attribute: .left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: detailTable, attribute: .right, relatedBy: .equal, toItem: view , attribute: .right, multiplier: 1, constant: 0))
    }

    func shareAction(sender:UIButton){
        print("T: shareAction")
        let shareVC = UIActivityViewController(activityItems: [], applicationActivities: nil)
//        shareVC.modalPresentationStyle = .popover
        print(sender)
//        shareVC.popoverPresentationController?.sourceView = sender
//        shareVC.popoverPresentationController?.sourceRect = sender.bounds
//        shareVC.popoverPresentationController?.permittedArrowDirections = .right
//        shareVC.popoverPresentationController?.sourceRect = button.frame
        self.present(shareVC, animated: true)

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

