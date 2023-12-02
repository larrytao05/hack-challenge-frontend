//
//  FilterCollectionViewCell.swift
//  CUFound
//
//  Created by Katherine Huang on 11/29/23.
//

import Foundation

import UIKit
import SnapKit
import SDWebImage

class FilterCollectionViewCell: UICollectionViewCell {
    //MARK: -Properties (view)
    private let button = UIButton()
    // MARK: - Properties (data)
    static let reuse: String = "FilterCollectionViewCellReuse"
    //MARK: - configure
    func configure(text: String, selectedfilter: String) {
        button.setTitle(text, for: .normal)
        if text == selectedfilter {
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .gray
        }
        else {
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .a4.offWhite
        }
    }
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Set Up Views:
    private func setupButton() {
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold).rounded
        button.layer.cornerRadius = 16
        button.isUserInteractionEnabled = false
        
        contentView.addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}

