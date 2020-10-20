//  
//  TempVC.swift
//  MVVM+Rx Template
//
//  Created by Фарид Гулиев on 20.10.2020.
//

import UIKit
import RxSwift
import RxCocoa

final class TempVC: ViewController<TempView> {

    //MARK: - Properties
    let viewModel: ITempViewModel
    let bag = DisposeBag()
    
    
    //MARK: - Init
    init(viewModel: ITempViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
    }
    
    
    //MARK: - Binding
    func binding() {
        
    }
    
}


