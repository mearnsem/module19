//
//  PlanetViewController.swift
//  StarWarsAPI
//
//  Created by Emily Mearns on 6/9/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class PlanetViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var diameterLabel: UILabel!
    @IBOutlet weak var terrainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PlanetController.getPlanet { (planet) in
            self.nameLabel.text = planet?.name
            self.diameterLabel.text = planet?.diameter
            self.terrainLabel.text = planet?.terrain
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
