//
//  TableViewCell.swift
//  CoreDataSample
//
//  Created by ROGERJIN on 17/06/2019.
//  Copyright © 2019 hexcon. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell : UITableViewCell {
    
    let todoLabel : UILabel = {
        
        let label = UILabel()
        
        return label
        
    }()
    
    let dataLabel : UILabel = {
        
        let label = UILabel()
        
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension TableViewCell {
    
    func setupUI() {
        
        self.selectionStyle = .none
        
        contentView.addSubview(todoLabel)
        contentView.addSubview(dataLabel)
        
        dataLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        todoLabel.snp.makeConstraints {
            $0.top.equalTo(dataLabel.snp_bottomMargin).offset(8)
            $0.centerX.equalToSuperview()
        }
        
    }
}
