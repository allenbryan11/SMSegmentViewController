//
//  SMSegmentViewController
//
//  Created by Si Ma on 05/01/2015.
//  Copyright (c) 2015 Si Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentView: SMSegmentView!
    var margin: CGFloat = 10.0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0.95, alpha: 1.0)

        /*
          Use SMSegmentAppearance to set segment related UI properties.
          Each property has its own default value, so you only need to specify the ones you are interested.
        */
        
        let appearance = SMSegmentAppearance()
        appearance.segmentOnSelectionColour = UIColor(red: 245.0/255.0, green: 174.0/255.0, blue: 63.0/255.0, alpha: 1.0)
        appearance.segmentOffSelectionColour = UIColor.whiteColor()
        appearance.titleOnSelectionFont = UIFont.systemFontOfSize(12.0)
        appearance.titleOffSelectionFont = UIFont.systemFontOfSize(12.0)
        appearance.contentVerticalMargin = 10.0
        
        
        /*
          Init SMsegmentView
          Set divider colour and width here if there is a need
         */
        let segmentFrame = CGRect(x: self.margin, y: 120.0, width: self.view.frame.size.width - self.margin*2, height: 40.0)
        self.segmentView = SMSegmentView(frame: segmentFrame, dividerColour: UIColor(white: 0.95, alpha: 0.3), dividerWidth: 1.0, segmentAppearance: appearance)
        self.segmentView.backgroundColor = UIColor.clearColor()
        
        self.segmentView.layer.cornerRadius = 5.0
        self.segmentView.layer.borderColor = UIColor(white: 0.85, alpha: 1.0).CGColor
        self.segmentView.layer.borderWidth = 1.0

        // Add segments
        self.segmentView.addSegmentWithTitle("Clip", attributedTitle: nil, onSelectionImage: UIImage(named: "clip_light"), offSelectionImage: UIImage(named: "clip"), titleFont: nil)
        self.segmentView.addSegmentWithTitle("Blub", attributedTitle: nil, onSelectionImage: UIImage(named: "bulb_light"), offSelectionImage: UIImage(named: "bulb"), titleFont: nil)
        self.segmentView.addSegmentWithTitle("Cloud", attributedTitle: nil, onSelectionImage: UIImage(named: "cloud_light"), offSelectionImage: UIImage(named: "cloud"), titleFont: nil)
        
        self.segmentView.addTarget(self, action: #selector(ViewController.selectSegmentInSegmentView(_:)), forControlEvents: .ValueChanged)
        
        // Set segment with index 0 as selected by default
        self.segmentView.selectedSegmentIndex = 0
        self.view.addSubview(self.segmentView)
    }
    
    // SMSegment selector for .ValueChanged
    func selectSegmentInSegmentView(segmentView: SMSegmentView) {
        /*
        Replace the following line to implement what you want the app to do after the segment gets tapped.
        */
        print("Select segment at index: \(segmentView.selectedSegmentIndex)")
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.All
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        /*
        MARK: Replace the following line to your own frame setting for segmentView.
        */
        if toInterfaceOrientation == UIInterfaceOrientation.LandscapeLeft || toInterfaceOrientation == UIInterfaceOrientation.LandscapeRight {
            
            self.segmentView.organiseMode = .Vertical
            if let appearance = self.segmentView.segmentAppearance {
                appearance.contentVerticalMargin = 25.0
            }
            self.segmentView.frame = CGRect(x: self.view.frame.size.width/2 - 40.0, y: 100.0, width: 80.0, height: 220.0)
        }
        else {
            
            self.segmentView.organiseMode = .Horizontal
            if let appearance = self.segmentView.segmentAppearance {
                appearance.contentVerticalMargin = 10.0
            }
            self.segmentView.frame = CGRect(x: self.margin, y: 120.0, width: self.view.frame.size.width - self.margin*2, height: 40.0)
            
        }
    }
}

