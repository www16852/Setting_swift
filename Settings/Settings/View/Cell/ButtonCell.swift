//
//  ButtonCell.swift
//  Settings
//
//  Created by waltoncob on 2016/10/14.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class ButtonCell:UITableViewCell{

    private var tapListeners:[CellTapListener] = []
    private let button = UIButton()
    private var cellContent:ButtonCellContent

    public init(cellContent:ButtonCellContent){
        self.cellContent = cellContent
        super.init(style: UITableViewCellStyle.value1,reuseIdentifier: nil)
        self.textLabel?.text = " "
        self.detailTextLabel?.text = " "
        button.setTitle(cellContent.getTitle(), for: .normal)
        button.backgroundColor = UIColor(red: 0.8, green: 0.5, blue: 0.5, alpha: 1)
        setupViews()
        setTrigger()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews(){
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
    }

    public func setTrigger(){
         button.addTarget(self, action: #selector(self.tapAction), for: .touchUpInside)
    }

    public func tapAction(){
        print("T:\(type(of:self)) tapAction")
        for tapL in tapListeners{
            tapL.tapAction(sender: self)
        }
    }

//MARK:get set

    public func set(tapListeners:[CellTapListener]){
        self.tapListeners = tapListeners
    }

//MARK: AutoLayout
    override public func layoutSubviews() {
        updateConstraints()
        super.layoutSubviews()
    }

    override public func updateConstraints() {
        contentView.addConstraint(NSLayoutConstraint(item: button, attribute: .trailing, relatedBy: .equal, toItem: detailTextLabel , attribute: .trailing, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: textLabel , attribute: .leading, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: contentView , attribute: .height, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: contentView , attribute: .centerY, multiplier: 1, constant: 0))

// ios9
//        boolSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
//        boolSwitch.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        super.updateConstraints()
    }
    
}
