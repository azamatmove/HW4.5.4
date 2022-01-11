//
//  CustomCell.swift
//  HW4.5.4
//
//  Created by Azamat Sarinzhiev on 11/1/22.
//

import Foundation
import SnapKit

class CustomCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    lazy var label1: UILabel = {
        let view = UILabel()
        return view
    }()
    
    lazy var label2: UILabel = {
        let view = UILabel()

        return view
    }()
    
    lazy var imageView1: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label1)
        label1.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.left.equalToSuperview()
            
        }
        
        addSubview(label2)
        label2.snp.makeConstraints { make in
            make.top.equalTo(label1.snp.bottom)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(label1)
            make.left.equalTo(label1)
        }
        addSubview(imageView1)
        imageView1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(label2.snp.right)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalToSuperview().multipliedBy(0.8)
        }
        
        configureTitle1()
        configureTitle2()
        configureImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTitle1(){
        label1.numberOfLines = 0
        label1.font = UIFont.systemFont(ofSize: 12)
        label1.textAlignment = .left
    }
    func configureTitle2(){
        label2.numberOfLines = 0
        label2.font = UIFont.systemFont(ofSize: 10)
        label2.textAlignment = .left
    }
    func configureImage() {
        imageView1.layer.cornerRadius = 5
        imageView1.clipsToBounds = true
    }
    
    
    
}
