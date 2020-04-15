//
//  AppDelegate.swift
//  WebLoadingSample
//
//  Created by Bharatraj Rai on 4/14/20.
//  Copyright © 2020 Bharatraj Rai. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    var mainWC: MainWindowController?


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        openMainWindow()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func openMainWindow() {
        mainWC = MainWindowController(windowNibName: NSNib.Name("MainWindowController"))
        self.mainWC?.showWindow(self)
    }


}

