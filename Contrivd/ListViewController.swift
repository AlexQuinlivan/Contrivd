//
//  ListViewController.swift
//  Contrivd
//
//  Created by Alex Quinlivan on 20/07/15.
//  Copyright (c) 2015 Alex Quinlivan. All rights reserved.
//

import UIKit

class ListViewController: HLMInflatableViewController {
    
    var stories: [CTRStuffStory]?
    
    weak var hidingCell: CTRStoryListTableViewCell?
    weak var storiesView: CTRContrivdStoriesView?
    weak var indeterminate: CTRLoadingFullscreenIndeterminateView?
    
    override var layoutResource: String {
        return "@view/vc_list"
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.titleView = createTitleView()
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "didSelectStory:",
            name: CTRStoryListTableViewCellDidSelectNotification,
            object: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func loadView() {
        super.loadView()
        bindViews()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        hidingCell?.hidden = false
    }
    
    func bindViews() {
        storiesView = view.hlm_viewWithId(UInt(bitPattern: "stories".hash)) as? CTRContrivdStoriesView
        indeterminate = view.hlm_viewWithId(UInt(bitPattern: "indeterminate".hash)) as? CTRLoadingFullscreenIndeterminateView
        indeterminate?.addTarget(self,
            action: "indeterminatePressed",
            forControlEvents: .TouchUpInside)
    }
    
    func indeterminatePressed() {
        indeterminate?.removeTarget(self,
            action: "indeterminatePressed",
            forControlEvents: .TouchUpInside)
        stories = CTRContrivdSources.response().stories as? [CTRStuffStory]
        storiesView?.stories = stories
        storiesView?.reloadData()
        indeterminate?.animateHide({
            self.storiesView?.hidden = false
            self.indeterminate?.hidden = true
            self.indeterminate?.hlm_setNeedsLayout(true)
        })
    }
    
    func didSelectStory(notification: NSNotification!) {
        let hidingCell = notification.object as! CTRStoryListTableViewCell
        let snapshotView = hidingCell.snapshotViewAfterScreenUpdates(false)
        let cellRect = hidingCell.convertRect(hidingCell.bounds, toView: nil)
        self.hidingCell = hidingCell
        hidingCell.hidden = true
        navigationController?.pushViewController(
            StoryViewController(
                story: hidingCell.story,
                cellRect: cellRect,
                snapshot:
                snapshotView),
            animated: true)
    }
    
    func createTitleView() -> UIImageView {
        return UIImageView(image: UIImage(named: "logo"))
    }
    
}