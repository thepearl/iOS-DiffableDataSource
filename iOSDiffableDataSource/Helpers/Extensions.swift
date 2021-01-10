//
//  Extensions.swift
//  iOSDiffableDataSource
//
//  Created by Ghazi Tozri on 9/1/2021.
//

import UIKit
import SDWebImage


extension UIViewController
{
    class func instantiateFromStoryboard(_ name: String) -> Self
    {
        return instantiateFromStoryboardHelper(name)
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: String) -> T
    {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }
}

public extension UITableViewCell
{
    static var reuseIdentifier: String
    {
        return String(describing: self)
    }
}

extension UIImageView
{
    func activateSdWebImageLoader()
    {
        image = UIImage(named: PlaceholdingImages.white.rawValue)
        sd_imageIndicator = SDWebImageActivityIndicator.gray
    }
    
    func setPlaceholder(placeholderImage: PlaceholdingImages)
    {
        DispatchQueue.main.async { [weak self] in
            self?.image = UIImage(named: placeholderImage.rawValue)
        }
    }
}

enum PlaceholdingImages: String
{
    case white = "whiteBackground"
    case profile = "profilePlaceholder"
    case product = "productPlaceholder"
    case category = "ico_splash"
}
