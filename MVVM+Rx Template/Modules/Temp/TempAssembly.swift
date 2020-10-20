//  
//  TempAssembly.swift
//  MVVM+Rx Template
//
//  Created by Фарид Гулиев on 20.10.2020.
//

import UIKit

class TempAssembly {

    func module() -> UIViewController {
        let viewModel = TempViewModel()
        let viewController = TempVC(viewModel: viewModel)
        return viewController
    }
    
}


