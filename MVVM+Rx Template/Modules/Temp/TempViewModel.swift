//  
//  TempViewModel.swift
//  MVVM+Rx Template
//
//  Created by Фарид Гулиев on 20.10.2020.
//

import UIKit
import RxSwift
import RxCocoa

struct TempViewModelInput {
    
    
}

struct TempViewModelOutput {
    
    
}

protocol ITempViewModel {
    
    var input: TempViewModelInput { get }
    var output: TempViewModelOutput { get }
    
}

class TempViewModel: ITempViewModel {
    
    //MARK: - Properties
//    @LazyInjected
//    private var service: IServiceService
    
    private let bag = DisposeBag()
    let input: TempViewModelInput
    let output: TempViewModelOutput
    
    
    //MARK: - For input
    
    
    //MARK: - For output
    
    
    //MARK: - Init
    init() {
        input = TempViewModelInput()
        output = TempViewModelOutput()
    }
    
}
