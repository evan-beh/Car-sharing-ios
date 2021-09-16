//
//  Utility.swift
//  Car-sharing-ios
//
//  Created by Evan Beh on 16/09/2021.
//

import UIKit

extension UIApplication {

    class func getBookingPage(controller: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {
       
        if let view = controller as? CarBookingMainViewController {
            return view
        }
        if let navigationController = controller as? UINavigationController {
            return getBookingPage(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return getBookingPage(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return getBookingPage(controller: presented)
        }
        if let alert = controller as? UIAlertController {
            if let navigationController = alert.presentingViewController as? UINavigationController {
                return navigationController.viewControllers.last
            }
            return alert.presentingViewController
        }
        return controller
    }

}
class Utility: NSObject {

    

}
