//
//  MainWindowController.swift
//  WebLoadingSample
//
//  Created by Bharatraj Rai on 4/14/20.
//  Copyright © 2020 Bharatraj Rai. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    var mainVC: MainViewController?

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        window?.title = "Manipulating WebPage"
        openMainView()
    }
    
    func openMainView() {
        mainVC = MainViewController(nibName: "MainViewController", bundle: nil)
        guard let fittingSize = mainVC?.view.fittingSize else { return }
        window?.setContentSize(fittingSize)
        window?.contentViewController = mainVC
    }
    
}
