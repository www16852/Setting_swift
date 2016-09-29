//
//  SwitchCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/26.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class SwitchCell:UITableViewCell{

    private let boolSwitch = UISwitch()

    public convenience init(text: String){
        self.init(style: UITableViewCellStyle.value1,reuseIdentifier: nil)
        self.textLabel?.text = text
        self.setupViews()
    }

    func setupViews(){
        addSubview(boolSwitch)
        boolSwitch.addTarget(self, action: #selector(SwitchCell.save(sender:)), for: .valueChanged)
        boolSwitch.translatesAutoresizingMaskIntoConstraints = false
    }

    func save(sender: UISwitch){
        print("save")
        
    }

    override public func layoutSubviews() {
        updateConstraints()
        super.layoutSubviews()
    }

    override public func updateConstraints() {
        boolSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        boolSwitch.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        super.updateConstraints()
    }
    
}
