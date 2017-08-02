//
// Created by Алексей Панкратов on 30.05.17.
// Copyright (c) 2017 ___FULLUSERNAME___. All rights reserved.
//

import UIKit


class CounterView: UIView, UITextViewDelegate, UITableViewDataSource{
    @IBOutlet weak var PageSwitcher: UISegmentedControl!
    @IBOutlet weak var MainView: UIView!
    let Text = UITextView()
    let CounterTable = UITableView()
    var CountsArr = Array<(Character, Int)>()

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func initialize(){
        MainView.backgroundColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 1)
        PageSwitcher.setTitle("Текст", forSegmentAt: 0)
        PageSwitcher.setTitle("Символы", forSegmentAt: 1)
        self.addSubview(Text)
        self.addSubview(CounterTable)
        onSwitch(sender: self)
        Text.isEditable = true
        Text.font = UIFont.systemFont(ofSize: 17)
        Text.delegate = self
        CounterTable.dataSource = self
    }

    @IBAction func onSwitch(sender: AnyObject){
        self.endEditing(true)
        if(PageSwitcher.selectedSegmentIndex == 0){
            Text.isHidden = false
            CounterTable.isHidden = true
            Text.frame = MainView.frame
        } else if(PageSwitcher.selectedSegmentIndex == 1){
            Text.isHidden = true
            CounterTable.isHidden = false
            CounterTable.frame = MainView.frame
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }

    public func textViewDidChange(_ textView: UITextView) {
        var Counts = Dictionary<Character, Int>()
        for char in textView.text.lowercased().characters{
            if(Counts.keys.contains(char)){
                Counts[char]! += 1
            } else {
                Counts[char] = 1
            }
        }
        CountsArr = Counts.sorted(by: { $0.1 > $1.1 })
        CounterTable.reloadData()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CountsArr.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value2, reuseIdentifier: "test")

        cell.textLabel?.text = String(CountsArr[indexPath.row].0)
        cell.detailTextLabel?.text = String(CountsArr[indexPath.row].1)
        return cell;
    }

    public func resizeSubviews() {
        Text.frame = MainView.frame
        CounterTable.frame = MainView.frame
    }


}