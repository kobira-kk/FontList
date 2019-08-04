//
//  ViewController.swift
//  fontList
//
//  Created by kk-project on 2019/08/03.
//  Copyright © 2019 kk-project. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // フォント名を入れる配列（文字列型の配列）
    var fontNameArray: [String] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        // フォントファミリー名を全て調べます
        for fontFamilyName in UIFont.familyNames {
            // そのフォントファミリーが持っているフォント名を全て調べます
            for fontName in UIFont.fontNames(forFamilyName: fontFamilyName as String) {
                fontNameArray.append(fontName)
            }
        }
    }

    // テーブルビューの行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontNameArray.count
    }

    // セルの表示内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // セルを作成します
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myCell")
        // このセルに表示にするフォント名を取得します
        let fontname = fontNameArray[indexPath.row]
        // テキストに指定したフォントでサンプル文字を表示します
        cell.textLabel?.font = UIFont(name: fontname, size: 18)
        cell.textLabel?.text = "ABCDE abcde 012345 あいうえお"

        // サブテキストにフォント名を表示します
        cell.detailTextLabel?.textColor = UIColor.brown
        cell.detailTextLabel?.text = fontname

        return cell
    }



}

