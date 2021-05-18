//
//  PageViewController.swift
//  Eateries
//
//  Created by Kotaev Ruslan on 13.05.2021.
//  Copyright © 2021 Ivan Akulov. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var headersArray = ["Записывайте", "Находите"]
    var subheadersArray = ["Создайте свой список любимых ресторанов", "Найдите и отметьте на карте ваши любимые рестораны"]
    var imagesArray = ["food", "iphoneMap"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstVC = displayViewController(atIndex: 0) {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func displayViewController(atIndex index: Int) -> ContentViewController? {
        guard index >= 0 else { return nil }
        guard index < headersArray.count else { return nil }
        guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "contentViewController") as? ContentViewController else { return nil }
        
        contentVC.imageFile = imagesArray[index]
        contentVC.header = headersArray[index]
        contentVC.subheader = subheadersArray[index]
        contentVC.index = index
        
        return contentVC
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index -= 1
        return displayViewController(atIndex: index)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController:
                                UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index += 1
        return displayViewController(atIndex: index)
    }
}
