//
//  ViewController.swift
//  TestST
//
//  Created by code6421 on 2014/11/4.
//  Copyright (c) 2014年 code6421. All rights reserved.
//

import UIKit
class ViewController: UIViewController,GCDAsyncSocketDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        var tcpSocket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        var error : NSError?
        var message = "ping"
        tcpSocket.enableBroadcast(true, error: &error)
        
        var data = NSData(data: message.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!)
        tcpSocket.beginReceiving(&error)
        tcpSocket.sendData(data, toHost: "192.168.1.255", port: 15000, withTimeout: -1, tag: 5)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func udpSocket(sock : GCDAsyncUdpSocket!, didReceiveData data : NSData!,  fromAddress address : NSData!,  withFilterContext filterContext : AnyObject!) {
        var message = NSString(data: data, encoding: NSUTF8StringEncoding)
        println(message)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

