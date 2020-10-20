//
//  MainView.swift
//  MVVM+Rx Template
//
//  Created by Фарид Гулиев on 20.10.2020.
//

import UIKit

class MainView: UIView {
    
    let keyboardLayoutGuide = UILayoutGuide()
    
    required init() {
        super.init(frame: .zero)
        
        setupKeyboardLayoutGuide()
        addKeyboardObservers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        deleteKeyboardObservers()
    }
    
    // MARK: - Keyboard handling
    
    var animatesKeyboardShowing: Bool = true
        
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func deleteKeyboardObservers() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    
    private func setupKeyboardLayoutGuide() {
        addLayoutGuide(keyboardLayoutGuide)
        keyboardLayoutGuide.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(safeAreaLayoutGuide)
        }
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        let frameKey = UIResponder.keyboardFrameEndUserInfoKey
        let durationKey = UIResponder.keyboardAnimationDurationUserInfoKey
        guard
            let keyboardFrame = notification.userInfo?[frameKey] as? CGRect,
            let duration = notification.userInfo?[durationKey] as? TimeInterval
        else { return }
        
        if keyboardLayoutGuide.layoutFrame == safeAreaLayoutGuide.layoutFrame {
            let diff = keyboardLayoutGuide.layoutFrame.intersection(keyboardFrame).height
            keyboardLayoutGuide.snp.updateConstraints { (make) in
                make.height.equalTo(safeAreaLayoutGuide).offset(-diff)
            }
            
            if animatesKeyboardShowing {
                UIView.animate(withDuration: duration) {
                    self.layoutIfNeeded()
                }
            }
        }
        
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        let durationKey = UIResponder.keyboardAnimationDurationUserInfoKey
        guard
            let duration = notification.userInfo?[durationKey] as? TimeInterval
        else { return }
        
        if keyboardLayoutGuide.layoutFrame != safeAreaLayoutGuide.layoutFrame {
            keyboardLayoutGuide.snp.updateConstraints { (make) in
                make.height.equalTo(safeAreaLayoutGuide)
            }
            
            if animatesKeyboardShowing {
                UIView.animate(withDuration: duration) {
                    self.layoutIfNeeded()
                }
            }
        }
    }
}
