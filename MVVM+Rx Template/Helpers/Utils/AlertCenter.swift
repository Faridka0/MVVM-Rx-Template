//
//  AlertCenter.swift
//  MVVM+Rx Template
//
//  Created by Фарид Гулиев on 20.10.2020.
//

import UIKit

class AlertCenter {
    
    func showAlert(with title: String) {
        let alertVC = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel))
        show(alert: alertVC)
    }
    
    
    
    private func show(alert: UIViewController) {
        if var controller = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = controller.presentedViewController {
                controller = presentedViewController
            }
            if !(controller is UIAlertController) {
                if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad ){
                    if let popoverController = alert.popoverPresentationController {
                        popoverController.sourceView = controller.view
                        popoverController.sourceRect = CGRect(x: controller.view.bounds.midX, y: controller.view.bounds.maxY, width: 0, height: 0)
                        popoverController.permittedArrowDirections = []
                    }
                }
                controller.present(alert,
                                   animated: true,
                                   completion: nil)
            }
        }
    }
}
