//
//  FilterCollectionViewCell.swift
//  CUFound
//
//  Created by Katherine Huang on 11/29/23.
//

import Foundation

import UIKit
import SnapKit

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
            button.backgroundColor = .a4.blue
        }
        else {
            button.setTitleColor(.a4.silver, for: .normal)
            button.backgroundColor = .a4.grayish
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
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold).rounded
        button.layer.cornerRadius = 16
        button.isUserInteractionEnabled = false
        
        contentView.addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}


