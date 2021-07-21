//
//  OnBoardingStepsViewController.swift
//  PlatziFinanzas
//
//  Created by Camilo Rozo on 4/07/21.
//

import UIKit

class OnBoardingStepsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var onBoardingImage : UIImageView!

    
    var item : onBoardingItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = item?.title
        descriptionLabel.text = item?.description
        onBoardingImage.image = UIImage(named: item?.imageName ?? "")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
