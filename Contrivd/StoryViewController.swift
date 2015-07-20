//
//  StoryViewController.swift
//  Contrivd
//
//  Created by Alex Quinlivan on 20/07/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

import UIKit

class StoryViewController: HLMInflatableViewController {
    
    final var story: CTRStuffStory!
    final var origRect: CGRect!

    weak var storyContent: UILabel?
    weak var storySource: UILabel?
    weak var container: UIView?
    weak var scrollViewChrome: CTRListStoryCell?
    var snapshotView: UIView?
    
    var textSize: CGFloat?
    var viewHasPreviouslyAppeared: Bool = false
    
    override var layoutResource: String {
        get { return "@view/vc_story" }
    }

    init(story: CTRStuffStory!, cellRect: CGRect, snapshot: UIView!) {
        super.init(nibName: nil, bundle: nil)
        self.story = story
        self.origRect = cellRect
        self.snapshotView = snapshot
        navigationItem.rightBarButtonItem = createRightBarButtonItem()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        super.loadView()
        bindViews()
        if let textSize = self.textSize {
            storyContent?.hlm_textSize = textSize
        } else {
            textSize = storyContent?.hlm_textSize
        }
        storyContent?.attributedText = story.attributedBody()
        storySource?.text = story.sourceName
        scrollViewChrome?.story = story
        toggleFontSize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if !viewHasPreviouslyAppeared {
            viewHasPreviouslyAppeared = true
            animateIn()
        }
    }
    
    func bindViews() {
        storyContent = view.hlm_viewWithId(UInt(bitPattern: "content".hash)) as? UILabel
        storySource = view.hlm_viewWithId(UInt(bitPattern: "source".hash)) as? UILabel
        container = view.hlm_viewWithId(UInt(bitPattern: "container".hash))
        scrollViewChrome = view.hlm_viewWithId(UInt(bitPattern: "story_cell".hash)) as? CTRListStoryCell
    }
    
    func toggleFontSize() {
        if var textSize = self.textSize {
            textSize += 2
            if textSize > 32 {
                textSize = 12
            }
            self.textSize = textSize
            storyContent?.hlm_textSize = textSize
        }
    }
    
    func animateIn() {
        let animDuration = 0.6
        let origRect = self.origRect
        if let chrome = snapshotView {
            scrollViewChrome?.alpha = 0
            navigationController?.view.insertSubview(
                chrome,
                belowSubview: navigationController!.navigationBar)
            chrome.frame = origRect
            chrome.clipsToBounds = false
            chrome.layer.shadowColor = UIColor.blackColor().CGColor
            chrome.layer.shadowRadius = 0
            chrome.layer.shadowOpacity = 0.5
            chrome.layer.addAnimation(
                createShadowOffsetAnimation(animDuration),
                forKey: "shadowOffset")
            chrome.layer.addAnimation(
                createShadowRadiusAnimation(animDuration),
                forKey: "shadowRadius")
            let navBarFrame = navigationController!.navigationBar.frame
            UIView.animateWithDuration(animDuration, animations: {
                var newRect = origRect
                newRect.origin.y = navBarFrame.size.height + navBarFrame.origin.y
                chrome.frame = newRect
            }, completion: { _ in
                chrome.removeFromSuperview()
                self.snapshotView = nil
                self.scrollViewChrome?.alpha = 1
            })
            Dispatch.delay(0.05) {
                UIView.animateWithDuration((animDuration / 2) - 0.05, animations: {
                    chrome.transform = CGAffineTransformScale(chrome.transform, 1.05, 1.05)
                }, completion: { _ in
                    UIView.animateWithDuration(animDuration / 2, animations: {
                        chrome.transform = CGAffineTransformIdentity
                    })
                })
            }
        }
    }
    
    func createRightBarButtonItem() -> UIBarButtonItem {
        return UIBarButtonItem(
            image: UIImage(named: "font-size"),
            style: .Plain,
            target: self,
            action: "toggleFontSize")
    }
    
    func createShadowOffsetAnimation(duration: CFTimeInterval) -> CABasicAnimation {
        let anim = CABasicAnimation(keyPath: "shadowOffset")
        anim.fromValue = NSValue(CGSize: CGSizeZero)
        anim.toValue = NSValue(CGSize: CGSize(width: 0, height: 6))
        anim.duration = duration / 2.0
        anim.autoreverses = true
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return anim
    }
    
    func createShadowRadiusAnimation(duration: CFTimeInterval) -> CABasicAnimation {
        let anim = CABasicAnimation(keyPath: "shadowRadius")
        anim.fromValue = NSNumber(integer: 0)
        anim.toValue = NSNumber(integer: 10)
        anim.duration = duration / 2.0
        anim.autoreverses = true
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return anim
    }
    
}
