//  
//  TempView.swift
//  MVVM+Rx Template
//
//  Created by Фарид Гулиев on 20.10.2020.
//

import UIKit
import RxSwift
import RxCocoa

class TempView: MainView {

    //MARK: - Views
    
    
    
    //MARK: - Init
    required init() {
        super.init()
        fill()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Fill view
    private func fill() {
        backgroundColor = .white
        addSubviews([])
    }
    
}


