//
//  UIFont + Extension.swift
//  CUFound
//
//  Created by Katherine Huang on 11/29/23.
//

import Foundation

import UIKit

extension UIFont {

    var rounded: UIFont {
        guard let desc = self.fontDescriptor.withDesign(.rounded) else { return self }
        return UIFont(descriptor: desc, size: self.pointSize)
    }

}
