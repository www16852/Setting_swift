//
//  SwitchCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/26.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class SwitchCell:UITableViewCell,EventCell,SavePlist{

    public var listeners:ListenerContainer!
    let boolSwitch = UISwitch()

    public convenience init(text: String){
        self.init(style: UITableViewCellStyle.value1,reuseIdentifier: nil)
        self.textLabel?.text = text
        setupViews()
    }

    public func toPlist() -> (String,Any){
        return (textLabel!.text!,boolSwitch.isOn)
    }

    func setupViews(){
        contentView.addSubview(boolSwitch)
        boolSwitch.translatesAutoresizingMaskIntoConstraints = false
    }

    public func addGesture(){
        boolSwitch.addTarget(self, action: #selector(self.tapAction(obj:)), for: .valueChanged)
    }

    public func tapAction(obj:AnyObject){
        print("T:Switch tapAction")
        for tapL in listeners.tapListener{
            tapL.tapAction(cell: self)
        }
    }

//MARK:AutoLayout
    override public func layoutSubviews() {
        updateConstraints()
        super.layoutSubviews()
    }

    override public func updateConstraints() {
        let constraint = NSLayoutConstraint(item: boolSwitch, attribute: .trailing, relatedBy: .equal, toItem: contentView , attribute: .trailing, multiplier: 1, constant: -10)
        constraint.priority = 999
        contentView.addConstraint(constraint)
        contentView.addConstraint(NSLayoutConstraint(item: boolSwitch,attribute: .left,relatedBy: .lessThanOrEqual,toItem: textLabel!,attribute: .left,multiplier: 1.0,constant: 625))
        contentView.addConstraint(NSLayoutConstraint(item: boolSwitch, attribute: .centerY, relatedBy: .equal, toItem: contentView , attribute: .centerY, multiplier: 1, constant: 0))
// ios9
//        boolSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
//        boolSwitch.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        super.updateConstraints()
    }
    
}
