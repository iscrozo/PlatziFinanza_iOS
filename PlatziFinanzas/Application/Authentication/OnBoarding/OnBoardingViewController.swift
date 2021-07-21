//
//  OnBoardingViewController.swift
//  PlatziFinanzas
//
//  Created by Camilo Rozo on 4/07/21.
//

import UIKit


struct onBoardingItem {
    let title : String
    let description : String
    let imageName : String
}
class OnBoardingViewController: UIPageViewController {
    var pageControler: UIPageControl?
    
    fileprivate(set) lazy var items : [onBoardingItem] = {
      return [
        onBoardingItem(
            title: "Save money and reduce debt",
            description: "Press the start button",
            imageName: "OnBoardin1"
        ),
        onBoardingItem(
            title: "You've finished your onboarding",
            description: "Press the start button",
            imageName: "OnBoardin2")

      ]
    }()
    
    fileprivate(set) lazy var contentViewController : [UIViewController] = {
        var items = [UIViewController]()
        for i in 0..<self.items.count {
            items.append(self.instanteViewController(i))
        }
        return items
    }()
    
    func instanteViewController(_ index : Int ) -> UIViewController{
        guard let viewController = UIStoryboard(name: "OnBoarding", bundle: Bundle.main).instantiateViewController(withIdentifier: "OnBoardingSteps") as? OnBoardingStepsViewController else{
            return UIViewController()
        }
        viewController.item = items[index]
        return viewController
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        pageControler?.numberOfPages = items.count
        updateContainerView(stepNumber: 0)
        
        // Do any additional setup after loading the view.
    }
    
    
    func updateContainerView(stepNumber  index : Int) {
        setViewControllers([contentViewController[index]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    

}

extension OnBoardingViewController : UIPageViewControllerDataSource{
    func pageViewController(
        _ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = contentViewController.firstIndex(of: viewController)
        if index == 0 {
            return nil
        }
        return contentViewController[index!+1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = contentViewController.firstIndex(of: viewController)
        if index == contentViewController.count - 1  {
            return nil
        }
        return contentViewController[index!+1]
    }
    
    
}
extension OnBoardingViewController : UIPageViewControllerDelegate{
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
        guard let index = contentViewController.index(of: viewControllers!.first!) else{
            return
        }
        pageControler?.currentPage = index
        
    }
}
