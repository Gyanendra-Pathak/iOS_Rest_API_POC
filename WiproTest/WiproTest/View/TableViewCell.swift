//
//  TableViewCell.swift
//  WiproTest
//
//  Created by Gyanendra Pathak on 29/09/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    let imageViewAuthor:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let labelTitle:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: CGFloat(Constant.kBoldSytemFont))
        label.textColor = .black
        label.numberOfLines = Constant.kSingleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelDescription:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: CGFloat(Constant.kSytemFont))
        label.textColor =  .black
        label.clipsToBounds = true
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = Constant.kMultipleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(imageViewAuthor)
        self.contentView.addSubview(labelTitle)
        self.contentView.addSubview(labelDescription)
        
        imageViewAuthor.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant:CGFloat(Constant.kFixPadding)).isActive = true
        imageViewAuthor.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:CGFloat(Constant.kFixPadding)).isActive = true
        imageViewAuthor.bottomAnchor.constraint(lessThanOrEqualTo:self.contentView.bottomAnchor, constant:-CGFloat(Constant.kFixPadding)).isActive = true
        imageViewAuthor.widthAnchor.constraint(equalToConstant:CGFloat(Constant.kImageEqualHW)).isActive = true
        imageViewAuthor.heightAnchor.constraint(equalToConstant:CGFloat(Constant.kImageEqualHW)).isActive = true
        
        
        labelTitle.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant:CGFloat(Constant.kFixPadding)).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo:imageViewAuthor.trailingAnchor, constant:CGFloat(Constant.kFixPadding)).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-CGFloat(Constant.kFixPadding)).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant:CGFloat(Constant.kLabelTitleHeight)).isActive = true


        labelDescription.topAnchor.constraint(equalTo:labelTitle.bottomAnchor, constant:CGFloat(Constant.kSingleLine)).isActive = true
        labelDescription.leadingAnchor.constraint(equalTo:imageViewAuthor.trailingAnchor, constant:CGFloat(Constant.kFixPadding)).isActive = true
        labelDescription.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-CGFloat(Constant.kFixPadding)).isActive = true
        labelDescription.bottomAnchor.constraint(lessThanOrEqualTo:self.contentView.bottomAnchor, constant:-CGFloat(Constant.kFixPadding)).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }

}
