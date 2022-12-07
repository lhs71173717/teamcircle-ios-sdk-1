//
//  TCommon.swift
//  TCDemo
//
//  Created by hong on 2022/12/5.
//

import UIKit

func getCurrentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    if let nav = base as? UINavigationController {
        return getCurrentViewController(base: nav.visibleViewController)
    }
    if let tab = base as? UITabBarController {
        return getCurrentViewController(base: tab.selectedViewController)
    }
    if let presented = base?.presentedViewController {
        return getCurrentViewController(base: presented)
    }
    return base
}

extension UIViewController {
    
    class func initWithMainStoryboard() -> Self {
        return initWith(storyboard: "Main")
    }
    
    class func initWith(storyboard : String) -> Self {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let storyboardID = self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardID)
        guard let typedViewController = viewController as? Self else {
          fatalError("The ViewController of '\(storyboard)' is not of class '\(self)'")
        }
        return typedViewController
    }
}

extension UIColor {
    convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension String {
    func appendingPathComponent(_ str: String) -> String {
        return (self as NSString).appendingPathComponent(str)
    }
}

protocol TCachable {
    @discardableResult
    func save(at fileURL: URL) -> Swift.Result<Void, Error>
    
    static func get(fromCache fileURL: URL) -> Self?
    
    static func remove(at fileURL: URL)
}

extension TCachable where Self: Codable {
    @discardableResult
    func save(at fileURL: URL) -> Swift.Result<Void, Error> {
        do {
            let data = try JSONEncoder().encode(self)
            try data.write(to: fileURL)
            return .success(())
        } catch {
            return .failure(error)
        }
    }

    static func get(fromCache fileURL: URL) -> Self? {
        do {
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode(self, from: data)
        } catch {
            return nil
        }
    }
    
    static func remove(at fileURL: URL) {
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch {}
    }
}
