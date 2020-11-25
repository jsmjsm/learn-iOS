//
//  UINavigationController+Ext.swift
//  learn-iOS-FoodPin
//
//  Created by levypan on 11/20/20.
//

import Foundation
import UIKit

extension UINavigationController{
	open override var childForStatusBarStyle: UIViewController? {
		return topViewController
	}
}
