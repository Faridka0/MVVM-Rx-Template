//
//  UIView+Extension.swift
//  UnderMoscow
//
//  Created by Фарид Гулиев on 09.10.2020.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach({ addSubview($0) })
    }
}
