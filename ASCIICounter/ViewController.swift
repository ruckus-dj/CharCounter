//
//  ViewController.swift
//  ASCIICounter
//
//  Created by Алексей Панкратов on 30.05.17.
//  Copyright (c) 2017 Алексей Панкратов. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var MainView: CounterView!

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MainView.initialize()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        MainView.resizeSubviews()
    }


}
