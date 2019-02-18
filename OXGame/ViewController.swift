//
//  ViewController.swift
//  OXGame
//
//  Created by フジタケンシン on 2018/10/24.
//  Copyright © 2018年 KenApps.com. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, MCBrowserViewControllerDelegate,
MCSessionDelegate, UITextFieldDelegate {
    
    let serviceType = "LCOC-Chat"
    
    var browser : MCBrowserViewController!
    var assistant : MCAdvertiserAssistant!
    var session : MCSession!
    var peerID: MCPeerID!
    var field = UIImage(named: "OXField")
    var maru = UIImage(named: "マル")
    var batu = UIImage(named: "バツ")
    var p1num : Int = 0 //自分が丸を書ける状態は0,書けない状態は1
    var locateI : Int = 0 //iの座標0~2
    var locateJ : Int = 0 //jの座標0~2
    var iOrJ : Int = 0 //iは0,jは1
    var fieldNum = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3) // 白紙は0,マルは1, バツは2
    var resetNum : Int = 0 // リセット不可能は0,可能は1
    
    @IBOutlet weak var fieldImage: UIImageView!
    @IBOutlet weak var image00: UIImageView!
    @IBOutlet weak var image01: UIImageView!
    @IBOutlet weak var image02: UIImageView!
    @IBOutlet weak var image10: UIImageView!
    @IBOutlet weak var image11: UIImageView!
    @IBOutlet weak var image12: UIImageView!
    @IBOutlet weak var image20: UIImageView!
    @IBOutlet weak var image21: UIImageView!
    @IBOutlet weak var image22: UIImageView!
    @IBOutlet weak var winOrLose: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fieldImage.image = field
        
        self.peerID = MCPeerID(displayName: UIDevice.current.name)
        self.session = MCSession(peer: peerID)
        self.session.delegate = self
        
        // create the browser viewcontroller with a unique service name
        self.browser = MCBrowserViewController(serviceType:serviceType,
                                               session:self.session)
        self.browser.delegate = self;
        self.assistant = MCAdvertiserAssistant(serviceType:serviceType,
                                               discoveryInfo:nil, session:self.session)
        
        // tell the assistant to start advertising our fabulous chat
        self.assistant.start()
    }
    
    
    @IBAction func button00(_ sender: UIButton) {
        if p1num == 0 && fieldNum[0][0] == 0{
            image00.image = maru
            fieldNum[0][0] = 1
            p1num = 1
            locateI = 0
            locateJ = 0
            self.winJudge(iLocate: locateI, jLocate: locateJ)
            let dataLocateI = NSData(bytes: &locateI, length: MemoryLayout<NSInteger>.size)
            let dataLocateJ = NSData(bytes: &locateJ, length: MemoryLayout<NSInteger>.size)
            do {
                try self.session.send(dataLocateI as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
                try self.session.send(dataLocateJ as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
            } catch {
                print(error)
            }
        }
    }
    @IBAction func button01(_ sender: UIButton) {
        if p1num == 0 && fieldNum[0][1] == 0{
            image01.image = maru
            fieldNum[0][1] = 1
            p1num = 1
            locateI = 0
            locateJ = 1
            self.winJudge(iLocate: locateI, jLocate: locateJ)
            let dataLocateI = NSData(bytes: &locateI, length: MemoryLayout<NSInteger>.size)
            let dataLocateJ = NSData(bytes: &locateJ, length: MemoryLayout<NSInteger>.size)
            do {
                try self.session.send(dataLocateI as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
                try self.session.send(dataLocateJ as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
            } catch {
                print(error)
            }
        }
    }
    @IBAction func button02(_ sender: UIButton) {
        if p1num == 0 && fieldNum[0][2] == 0{
            image02.image = maru
            fieldNum[0][2] = 1
            p1num = 1
            locateI = 0
            locateJ = 2
            self.winJudge(iLocate: locateI, jLocate: locateJ)
            let dataLocateI = NSData(bytes: &locateI, length: MemoryLayout<NSInteger>.size)
            let dataLocateJ = NSData(bytes: &locateJ, length: MemoryLayout<NSInteger>.size)
            do {
                try self.session.send(dataLocateI as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
                try self.session.send(dataLocateJ as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
            } catch {
                print(error)
            }
        }
    }
    @IBAction func button10(_ sender: UIButton) {
        if p1num == 0 && fieldNum[1][0] == 0{
            image10.image = maru
            fieldNum[1][0] = 1
            p1num = 1
            locateI = 1
            locateJ = 0
            self.winJudge(iLocate: locateI, jLocate: locateJ)
            let dataLocateI = NSData(bytes: &locateI, length: MemoryLayout<NSInteger>.size)
            let dataLocateJ = NSData(bytes: &locateJ, length: MemoryLayout<NSInteger>.size)
            do {
                try self.session.send(dataLocateI as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
                try self.session.send(dataLocateJ as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
            } catch {
                print(error)
            }
        }
    }
    @IBAction func button11(_ sender: UIButton) {
        if p1num == 0 && fieldNum[1][1] == 0{
            image11.image = maru
            fieldNum[1][1] = 1
            p1num = 1
            locateI = 1
            locateJ = 1
            self.winJudge(iLocate: locateI, jLocate: locateJ)
            let dataLocateI = NSData(bytes: &locateI, length: MemoryLayout<NSInteger>.size)
            let dataLocateJ = NSData(bytes: &locateJ, length: MemoryLayout<NSInteger>.size)
            do {
                try self.session.send(dataLocateI as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
                try self.session.send(dataLocateJ as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
            } catch {
                print(error)
            }
        }
    }
    @IBAction func button12(_ sender: UIButton) {
        if p1num == 0 && fieldNum[1][2] == 0{
            image12.image = maru
            fieldNum[1][2] = 1
            p1num = 1
            locateI = 1
            locateJ = 2
            self.winJudge(iLocate: locateI, jLocate: locateJ)
            let dataLocateI = NSData(bytes: &locateI, length: MemoryLayout<NSInteger>.size)
            let dataLocateJ = NSData(bytes: &locateJ, length: MemoryLayout<NSInteger>.size)
            do {
                try self.session.send(dataLocateI as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
                try self.session.send(dataLocateJ as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
            } catch {
                print(error)
            }
        }
    }
    @IBAction func button20(_ sender: UIButton) {
        if p1num == 0 && fieldNum[2][0] == 0{
            image20.image = maru
            fieldNum[2][0] = 1
            p1num = 1
            locateI = 2
            locateJ = 0
            self.winJudge(iLocate: locateI, jLocate: locateJ)
            let dataLocateI = NSData(bytes: &locateI, length: MemoryLayout<NSInteger>.size)
            let dataLocateJ = NSData(bytes: &locateJ, length: MemoryLayout<NSInteger>.size)
            do {
                try self.session.send(dataLocateI as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
                try self.session.send(dataLocateJ as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
            } catch {
                print(error)
            }
        }
    }
    @IBAction func button21(_ sender: UIButton) {
        if p1num == 0 && fieldNum[2][1] == 0{
            image21.image = maru
            fieldNum[2][1] = 1
            p1num = 1
            locateI = 2
            locateJ = 1
            self.winJudge(iLocate: locateI, jLocate: locateJ)
            let dataLocateI = NSData(bytes: &locateI, length: MemoryLayout<NSInteger>.size)
            let dataLocateJ = NSData(bytes: &locateJ, length: MemoryLayout<NSInteger>.size)
            do {
                try self.session.send(dataLocateI as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
                try self.session.send(dataLocateJ as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
            } catch {
                print(error)
            }
        }
    }
    @IBAction func button22(_ sender: UIButton) {
        if p1num == 0 && fieldNum[2][2] == 0{
            image22.image = maru
            fieldNum[2][2] = 1
            p1num = 1
            locateI = 2
            locateJ = 2
            self.winJudge(iLocate: locateI, jLocate: locateJ)
            let dataLocateI = NSData(bytes: &locateI, length: MemoryLayout<NSInteger>.size)
            let dataLocateJ = NSData(bytes: &locateJ, length: MemoryLayout<NSInteger>.size)
            do {
                try self.session.send(dataLocateI as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
                try self.session.send(dataLocateJ as Data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
            } catch {
                print(error)
            }
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        if(resetNum == 1){
            resetNum = 0
            resetButton.setTitle("", for: .normal)
            p1num = 0
            for i in 0..<3{
                for j in 0..<3{
                    fieldNum[i][j] = 0
                }
            }
            image00.image = nil
            image01.image = nil
            image02.image = nil
            image10.image = nil
            image11.image = nil
            image12.image = nil
            image20.image = nil
            image21.image = nil
            image22.image = nil
            winOrLose.text = ""
        }
    }
    
    
    // 勝敗の判定
    func winJudge(iLocate : Int, jLocate : Int){
        var judgeNum : Int
        // 引き分けの判定
        judgeNum = 0
        for i in 0..<3{
            for j in 0..<3{
                if (fieldNum[i][j] != 0){
                    judgeNum += 1
                }
            }
            if (judgeNum == 9){
                self.showWinOrLose(maruBatu: 3)
            }
        }
        // 縦の判定
        judgeNum = 0 // judgeNumが3になった時、勝利又は敗北
        for i in 0..<3{
            if fieldNum[i][jLocate] == fieldNum[iLocate][jLocate]{
                judgeNum += 1
            }
        }
        if judgeNum == 3{
            self.showWinOrLose(maruBatu: fieldNum[iLocate][jLocate])
        }
        // 横の判定
        judgeNum = 0
        for j in 0..<3{
            if fieldNum[iLocate][j] == fieldNum[iLocate][jLocate]{
                judgeNum += 1
            }
        }
        if judgeNum == 3{
            self.showWinOrLose(maruBatu: fieldNum[iLocate][jLocate])
        }
        // 斜めの判定
        switch iLocate{
        // 11が指定された時
        case 1:
            judgeNum = 0
            if jLocate != 1{
                break
            }
        // 00又は22が指定された時
        case jLocate:
            // 斜め右下方向の判定
            judgeNum = 0
            for i in 0..<3{
                for j in 0..<3{
                    if i == j && fieldNum[i][j] == fieldNum[iLocate][jLocate]{
                        judgeNum += 1
                    }
                }
            }
            if judgeNum == 3{
                self.showWinOrLose(maruBatu: fieldNum[iLocate][jLocate])
                break
            }
        // 02又は20が指定された時
        case 2 - jLocate:
            judgeNum = 0
            // 斜め左下方向の判定
            for i in 0..<3{
                for j in 0..<3{
                    if i == 2 - j && fieldNum[i][j] == fieldNum[iLocate][jLocate]{
                        judgeNum += 1
                    }
                }
            }
            if judgeNum == 3{
                self.showWinOrLose(maruBatu: fieldNum[iLocate][jLocate])
                break
            }
        default:
            break
        }
    }
    
    // 勝敗画面を表示
    func showWinOrLose(maruBatu : Int){
        if maruBatu == 1{
            winOrLose.text = "YOU WIN"
            p1num = 1
            resetNum = 1
            resetButton.setTitle("初めから", for: .normal)
        }else if maruBatu == 2{
            winOrLose.text = "YOU LOSE"
            p1num = 1
            resetNum = 1
            resetButton.setTitle("初めから", for: .normal)
        }else if maruBatu == 3{
            winOrLose.text = "DRAW"
            p1num = 1
            resetNum = 1
            resetButton.setTitle("初めから", for: .normal)
        }else{
        }
    }
    
    // 画像の更新
    func updateImage(num : Int, fromPeer peerID: MCPeerID) {
        
        // peerが自分のものでない時画像(マル,バツ)の更新
        switch peerID {
        case self.peerID:
            break
        default:
            if iOrJ == 0{
                locateI = num
                iOrJ = 1
            }else{
                locateJ = num
                switch locateI{
                case 0:
                    switch locateJ{
                    case 0:
                        image00.image = batu
                        break
                    case 1:
                        image01.image = batu
                        break
                    case 2:
                        image02.image = batu
                        break
                    default:
                        break
                    }
                    break
                case 1:
                    switch locateJ{
                    case 0:
                        image10.image = batu
                        break
                    case 1:
                        image11.image = batu
                        break
                    case 2:
                        image12.image = batu
                        break
                    default:
                        break
                    }
                    break
                case 2:
                    switch locateJ{
                    case 0:
                        image20.image = batu
                        break
                    case 1:
                        image21.image = batu
                        break
                    case 2:
                        image22.image = batu
                        break
                    default:
                        break
                    }
                    break
                default:
                    break
                }
                fieldNum[locateI][locateJ] = 2
                iOrJ = 0
                p1num = 0
            }
        }
        
    }
    
    @IBAction func showBrowser(sender: UIButton) {
        // Show the browser view controller
        self.present(self.browser, animated: true, completion: nil)
    }
    
    func browserViewControllerDidFinish(
        _ browserViewController: MCBrowserViewController)  {
        // Called when the browser view controller is dismissed (ie the Done
        // button was tapped)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(
        _ browserViewController: MCBrowserViewController)  {
        // Called when the browser view controller is cancelled
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // 相手からNSDataが送られてきたとき
    func session(_ session: MCSession, didReceive data: Data,
                 fromPeer peerID: MCPeerID)  {
        DispatchQueue.main.async() {
            let data = NSData(data: data)
            var locateNum : NSInteger = 0
            data.getBytes(&locateNum, length: data.length)
            // ラベルの更新
            self.updateImage(num: locateNum, fromPeer: peerID)
            self.winJudge(iLocate: self.locateI, jLocate: self.locateJ)
        }
    }
    
    // The following methods do nothing, but the MCSessionDelegate protocol
    // requires that we implement them.
    func session(_ session: MCSession,
                 didStartReceivingResourceWithName resourceName: String,
                 fromPeer peerID: MCPeerID, with progress: Progress)  {
        
        // Called when a peer starts sending a file to us
    }
    
    func session(_ session: MCSession,
                 didFinishReceivingResourceWithName resourceName: String,
                 fromPeer peerID: MCPeerID,
                 at localURL: URL?, withError error: Error?)  {
        // Called when a file has finished transferring from another peer
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream,
                 withName streamName: String, fromPeer peerID: MCPeerID)  {
        // Called when a peer establishes a stream with us
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID,
                 didChange state: MCSessionState)  {
        // Called when a connected peer changes state (for example, goes offline)
        
    }
}

