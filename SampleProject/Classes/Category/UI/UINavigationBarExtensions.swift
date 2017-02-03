//
//  UINavigationBarExtensions.swift
//  <#Project Name#>
//
//  Created by <#Project Developer#> on 8/22/16.
//  Copyright © 2017 <#Project Name#> All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit


// MARK: - Methods
public extension UINavigationBar {
	
	/// Set Navigation Bar title, title color and font.
	///
	/// - Parameters:
	///   - font: title font
	///   - color: title text color (default is .black).
	public func setTitleFont(_ font: UIFont, color: UIColor = UIColor.black) {
		var attrs = [String: AnyObject]()
		attrs[NSFontAttributeName] = font
		attrs[NSForegroundColorAttributeName] = color
		titleTextAttributes = attrs
	}
	
	/// Make navigation bar transparent.
	///
	/// - Parameter withTint: tint color (default is .white).
	public func makeTransparent(withTint: UIColor = .white) {
		setBackgroundImage(UIImage(), for: .default)
		shadowImage = UIImage()
		isTranslucent = true
		tintColor = withTint
		titleTextAttributes = [NSForegroundColorAttributeName: withTint]
	}
	
	/// Set navigationBar background and text colors
	///
	/// - Parameters:
	///   - background: backgound color
	///   - text: text color
	public func setColors(background: UIColor, text: UIColor) {
		self.isTranslucent = false
		self.backgroundColor = background
		self.barTintColor = background
		self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		self.tintColor = text
		self.titleTextAttributes = [NSForegroundColorAttributeName: text]
	}
}

#endif
