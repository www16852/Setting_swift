//
//  SwitchCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/26.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class SwitchCell:UITableViewCell{

    private var listeners:[CellListener] = []
    private let boolSwitch = UISwitch()
    private var cellContent:ButtonCellContent

    public init(cellContent:ButtonCellContent){
        self.cellContent = cellContent
        super.init(style: UITableViewCellStyle.value1,reuseIdentifier: nil)
        self.textLabel?.text = cellContent.getTitle()
        setupViews()
        setTrigger()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews(){
        contentView.addSubview(boolSwitch)
        boolSwitch.translatesAutoresizingMaskIntoConstraints = false
    }

    public func setTrigger(){
        boolSwitch.addTarget(self, action: #selector(self.tapAction), for: .valueChanged)
    }

    public func tapAction(){
        print("T:\(type(of:self)) tapAction")
        if boolSwitch.isOn == true {
            for tapL in listeners{
                tapL.tapAction(sender: self)
            }
        }
    }

//MARK:get set

    public func set(listeners:[CellListener]){
        self.listeners = listeners
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
