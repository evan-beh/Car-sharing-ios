//
//  CarBookingMainViewController.swift
//  Car-sharing-ios
//
//  Created by Evan Beh on 15/09/2021.
//

import UIKit
import Parchment



class CarBookingMainViewController: UIViewController {

    
    var viewControllers:[UIViewController] = [UIViewController]()
    let items: [PagingItem] = [
        PagingIndexItem(index: 1, title: "Active"),
        PagingIndexItem(index: 2, title: "Upcoming"),
        PagingIndexItem(index: 3, title: "Ended"),
    ]
    
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPager()

        // Do any additional setup after loading the view.
    }
    

    func setupPager()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstViewController = storyboard.instantiateViewController(withIdentifier: "CarBookingViewController")
        firstViewController.title = "Active"
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "CarBookingViewController")
        secondViewController.title = "Upcoming"
        let thirdViewController = storyboard.instantiateViewController(withIdentifier: "CarBookingViewController")
        thirdViewController.title = "Ended"

        viewControllers.append(firstViewController)
        viewControllers.append(secondViewController)
        viewControllers.append(thirdViewController)


        
        let pagingViewController = PagingViewController()
//        pagingViewController.register(IconPagingCell.self, for: IconItem.self)
        pagingViewController.register(PagingTitleCell.self, for: PagingIndexItem.self)
        pagingViewController.menuItemSize = .selfSizing(estimatedWidth: 100, height: 60)
        pagingViewController.dataSource = self
        pagingViewController.select(index: 0)
        pagingViewController.textColor = .lightGray
        pagingViewController.selectedTextColor = .systemTeal
        pagingViewController.indicatorColor = .systemTeal
        pagingViewController.indicatorOptions = .visible(
            height: 3,
            zIndex: Int.max,
            spacing: UIEdgeInsets.zero,
            insets: UIEdgeInsets.zero
        )
        pagingViewController.menuItemSpacing = 20
        pagingViewController.menuItemLabelSpacing = 30
        

        // Add the paging view controller as a child view controller
        // and contrain it to all edges.
        addChild(pagingViewController)
        contentView.addSubview(pagingViewController.view)

        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
    }
    

}


extension CarBookingMainViewController: PagingViewControllerDataSource {
    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        return viewControllers[index]
    }

    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
       
        let item  = items[index]
        
        return item
    }

    func numberOfViewControllers(in _: PagingViewController) -> Int {
        return items.count
    }
}
