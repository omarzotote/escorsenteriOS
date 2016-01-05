//
//  MapViewController.swift
//  Escorsenter
//
//  Created by Jose Miguel Arreola on 2/17/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    //El mapa està pendiente

    @IBOutlet var titleContainerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleContainerImage.layer.cornerRadius = 10
        self.titleContainerImage.clipsToBounds = true

        // Do any additional setup after loading the view.
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
