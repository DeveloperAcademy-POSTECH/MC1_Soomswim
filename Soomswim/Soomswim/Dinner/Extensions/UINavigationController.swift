//
//  UINavigationController.swift
//  Soomswim
//
//  Created by 이윤영 on 2022/04/13.
//

import SwiftUI

extension UINavigationController {
     open override func viewWillLayoutSubviews() {
         navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
     }
 }
