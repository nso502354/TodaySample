//
//  TodayViewController.swift
//  TestWidget
//
//  Created by Sangwook Nam on 14/10/2019.
//  Copyright © 2019 nam. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.extensionContext?.widgetLargestAvailableDisplayMode = NCWidgetDisplayMode.expanded
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        
        if activeDisplayMode == NCWidgetDisplayMode.compact {
            self.preferredContentSize = maxSize
        } else {
            self.preferredContentSize = maxSize
        }
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        guard let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/ko/2/24/Lenna.png"),
            let imageData: Data = try? Data(contentsOf: imageURL),
            let lenaImage: UIImage = UIImage(data: imageData) else {
            completionHandler(NCUpdateResult.noData)
            return
        }
        
        self.imageView.image = lenaImage
        completionHandler(NCUpdateResult.newData)
    }
}
