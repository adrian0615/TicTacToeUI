//
//  ViewController.swift
//  TicTacToeUI
//
//  Created by Adrian McDaniel on 1/4/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit
import TicTacToeCore

class ViewController: UIViewController {
    
    var board: Board = Board(slots: Array(repeating: .empty, count: 9), lastPlayed: .empty)
    
    var markers: [Board.Marker] = [.x, .o]
 
    var markerIndex: Int = 0 {
        didSet {
            if markerIndex >= markers.count {
                markerIndex %= markers.count
            }
            while markerIndex < 0 {
                markerIndex += markers.count
            }
        }
    }
    
    
    var currentMarker: Board.Marker {
        return markers[markerIndex]
    }
    
    var players: [String] = ["Player X", "Player O"]
    
    var playerIndex: Int = 0 {
        didSet {
            if playerIndex >= players.count {
                playerIndex %= players.count
            }
            while playerIndex < 0 {
                playerIndex += players.count
            }
        }
    }
    
    var currentPlayer: String {
        return players[playerIndex]
    }
    
    


 
    @IBOutlet var upperLeftLabel: UIButton!
    @IBOutlet var upperMiddleLabel: UIButton!
    @IBOutlet var upperRightLabel: UIButton!
    @IBOutlet var middleLeftLabel: UIButton!
    @IBOutlet var centerLabel: UIButton!
    @IBOutlet var middleRightLabel: UIButton!
    @IBOutlet var lowerLeftLabel: UIButton!
    @IBOutlet var lowerMiddleLabel: UIButton!
    @IBOutlet var lowerRightLabel: UIButton!
    
    @IBOutlet var playerLabel: UILabel!
    @IBOutlet var instructionsLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    @IBAction func placeUpperLeft(_ sender: UIButton) {
        if board.takeSlot(row: 0, column: 0, marker: currentMarker) == true && board.isThereAWinner() == false {
            nextMarker()
            nextPlayer()
            update()
        } else {
            update()
        }
        
    }
    
    @IBAction func placeUpperMiddle(_ sender: UIButton) {
        if board.takeSlot(row: 0, column: 1, marker: currentMarker) == true && board.isThereAWinner() == false {
            nextMarker()
            nextPlayer()
        } else {
            update()

        }
        
    }
    
    @IBAction func placeUpperRight(_ sender: UIButton) {
        if board.takeSlot(row: 0, column: 2, marker: currentMarker) == true && board.isThereAWinner() == false {
            nextMarker()
            nextPlayer()
            update()
        } else {
            update()

        }
        
    }
    
    @IBAction func placeMiddleLeft(_ sender: UIButton) {
        if board.takeSlot(row: 1, column: 0, marker: currentMarker) == true && board.isThereAWinner() == false {
            nextMarker()
            nextPlayer()
            update()
        } else {
            update()

        }
        
    }
    
    @IBAction func placeCenter(_ sender: UIButton) {
        if board.takeSlot(row: 1, column: 1, marker: currentMarker) == true && board.isThereAWinner() == false {
            nextMarker()
            nextPlayer()
            update()
        } else {
            update()

        }
        
    }
    
    @IBAction func placeMiddleRight(_ sender: UIButton) {
        if board.takeSlot(row: 1, column: 2, marker: currentMarker) == true && board.isThereAWinner() == false {
            nextMarker()
            nextPlayer()
            update()
        } else {
            update()

        }
        
    }
    
    @IBAction func placeLowerLeft(_ sender: UIButton) {
        if board.takeSlot(row: 2, column: 0, marker: currentMarker) == true && board.isThereAWinner() == false {
            nextMarker()
            nextPlayer()
            update()
        } else {
            update()

        }
        
    }
    
    @IBAction func placeLowerMiddle(_ sender: UIButton) {
        if board.takeSlot(row: 2, column: 1, marker: currentMarker) == true && board.isThereAWinner() == false {
            nextMarker()
            nextPlayer()
            update()
        } else {
            update()

        }
        
    }
    
    @IBAction func placeLowerRight(_ sender: UIButton) {
        if board.takeSlot(row: 2, column: 2, marker: currentMarker) == true && board.isThereAWinner() == false {
            nextMarker()
            nextPlayer()
            update()
        } else {
            update()

        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        update()
    }

    func update() {
        
        upperLeftLabel.setTitle(String(describing: board[0, 0]), for: .normal)
        upperMiddleLabel.setTitle(String(describing: board[0, 1]), for: .normal)
        upperRightLabel.setTitle(String(describing: board[0, 2]), for: .normal)
        middleLeftLabel.setTitle(String(describing: board[1, 0]), for: .normal)
        centerLabel.setTitle(String(describing: board[1, 1]), for: .normal)
        middleRightLabel.setTitle(String(describing: board[1, 2]), for: .normal)
        lowerLeftLabel.setTitle(String(describing: board[2, 0]), for: .normal)
        lowerMiddleLabel.setTitle(String(describing: board[2, 1]), for: .normal)
        lowerRightLabel.setTitle(String(describing: board[2, 2]), for: .normal)
        playerLabel.text = currentPlayer
        instructionsLabel.text = "TAP A SQUARE TO PLAY"
        statusLabel.text = currentStatus()
        
    }
    
    func nextMarker() {
        markerIndex += 1
    }
    
    func nextPlayer() {
        playerIndex += 1
    }
    
    func currentStatus() -> String {
        
        if board.boardFull() != true && board.isThereAWinner() != true {
            return "Game"
            
        } else if board[0, 0] == .x && board[0, 1] == .x && board[0, 2] == .x {
            return "Player X Wins!"
            
        } else if board[1, 0] == .x && board[1, 1] == .x && board[1, 2] == .x {
            return "Player X Wins!"
            
        } else if board[2, 0] == .x && board[2, 1] == .x && board[2, 2] == .x {
            return "Player X Wins!"
            
        } else if board[0, 0] == .x && board[1, 1] == .x && board[2, 2] == .x {
            return "Player X Wins!"
            
        } else if board[0, 2] == .x && board[1, 1] == .x && board[2, 0] == .x {
            return "Player X Wins!"
            
        } else if board[0, 0] == .x && board[1, 0] == .x && board[2, 0] == .x {
            return "Player X Wins!"
            
        } else if board[0, 1] == .x && board[1, 1] == .x && board[2, 1] == .x {
            return "Player X Wins!"
            
        } else if board[0, 2] == .x && board[1, 2] == .x && board[2, 2] == .x {
            return "Player X Wins!"
            
        } else if board[0, 0] == .o && board[0, 1] == .o && board[0, 2] == .o {
            return "Player O Wins!"
            
        } else if board[1, 0] == .o && board[1, 1] == .o && board[1, 2] == .o {
            return "Player O Wins!"
            
        } else if board[2, 0] == .o && board[2, 1] == .o && board[2, 2] == .o {
            return "Player O Wins!"
            
        } else if board[0, 0] == .o && board[1, 1] == .o && board[2, 2] == .o {
            return "Player O Wins!"
            
        } else if board[0, 2] == .o && board[1, 1] == .o && board[2, 0] == .o {
            return "Player O Wins!"
            
        } else if board[0, 0] == .o && board[1, 0] == .o && board[2, 0] == .o {
            return "Player O Wins!"
            
        } else if board[0, 1] == .o && board[1, 1] == .o && board[2, 1] == .o {
            return "Player O Wins!"
            
        } else if board[0, 2] == .o && board[1, 2] == .o && board[2, 2] == .o {
            return "Player O Wins!"
        } else {
            return "Draw"
        }
    }
}




