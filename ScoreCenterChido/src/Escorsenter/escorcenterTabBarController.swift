//
//  escorcenterTabBarController.swift
//  Escorsenter
//
//  Created by Jose Miguel Arreola on 2/11/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit

class escorcenterTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Aquí cambian los colores de los TabBarItem: naranja en hipervínculo y blanco en estático o selected
        
        for item in self.tabBar.items as! [UITabBarItem] {
            if let image = item.image {
                item.image = image.imageWithColor(UIColor(red:75.0/255.0, green:120.0/255.0,blue:81.0/255.0,alpha:1.0)).imageWithRenderingMode(.AlwaysOriginal)
            }
        }
        
        for item in self.tabBar.items as! [UITabBarItem] {
            if let image = item.selectedImage {
                item.selectedImage = image.imageWithColor(UIColor(red:255.0, green:255.0,blue:255.0,alpha:1.0)).imageWithRenderingMode(.AlwaysOriginal)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//Extension para poder cambiar el color de UITabBarItem
extension UIImage {
    func imageWithColor(tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext() as CGContextRef
        CGContextTranslateCTM(context, 0, self.size.height)
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextSetBlendMode(context, kCGBlendModeNormal)
        
        let rect = CGRectMake(0, 0, self.size.width, self.size.height) as CGRect
        CGContextClipToMask(context, rect, self.CGImage)
        tintColor.setFill()
        CGContextFillRect(context, rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}