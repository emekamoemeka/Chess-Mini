//
//  ViewController.swift
//  Chess
//
//  Created by Emeka Moemeka on 1/6/23.
//

import UIKit

    // Initialize global variables
    var midturn = false
    var whitePawnDirection = -1
    var pressed: UIButton = UIButton()
    var piecePressed: UIImage? = nil
    var pressedcolor: UIColor? = nil
    var buttonArray: [[UIButton]] = []
    var whiteMove = true
    var flipOn = true
    var blackCastle = false
    var whiteCastle = false
    var blackKingMove = false
    var whiteKingMove = false
    var blackRookMove = false
    var whiteRookMove = false
    let piecesArray: [UIImage] = [UIImage(named: "R") ?? UIImage(), UIImage(named: "Q") ?? UIImage(), UIImage(named: "B") ?? UIImage(), UIImage(named: "N") ?? UIImage(), UIImage(named: "P") ?? UIImage(), UIImage(named: "K") ?? UIImage(), UIImage(named: "R1") ?? UIImage(), UIImage(named: "Q1") ?? UIImage(), UIImage(named: "B1") ?? UIImage(), UIImage(named: "N1") ?? UIImage(), UIImage(named: "P1") ?? UIImage(), UIImage(named: "K1") ?? UIImage()]
    var whiteMaterial = 30
    var blackMaterial = 30
    var whiteCheck = false
    var blackCheck = false
    var enemyKing: [Int]? = nil
    var copyBoard: [[Int]] = []
    let blackPieces = [UIImage(named: "P")!, UIImage(named: "N")!, UIImage(named: "B")!, UIImage(named: "R")!, UIImage(named: "Q")!, UIImage(named: "K")!]
    let whitePieces = [UIImage(named: "P1")!, UIImage(named: "N1")!, UIImage(named: "B1")!, UIImage(named: "R1")!, UIImage(named: "Q1")!, UIImage(named: "K1")!]
    var winCondition: String = "none"
    var gameOver = false
    

    
    

class ViewController: UIViewController {
    
    // Initialize rank 7
    @IBOutlet weak var a7: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var c7: UIButton!
    @IBOutlet weak var d7: UIButton!
    @IBOutlet weak var e7: UIButton!
    
    // Initialize rank 6
    @IBOutlet weak var a6: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var c6: UIButton!
    @IBOutlet weak var d6: UIButton!
    @IBOutlet weak var e6: UIButton!
    
    // Initialize rank 5
    @IBOutlet weak var a5: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var c5: UIButton!
    @IBOutlet weak var d5: UIButton!
    @IBOutlet weak var e5: UIButton!
    
    // Initialize rank 4
    @IBOutlet weak var a4: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var c4: UIButton!
    @IBOutlet weak var d4: UIButton!
    @IBOutlet weak var e4: UIButton!
    
    // Initialize rank 3
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var d3: UIButton!
    @IBOutlet weak var e3: UIButton!
    
    // Initialize rank 2
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var d2: UIButton!
    @IBOutlet weak var e2: UIButton!
    
    // Initialize rank 1
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var d1: UIButton!
    @IBOutlet weak var e1: UIButton!
    
    // Initialize flip & reset buttons
    @IBOutlet weak var flipButton: UIButton!
    @IBOutlet weak var resetButtonO: UIButton!
    // Initialize material counters
    @IBOutlet weak var bottomMaterialLabel: UILabel!
    @IBOutlet weak var topMaterialLabel: UILabel!
    
    // Initialize winScreen
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var rematchButton: UIButton!
    @IBOutlet weak var spacingLabel: UILabel!
    @IBOutlet weak var winView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Reinitialize global variables
        midturn = false
        pressed = UIButton()
        piecePressed = nil
        pressedcolor = nil
        buttonArray = []
        whiteMove = true
        whitePawnDirection = -1
        blackCastle = false
        whiteCastle = false
        blackKingMove = false
        whiteKingMove = false
        blackRookMove = false
        whiteRookMove = false
        whiteMaterial = 30
        blackMaterial = 30
        enemyKing? = [0, 0]
        blackCheck = false
        whiteCheck = false
        winCondition = "none"
        gameOver = false
        winView.isHidden = true
        
        
        // Initialize the screen
        view.backgroundColor = UIColor(red: 80/255, green: 92/255, blue: 108/255, alpha: 1.0)
        resetButtonO.isEnabled = true
        resetButtonO.backgroundColor = resetButtonO.backgroundColor?.withAlphaComponent(1.0)
        
        // Iniialize the board
        a7.setImage(UIImage(named: "N"), for: .normal)
        b7.setImage(UIImage(named: "Q"), for: .normal)
        c7.setImage(UIImage(named: "K"), for: .normal)
        d7.setImage(UIImage(named: "B"), for: .normal)
        e7.setImage(UIImage(named: "R"), for: .normal)
        a6.setImage(UIImage(named: "P"), for: .normal)
        b6.setImage(UIImage(named: "P"), for: .normal)
        c6.setImage(UIImage(named: "P"), for: .normal)
        d6.setImage(UIImage(named: "P"), for: .normal)
        e6.setImage(UIImage(named: "P"), for: .normal)
        a5.setImage(UIImage(), for: .normal)
        b5.setImage(UIImage(), for: .normal)
        c5.setImage(UIImage(), for: .normal)
        d5.setImage(UIImage(), for: .normal)
        e5.setImage(UIImage(), for: .normal)
        a4.setImage(UIImage(), for: .normal)
        b4.setImage(UIImage(), for: .normal)
        c4.setImage(UIImage(), for: .normal)
        d4.setImage(UIImage(), for: .normal)
        e4.setImage(UIImage(), for: .normal)
        a3.setImage(UIImage(), for: .normal)
        b3.setImage(UIImage(), for: .normal)
        c3.setImage(UIImage(), for: .normal)
        d3.setImage(UIImage(), for: .normal)
        e3.setImage(UIImage(), for: .normal)
        a2.setImage(UIImage(named: "P1"), for: .normal)
        b2.setImage(UIImage(named: "P1"), for: .normal)
        c2.setImage(UIImage(named: "P1"), for: .normal)
        d2.setImage(UIImage(named: "P1"), for: .normal)
        e2.setImage(UIImage(named: "P1"), for: .normal)
        a1.setImage(UIImage(named: "R1"), for: .normal)
        b1.setImage(UIImage(named: "B1"), for: .normal)
        c1.setImage(UIImage(named: "K1"), for: .normal)
        d1.setImage(UIImage(named: "Q1"), for: .normal)
        e1.setImage(UIImage(named: "N1"), for: .normal)
        bottomMaterialLabel.text = "  "
        topMaterialLabel.text = "  "
        enableAll()
        disableEmpty()
        
        if whiteMove {
            disableBlack()
        } else {
            disableWhite()
        }
        
        // Create an array of every button and a copyarray of the same size
        buttonArray = [[a7, b7, c7, d7, e7], [a6, b6, c6, d6, e6], [a5, b5, c5, d5, e5], [a4, b4, c4, d4, e4], [a3, b3, c3, d3, e3], [a2, b2, c2, d2, e2], [a1, b1, c1, d1, e1]]
        
        copyBoard = [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]
    
    }
    
    // If the resetButton is pressed, reset the board
    @IBAction func resetButton(_ sender: Any) {
        pressed.backgroundColor = pressedcolor
        viewDidLoad()
        enableAll()
        disableEmpty()
        
        if whiteMove {
            disableBlack()
        } else {
            disableWhite()
        }
        
    }
    
    // If any buttons in the board are pressed, call buttonpress with the appropriate parameters
    @IBAction func a7pressed(_ sender: Any) {
        buttonpress(B: a7)
    }
    @IBAction func b7pressed(_ sender: Any) {
        buttonpress(B: b7)
    }
    @IBAction func c7pressed(_ sender: Any) {
        buttonpress(B: c7)
    }
    @IBAction func d7pressed(_ sender: Any) {
        buttonpress(B: d7)
    }
    @IBAction func e7pressed(_ sender: Any) {
        buttonpress(B: e7)
    }
    @IBAction func a6pressed(_ sender: Any) {
        buttonpress(B: a6)
    }
    @IBAction func b6pressed(_ sender: Any) {
        buttonpress(B: b6)
    }
    @IBAction func c6pressed(_ sender: Any) {
        buttonpress(B: c6)
    }
    @IBAction func d6pressed(_ sender: Any) {
        buttonpress(B: d6)
    }
    @IBAction func e6pressed(_ sender: Any) {
        buttonpress(B: e6)
    }
    @IBAction func a5pressed(_ sender: Any) {
        buttonpress(B: a5)
    }
    @IBAction func b5pressed(_ sender: Any) {
        buttonpress(B: b5)
    }
    @IBAction func c5pressed(_ sender: Any) {
        buttonpress(B: c5)
    }
    @IBAction func d5pressed(_ sender: Any) {
        buttonpress(B: d5)
    }
    @IBAction func e5pressed(_ sender: Any) {
        buttonpress(B: e5)
    }
    @IBAction func a4pressed(_ sender: Any) {
        buttonpress(B: a4)
    }
    @IBAction func b4pressed(_ sender: Any) {
        buttonpress(B: b4)
    }
    @IBAction func c4pressed(_ sender: Any) {
        buttonpress(B: c4)
    }
    @IBAction func d4pressed(_ sender: Any) {
        buttonpress(B: d4)
    }
    @IBAction func e4pressed(_ sender: Any) {
        buttonpress(B: e4)
    }
    @IBAction func a3pressed(_ sender: Any) {
        buttonpress(B: a3)
    }
    @IBAction func b3pressed(_ sender: Any) {
        buttonpress(B: b3)
    }
    @IBAction func c3pressed(_ sender: Any) {
        buttonpress(B: c3)
    }
    @IBAction func d3pressed(_ sender: Any) {
        buttonpress(B: d3)
    }
    @IBAction func e3pressed(_ sender: Any) {
        buttonpress(B: e3)
    }
    @IBAction func a2pressed(_ sender: Any) {
        buttonpress(B: a2)
    }
    @IBAction func b2pressed(_ sender: Any) {
        buttonpress(B: b2)
    }
    @IBAction func c2pressed(_ sender: Any) {
        buttonpress(B: c2)
    }
    @IBAction func d2pressed(_ sender: Any) {
        buttonpress(B: d2)
    }
    @IBAction func e2pressed(_ sender: Any) {
        buttonpress(B: e2)
    }
    @IBAction func a1pressed(_ sender: Any) {
        buttonpress(B: a1)
    }
    @IBAction func b1pressed(_ sender: Any) {
        buttonpress(B: b1)
    }
    @IBAction func c1pressed(_ sender: Any) {
        buttonpress(B: c1)
    }
    @IBAction func d1pressed(_ sender: Any) {
        buttonpress(B: d1)
    }
    @IBAction func e1pressed(_ sender: Any) {
        buttonpress(B: e1)
    }
    
    // If the flip button is pressed, enable the board to be flipped
    @IBAction func flipBoard(_ sender: Any) {
        if flipOn {
            flipOn = false
            flipButton.imageView?.alpha = 0.5
            
        } else {
            flipOn = true
            flipButton.imageView?.alpha = 1
            
        }
    }
    
    // If the escape button is pressed, hide the winview and eneble resetButton
    @IBAction func escapeWinScreen(_ sender: Any) {
        winView.isHidden = true
        resetButtonO.isEnabled = true
    }
    
    
    // When a button is pressed...
    func buttonpress(B: UIButton) {
    
        // if we are not midturn...
        if !midturn {
            // Find the index of the button and disable all buttons.
            let indicies = findIndex(B: B)
            let rank: Int = indicies.row
            let file: Int = indicies.column
            disableAll()
            
                // If there is a pawn on B, enable pawn moves.
                if !whiteMove &&  B.image(for: .normal) == UIImage(named: "P") {
                    pawnMoves(rank: rank, file: file, enemyPieces: whitePieces, d: 1)
                    // Disable moves that put or leave the king in check
                    blockFinder(king: UIImage(named: "K")!, piece: UIImage(named: "P")!, B: B, method: enableWhiteAttacks)
                
                } else if whiteMove && B.image(for: .normal) == UIImage(named: "P1") {
                    pawnMoves(rank: rank, file: file, enemyPieces: blackPieces, d: -1)
                    // Disable moves that put or leave the king in check
                    blockFinder(king: UIImage(named: "K1")!, piece: UIImage(named: "P1")!, B: B, method: enableBlackAttacks)
                
                // If there is a king on B...
                } else if !whiteMove && B.image(for: .normal) == UIImage(named: "K") {
                    // enable white attacks, store the buttons enabled in copyBoard, and disable all buttons.
                    enableWhiteAttacks()
                    for i in 0..<buttonArray.count {
                        for j in 0..<buttonArray[i].count {
                            if buttonArray[i][j].isEnabled {
                                copyBoard[i][j] = 1
                            }
                        }
                    }
                    disableAll()
                    // Enable king moves.
                    kingMoves(rank: enemyKing![0], file: enemyKing![1], imagesToDisable: [UIImage(named: "Q")!, UIImage(named: "R")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!])
                   
                    // For every tile in the copyBoard, if said button is indicatd as enabled, disable its corresponding button in
                    // buttonArray.
                    for i in 0..<copyBoard.count {
                        for j in 0..<copyBoard[i].count {
                            if copyBoard[i][j] == 1 {
                                buttonArray[i][j].isEnabled = false
                                buttonArray[i][j].backgroundColor = buttonArray[i][j].backgroundColor?.withAlphaComponent(0.5)
                            }
                        }
                    }
                    
                } else if whiteMove && B.image(for: .normal) == UIImage(named: "K1") {
                    // Enable white attacks, store the buttons enabled in copyBoard, and disable all buttons.
                    enableBlackAttacks()
                    for i in 0..<buttonArray.count {
                        for j in 0..<buttonArray[i].count {
                            if buttonArray[i][j].isEnabled {
                                copyBoard[i][j] = 1
                            }
                        }
                    }
                    disableAll()
                    // Enable king moves.
                    kingMoves(rank: enemyKing![0], file: enemyKing![1], imagesToDisable: [UIImage(named: "Q1")!, UIImage(named: "R1")!, UIImage(named: "B1")!, UIImage(named: "N1")!, UIImage(named: "P1")!])
                    
                    // For every tile in the copyBoard, if said button is indicatd as enabled, disable its corresponding button in
                    // buttonArray.
                    for i in 0..<copyBoard.count {
                        for j in 0..<copyBoard[i].count {
                            if copyBoard[i][j] == 1 {
                                buttonArray[i][j].isEnabled = false
                                buttonArray[i][j].backgroundColor = buttonArray[i][j].backgroundColor?.withAlphaComponent(0.5)
                            }
                        }
                    }
                    
                    // If there is a rook on B...
                } else if !whiteMove && B.image(for: .normal) == UIImage(named: "R") {
                    // enable rook moves.
                    rookMoves(rank: rank, file: file, samePieces: [UIImage(named: "K")!, UIImage(named: "Q")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!], enemyPieces: [UIImage(named: "Q1")!, UIImage(named: "R1")!, UIImage(named: "B1")!, UIImage(named: "N1")!, UIImage(named: "P1")!])
                    // Disable moves that put or leave the king in check
                    blockFinder(king: UIImage(named: "K")!, piece: UIImage(named: "R")!, B: B, method: enableWhiteAttacks)

                } else if whiteMove && B.image(for: .normal) == UIImage(named: "R1") {
                    // Enable rook moves.
                    rookMoves(rank: rank, file: file, samePieces: [UIImage(named: "K1")!, UIImage(named: "Q1")!, UIImage(named: "B1")!, UIImage(named: "N1")!, UIImage(named: "P1")!], enemyPieces: [UIImage(named: "Q")!, UIImage(named: "R")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!])
                    // Disable moves that put or leave the king in check
                    blockFinder(king: UIImage(named: "K1")!, piece: UIImage(named: "R1")!, B: B, method: enableBlackAttacks)

                    // If there is a knight on B...
                } else if !whiteMove && B.image(for: .normal) == UIImage(named: "N") {
                    // enable knight moves.
                    knightMoves(rank: rank, file: file, imagesToDisable: [UIImage(named: "K")!, UIImage(named: "Q")!, UIImage(named: "B")!, UIImage(named: "R")!, UIImage(named: "P")!])
                    // Disable moves that put or leave the king in check
                    blockFinder(king: UIImage(named: "K")!, piece: UIImage(named: "N")!, B: B, method: enableWhiteAttacks)

                } else if whiteMove && B.image(for: .normal) == UIImage(named: "N1") {
                    // Enable knight moves.
                    knightMoves(rank: rank, file: file, imagesToDisable: [UIImage(named: "K1")!, UIImage(named: "Q1")!, UIImage(named: "B1")!, UIImage(named: "R1")!, UIImage(named: "P1")!])
                    // Disable moves that put or leave the king in check
                    blockFinder(king: UIImage(named: "K1")!, piece: UIImage(named: "N1")!, B: B, method: enableBlackAttacks)
                    
                    // If there is a bishop on b...
                } else if !whiteMove && B.image(for: .normal) == UIImage(named: "B") {
                    // enable bishop moves.
                    bishopMoves(rank: rank, file: file, samePieces: [UIImage(named: "K")!, UIImage(named: "Q")!, UIImage(named: "R")!, UIImage(named: "N")!, UIImage(named: "P")!], enemyPieces: [UIImage(named: "Q1")!, UIImage(named: "R1")!, UIImage(named: "B1")!, UIImage(named: "N1")!, UIImage(named: "P1")!])
                    // Disable moves that put or leave the king in check
                    blockFinder(king: UIImage(named: "K")!, piece: UIImage(named: "B")!, B: B, method: enableWhiteAttacks)

                } else if whiteMove && B.image(for: .normal) == UIImage(named: "B1") {
                    // Enable knight moves.
                    bishopMoves(rank: rank, file: file, samePieces: [UIImage(named: "K1")!, UIImage(named: "Q1")!, UIImage(named: "R1")!, UIImage(named: "N1")!, UIImage(named: "P1")!], enemyPieces: [UIImage(named: "Q")!, UIImage(named: "R")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!])
                    // Disable moves that put or leave the king in check
                    blockFinder(king: UIImage(named: "K")!, piece: UIImage(named: "B1")!, B: B, method: enableBlackAttacks)
                    
                    // If there is a queen on B...
                } else if !whiteMove && B.image(for: .normal) == UIImage(named: "Q") {
                    // enbale bishop and rook moves (queen moves)
                    bishopMoves(rank: rank, file: file, samePieces: [UIImage(named: "K")!, UIImage(named: "B")!, UIImage(named: "R")!, UIImage(named: "N")!, UIImage(named: "P")!], enemyPieces: [UIImage(named: "Q1")!, UIImage(named: "R1")!, UIImage(named: "B1")!, UIImage(named: "N1")!, UIImage(named: "P1")!])
                    rookMoves(rank: rank, file: file, samePieces: [UIImage(named: "K")!, UIImage(named: "R")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!], enemyPieces: [UIImage(named: "Q1")!, UIImage(named: "R1")!, UIImage(named: "B1")!, UIImage(named: "N1")!, UIImage(named: "P1")!])
                    // Disable moves that put or leave the king in check
                    blockFinder(king: UIImage(named: "K")!, piece: UIImage(named: "Q")!, B: B, method: enableWhiteAttacks)

                    
                } else if whiteMove && B.image(for: .normal) == UIImage(named: "Q1") {
                    // Enbale bishop and rook moves (queen moves)
                    bishopMoves(rank: rank, file: file, samePieces: [UIImage(named: "K1")!, UIImage(named: "B1")!, UIImage(named: "R1")!, UIImage(named: "N1")!, UIImage(named: "P1")!], enemyPieces: [UIImage(named: "Q")!, UIImage(named: "R")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!])
                    rookMoves(rank: rank, file: file, samePieces: [UIImage(named: "K1")!, UIImage(named: "R1")!, UIImage(named: "B1")!, UIImage(named: "N1")!, UIImage(named: "P1")!], enemyPieces: [UIImage(named: "Q")!, UIImage(named: "R")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!])
                    // Disable moves that put or leave the king in check
                    blockFinder(king: UIImage(named: "K1")!, piece: UIImage(named: "Q1")!, B: B, method: enableBlackAttacks)
                }
                
            // Disable same color pieces to prevent self captures
            if whiteMove {
                disableWhite()
            } else {
                disableBlack()
            }
            
            // Reenable castles
            let blackKing = UIImage(named: "K")
            
            // If castling conditions are met...
            if !whiteMove && B.image(for: .normal) == blackKing && !blackCastle && !blackRookMove && !blackKingMove && !blackCheck && !piecesArray.contains(buttonArray[rank][3].image(for: .normal)!) && copyBoard[rank][3] == 0 {
                // enable castles
                    buttonArray[rank][4].isEnabled = true
                    buttonArray[rank][4].backgroundColor = buttonArray[rank][4].backgroundColor?.withAlphaComponent(1)
                    
            }
            let whiteKing = UIImage(named: "K1")
            
            // If castling conditions are met...
            if whiteMove && B.image(for: .normal) == whiteKing && !whiteCastle && !whiteRookMove && !whiteKingMove && !whiteCheck && !piecesArray.contains(buttonArray[rank][1].image(for: .normal)!) && copyBoard[rank][1] == 0{
                // enable castles.
                    disableAll()
                    buttonArray[rank][0].isEnabled = true
                    buttonArray[rank][0].backgroundColor = buttonArray[rank][0].backgroundColor?.withAlphaComponent(1)
            }

            
            // Reenable B to allow for deselection
            B.isEnabled = true
            B.backgroundColor = B.backgroundColor?.withAlphaComponent(1)
            
            // save the button presed, save the piece pressed, set its background color to grey, and enter midturn.
            pressed = B
            pressedcolor = B.backgroundColor
            piecePressed = B.image(for: .normal)
            B.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
            midturn = true
        
            
            // If we are midturn...
        } else {
            
            // Reset the copy board
            copyBoard = [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]
            
            // If a move has been made...
            if B != pressed {
                // check for castle disables, if any of these conditions are set to true, the respective pieces will no longer be able to
                // castle
                if pressed.image(for: .normal) == UIImage(named: "K1") {
                    whiteKingMove = true
                } else if pressed.image(for: .normal) == UIImage(named: "K") {
                    blackKingMove = true
                } else if pressed.image(for: .normal) == UIImage(named: "R1") {
                    whiteRookMove = true
                } else if pressed.image(for: .normal) == UIImage(named: "R") {
                    blackRookMove = true
                }
                // Deduct respective material
                if B.image(for: .normal) == UIImage(named: "P") {
                    blackMaterial -= 1
                } else if B.image(for: .normal) == UIImage(named: "B") || B.image(for: .normal) == UIImage(named: "N"){
                    blackMaterial -= 3
                } else if B.image(for: .normal) == UIImage(named: "R") && whiteMove {
                    blackMaterial -= 5
                } else if B.image(for: .normal) == UIImage(named: "Q") {
                    blackMaterial -= 9
                } else if B.image(for: .normal) == UIImage(named: "Q1") {
                    whiteMaterial -= 9
                } else if B.image(for: .normal) == UIImage(named: "R1") && !whiteMove {
                    whiteMaterial -= 5
                } else if B.image(for: .normal) == UIImage(named: "B1") || B.image(for: .normal) == UIImage(named: "N1") {
                    whiteMaterial -= 3
                } else if B.image(for: .normal) == UIImage(named: "P1") {
                    whiteMaterial -= 1
                }
                // If black castles...
                if pressed.image(for: .normal) == UIImage(named: "K") && B.image(for: .normal) == UIImage(named: "R") && !blackCastle {
                    // castle black
                    if whitePawnDirection == 1 {
                        buttonArray[6][3].setImage(UIImage(named: "K"), for: .normal)
                        buttonArray[6][2].setImage(UIImage(named: "R"), for: .normal)
                        buttonArray[6][4].setImage(UIImage(), for: .normal)
                    } else {
                        buttonArray[0][3].setImage(UIImage(named: "K"), for: .normal)
                        buttonArray[0][2].setImage(UIImage(named: "R"), for: .normal)
                        buttonArray[0][4].setImage(UIImage(), for: .normal)
                    }
                    pressed.backgroundColor = pressedcolor
                    blackCastle = true
                    
                // Else if white castles...
                } else if pressed.image(for: .normal) == UIImage(named: "K1") && B.image(for: .normal) == UIImage(named: "R1") && !whiteCastle {
                    // Castle white
                    if whitePawnDirection == 1 {
                        buttonArray[0][1].setImage(UIImage(named: "K1"), for: .normal)
                        buttonArray[0][2].setImage(UIImage(named: "R1"), for: .normal)
                        buttonArray[0][0].setImage(UIImage(), for: .normal)
                    } else {
                        buttonArray[6][1].setImage(UIImage(named: "K1"), for: .normal)
                        buttonArray[6][2].setImage(UIImage(named: "R1"), for: .normal)
                        buttonArray[6][0].setImage(UIImage(), for: .normal)
                    }
                    pressed.backgroundColor = pressedcolor
                    whiteCastle = true
                } else {
                    // remove the piece from the first button presed...
                    pressed.setImage(UIImage(), for: .normal)
                    // put the piece on the second button
                    B.setImage(piecePressed, for: .normal)
                    // set the origional buttons color back to normal
                    pressed.backgroundColor = pressedcolor
                }
                // Look for checks
                disableAll()
                whiteCheck = false
                blackCheck = false
                // If its blacks turn...
                if !whiteMove {
                    // enable black attacks.
                    enableBlackAttacks()
                    // If the square occupied by the enemy king is enabled...
                    if buttonArray[enemyKing![0]][enemyKing![1]].isEnabled == true && buttonArray[enemyKing![0]][enemyKing![1]].image(for: .normal) == UIImage(named: "K1") {
                        // set whiteCheck to true.
                        whiteCheck = true
                    }
                // Else (if it is whites turn)...
                } else {
                    // enable white attacks.
                    enableWhiteAttacks()
                    // If the square occupied by the enemy king is enabled...
                    if buttonArray[enemyKing![0]][enemyKing![1]].isEnabled == true && buttonArray[enemyKing![0]][enemyKing![1]].image(for: .normal) == UIImage(named: "K") {
                        // set blackCheck to true.
                        blackCheck = true
                    }
                }
                
                // Check for checkmate.
                // If black is in check...
                if blackCheck == true {
                    // initilaize each pieces ability to be used to escape check to false.
                    var kingMove = false
                    var bishMove = false
                    var rookMove = false
                    var pawnMove = [false, false, false, false, false]
                    var knightMove = false
                    var queenMove = false
                    
                    // Enable white attacks, store the buttons enabled in copyBoard, and disable all buttons.
                    enableWhiteAttacks()
                    for i in 0..<buttonArray.count {
                        for j in 0..<buttonArray[i].count {
                            if buttonArray[i][j].isEnabled {
                                copyBoard[i][j] = 1
                            }
                        }
                    }
                    disableAll()
                    
                    // Enable king moves.
                    kingMoves(rank: enemyKing![0], file: enemyKing![1], imagesToDisable: [UIImage(named: "Q")!, UIImage(named: "R")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!])
                    
                    // For every tile in the copyBoard, if said button is indicatd as enabled, disable its corresponding button in buttonArray.
                    for i in 0..<copyBoard.count {
                        for j in 0..<copyBoard[i].count {
                            if copyBoard[i][j] == 1 {
                                buttonArray[i][j].isEnabled = false
                                buttonArray[i][j].backgroundColor = buttonArray[i][j].backgroundColor?.withAlphaComponent(0.5)
                            }
                        }
                    }
                    
                    // Initialize the 2D location of each black piece to nil, the number of pawns to 0, and the amount of buttons currently enabled to 0.
                    var enabled = 0
                    var bish: [Int?] = [nil, nil]
                    var rook: [Int?] = [nil, nil]
                    var knight: [Int?] = [nil, nil]
                    var queen: [Int?] = [nil, nil]
                    var pawn: [[Int?]] = [[nil, nil], [nil, nil], [nil, nil], [nil, nil], [nil, nil]]
                    var pawnNum = 0
                    
                    // For every button in buttonArray...
                    for i in 0..<buttonArray.count {
                        for j in 0..<buttonArray[i].count {
                            // if the button is enabled...
                            if buttonArray[i][j].isEnabled {
                                // increment enabled by 1.
                                enabled += 1
                            }
                            // If the black bishop is found...
                            if buttonArray[i][j].image(for: .normal) == UIImage(named: "B") {
                                // store the location in bish.
                                bish = [i, j]
                            }
                            // If the black rook is found...
                            if buttonArray[i][j].image(for: .normal) == UIImage(named: "R") {
                                // store the location in rook.
                                rook = [i, j]
                            }
                            // If the black knight is found...
                            if buttonArray[i][j].image(for: .normal) == UIImage(named: "N") {
                                // store the location in knight.
                                knight = [i, j]
                            }
                            // If the black queen is found...
                            if buttonArray[i][j].image(for: .normal) == UIImage(named: "Q") {
                                // store the location in queen.
                                queen = [i, j]
                            }
                            // If a black pawn is found...
                            if buttonArray[i][j].image(for: .normal) == UIImage(named: "P") {
                                // store the location in pawn at index pawnNum and increment pawnNum
                                pawn[pawnNum] = [i, j]
                                pawnNum += 1
                            }
                        }
                    }
                    // If any squares are enabled, set kingMove to true.
                    if enabled > 0 {
                        kingMove = true
                    }
                    disableAll()
                    // If the bishop has been found
                    if bish[0] != nil {
                        // Store the image of the pressed button and enable bishop moves.
                        let img = B.image(for: .normal)
                        bishopMoves(rank: bish[0]!, file: bish[1]!, samePieces: [UIImage(named: "Q")!, UIImage(named: "R")!, UIImage(named: "K")!, UIImage(named: "N")!, UIImage(named: "P")!], enemyPieces: [UIImage(named: "Q1")!, UIImage(named: "R1")!, UIImage(named: "K1")!, UIImage(named: "N1")!, UIImage(named: "P1")!,  UIImage(named: "B1")!])
                        
                        // Disable moves that put or leave the king in check and restore the origional image of B.
                        blockFinder(king: UIImage(named: "K")!, piece: UIImage(named: "B")!, B: buttonArray[bish[0]!][bish[1]!], method: enableWhiteAttacks)
                        B.setImage(img, for: .normal)
                        
                        // If any squares are enabled, set bishMove to true and disableAll.
                        if enableCount() > 0 {
                            bishMove = true
                        }
                    }
                    disableAll()
                    // If the rook has been found...
                    if rook[0] != nil {
                        // Store the image of the pressed button and enable bishop moves.
                         let img = B.image(for: .normal)
                        rookMoves(rank: rook[0]!, file: rook[1]!, samePieces: [UIImage(named: "Q")!, UIImage(named: "B")!, UIImage(named: "K")!, UIImage(named: "N")!, UIImage(named: "P")!], enemyPieces: [UIImage(named: "Q1")!, UIImage(named: "R1")!, UIImage(named: "K1")!, UIImage(named: "N1")!, UIImage(named: "P1")!,  UIImage(named: "B1")!])
                        
                        // Disable moves that put or leave the king in check and restore the origional image of B.
                        blockFinder(king: UIImage(named: "K")!, piece: UIImage(named: "R")!, B: buttonArray[rook[0]!][rook[1]!], method: enableWhiteAttacks)
                        B.setImage(img, for: .normal)
                        
                        // If any squares are enabled, set rookMove to true and disableAll.
                        if enableCount() > 0 {
                            rookMove = true
                        }
                    }
                    disableAll()
                    // If the knight has been found...
                    if knight[0] != nil {
                        // Store the image of the pressed button and enable knight moves.
                        let img = B.image(for: .normal)
                        knightMoves(rank: knight[0]!, file: knight[1]!, imagesToDisable: [UIImage(named: "Q")!, UIImage(named: "B")!, UIImage(named: "K")!, UIImage(named: "N")!, UIImage(named: "P")!])
                        
                        // Disable moves that put or leave the king in check and restore the origional image of B.
                        blockFinder(king: UIImage(named: "K")!, piece: UIImage(named: "N")!, B: buttonArray[knight[0]!][knight[1]!], method: enableWhiteAttacks)
                        B.setImage(img, for: .normal)
                        
                        // If any squares are enabled, set knightMove to true and disableAll.
                        if enableCount() > 0 {
                            knightMove = true
                        }
                    }
                    disableAll()
                    // If the queen has been found...
                    if queen[0] != nil {
                        // Store the image of the pressed button and enable queen moves.
                        let img = B.image(for: .normal)
                        bishopMoves(rank: queen[0]!, file: queen[1]!, samePieces: [UIImage(named: "B")!, UIImage(named: "R")!, UIImage(named: "K")!, UIImage(named: "N")!, UIImage(named: "P")!], enemyPieces: [UIImage(named: "Q1")!, UIImage(named: "R1")!, UIImage(named: "K1")!, UIImage(named: "N1")!, UIImage(named: "P1")!,  UIImage(named: "B1")!])
                        rookMoves(rank: queen[0]!, file: queen[1]!, samePieces: [UIImage(named: "R")!, UIImage(named: "B")!, UIImage(named: "K")!, UIImage(named: "N")!, UIImage(named: "P")!], enemyPieces: [UIImage(named: "Q1")!, UIImage(named: "R1")!, UIImage(named: "K1")!, UIImage(named: "N1")!, UIImage(named: "P1")!,  UIImage(named: "B1")!])
                        
                        // Disable moves that put or leave the king in check and estore the origional image of B.
                        blockFinder(king: UIImage(named: "K")!, piece: UIImage(named: "Q")!, B: buttonArray[queen[0]!][queen[1]!], method: enableWhiteAttacks)
                        B.setImage(img, for: .normal)
                        
                        // If any squares are enabled, set queentMove to true and disableAll.
                        if enableCount() > 0 {
                            queenMove = true
                        }
                    }
                    
                    // For every white pawn on the board...
                    for i in 0..<pawnNum {
                        // Store the image of the pressed button, disableAll and enable the ith pawns moves
                        disableAll()
                        pawnMoves(rank: pawn[i][0]!, file: pawn[i][1]!, enemyPieces: whitePieces, d: 1)
                        let img = B.image(for: .normal)
                        
                        // Disable moves that put or leave the king in check and restore the origional image of B.
                        blockFinder(king: UIImage(named: "K")!, piece: UIImage(named: "P")!, B: buttonArray[pawn[i][0]!][pawn[i][1]!], method: enableWhiteAttacks)
                        B.setImage(img, for: .normal)
                        
                        // If any squares are enabled, set pawnMove to true and disableAll.
                        if enableCount() > 0 {
                            pawnMove[i] = true
                        }
                    }
                    
                    // If no pieces can move, declare the game over and assign the apropriate win conition.
                    if !kingMove && !bishMove && !rookMove && !knightMove && !queenMove && pawnMove.allSatisfy({ $0 == false }) {
                        gameOver = true
                        winCondition = "white won by checkmate"
                    }
                    // DisableAll.
                    disableAll()
                }
                
                // If white is in check...
                if whiteCheck == true {
                    // initilaize each pieces ability to be used to escape check to false.
                    var kingMove = false
                    var bishMove = false
                    var rookMove = false
                    var pawnMove = [false, false, false, false, false]
                    var knightMove = false
                    var queenMove = false
                    
                    // Enable white attacks, store the buttons enabled in copyBoard, and disable all buttons.
                    enableBlackAttacks()
                    for i in 0..<buttonArray.count {
                        for j in 0..<buttonArray[i].count {
                            if buttonArray[i][j].isEnabled {
                                copyBoard[i][j] = 1
                            }
                        }
                    }
                    disableAll()
                    
                    // Enable king moves.
                    kingMoves(rank: enemyKing![0], file: enemyKing![1], imagesToDisable: [UIImage(named: "Q1")!, UIImage(named: "R1")!, UIImage(named: "B1")!, UIImage(named: "N1")!, UIImage(named: "P1")!])
                    
                    // For every tile in the copyBoard, if said button is indicatd as enabled, disable its corresponding button in
                    // buttonArray.
                    for i in 0..<copyBoard.count {
                        for j in 0..<copyBoard[i].count {
                            if copyBoard[i][j] == 1 {
                                buttonArray[i][j].isEnabled = false
                                buttonArray[i][j].backgroundColor = buttonArray[i][j].backgroundColor?.withAlphaComponent(0.5)
                            }
                        }
                    }
                    
                    // Initialize the 2D location of each piece to nil, the number of pawns to 0, and the amount of buttons currently enabled to 0.
                    var enabled = 0
                    var bish: [Int?] = [nil, nil]
                    var rook: [Int?] = [nil, nil]
                    var knight: [Int?] = [nil, nil]
                    var queen: [Int?] = [nil, nil]
                    var pawn: [[Int?]] = [[nil, nil], [nil, nil], [nil, nil], [nil, nil], [nil, nil]]
                    var pawnNum = 0
                    
                    // For every button in buttonArray...
                    for i in 0..<buttonArray.count {
                        for j in 0..<buttonArray[i].count {
                            // if the buttonis enabled...
                            if buttonArray[i][j].isEnabled {
                                // increment enabled by 1.
                                enabled += 1
                            }
                            // If the white bishop is found...
                            if buttonArray[i][j].image(for: .normal) == UIImage(named: "B1") {
                                bish = [i, j]
                                // store the location in bish.
                            }
                            // If the white rook is found...
                            if buttonArray[i][j].image(for: .normal) == UIImage(named: "R1") {
                                rook = [i, j]
                                // store the location in rook.
                            }
                            // If the white knight is found...
                            if buttonArray[i][j].image(for: .normal) == UIImage(named: "N1") {
                                knight = [i, j]
                                // store the location in knight.
                            }
                            // If the white queen is found...
                            if buttonArray[i][j].image(for: .normal) == UIImage(named: "Q1") {
                                queen = [i, j]
                                // store the location in queen.
                            }
                            // If a white pawn is found...
                            if buttonArray[i][j].image(for: .normal) == UIImage(named: "P1") {
                                // store the location in pawn at index pawnNum and increment pawnNum.
                                pawn[pawnNum] = [i, j]
                                pawnNum += 1
                            }
                        }
                    }
                    
                    // If any squares are enabled, set knightMove to true and disableAll.
                    if enabled > 0 {
                        kingMove = true

                    }
                    
                    disableAll()
                    // If the bishop has been found...
                    if bish[0] != nil {
                        // Store the image of the pressed button and enable bishop moves.
                        let img = B.image(for: .normal)
                        bishopMoves(rank: bish[0]!, file: bish[1]!, samePieces: [UIImage(named: "Q1")!, UIImage(named: "R1")!, UIImage(named: "K1")!, UIImage(named: "N1")!, UIImage(named: "P1")!], enemyPieces: [UIImage(named: "Q")!, UIImage(named: "R")!, UIImage(named: "K")!, UIImage(named: "N")!, UIImage(named: "P")!,  UIImage(named: "B")!])
                        
                        // Disable moves that put or leave the king in check and restore the origional image of B.
                        blockFinder(king: UIImage(named: "K1")!, piece: UIImage(named: "B1")!, B: buttonArray[bish[0]!][bish[1]!], method: enableBlackAttacks)
                        B.setImage(img, for: .normal)
                        
                        // If any squares are enabled, set knightMove to true and disableAll.
                        if enableCount() > 0 {
                            bishMove = true
                        }

                    }
                    
                    disableAll()
                    // If the rook has been found...
                    if rook[0] != nil {
                        // Store the image of the pressed button and enable bishop moves.
                        let img = B.image(for: .normal)
                        rookMoves(rank: rook[0]!, file: rook[1]!, samePieces: [UIImage(named: "Q1")!, UIImage(named: "B1")!, UIImage(named: "K1")!, UIImage(named: "N1")!, UIImage(named: "P1")!], enemyPieces: [UIImage(named: "Q")!, UIImage(named: "R")!, UIImage(named: "K")!, UIImage(named: "N")!, UIImage(named: "P")!,  UIImage(named: "B")!])
                        
                        // Disable moves that put or leave the king in check and restore the origional image of B.
                        blockFinder(king: UIImage(named: "K1")!, piece: UIImage(named: "R1")!, B: buttonArray[rook[0]!][rook[1]!], method: enableBlackAttacks)
                        B.setImage(img, for: .normal)

                        // If any squares are enabled, set knightMove to true and disableAll.
                        if enableCount() > 0 {
                            rookMove = true
                            
                        }
                    }
                    
                    disableAll()
                    // If the knight has been found...
                    if knight[0] != nil {
                        // Store the image of the pressed button and enable bishop moves.
                        let img = B.image(for: .normal)
                        knightMoves(rank: knight[0]!, file: knight[1]!, imagesToDisable: [UIImage(named: "Q1")!, UIImage(named: "B1")!, UIImage(named: "K1")!, UIImage(named: "N1")!, UIImage(named: "P1")!])
                        
                        // Disable moves that put or leave the king in check and restore the origional image of B.
                        blockFinder(king: UIImage(named: "K1")!, piece: UIImage(named: "N1")!, B: buttonArray[knight[0]!][knight[1]!], method: enableBlackAttacks)
                        
                        // If any squares are enabled, set knightMove to true and disableAll.
                        if enableCount() > 0 {
                            knightMove = true
                        }
                        B.setImage(img, for: .normal)
                    }
                    
                    disableAll()
                    // If the queen has been found...
                    if queen[0] != nil {
                        // Store the image of the pressed button and enable bishop moves.
                        let img = B.image(for: .normal)
                        bishopMoves(rank: queen[0]!, file: queen[1]!, samePieces: [UIImage(named: "B1")!, UIImage(named: "R1")!, UIImage(named: "K1")!, UIImage(named: "N1")!, UIImage(named: "P1")!], enemyPieces: [UIImage(named: "Q")!, UIImage(named: "R")!, UIImage(named: "K")!, UIImage(named: "N")!, UIImage(named: "P")!,  UIImage(named: "B")!])
                        rookMoves(rank: queen[0]!, file: queen[1]!, samePieces: [UIImage(named: "R1")!, UIImage(named: "B1")!, UIImage(named: "K1")!, UIImage(named: "N1")!, UIImage(named: "P1")!], enemyPieces: [UIImage(named: "Q")!, UIImage(named: "R")!, UIImage(named: "K")!, UIImage(named: "N")!, UIImage(named: "P")!,  UIImage(named: "B")!])
                        
                        // Disable moves that put or leave the king in check and restore the origional image of B.
                        blockFinder(king: UIImage(named: "K1")!, piece: UIImage(named: "Q1")!, B: buttonArray[queen[0]!][queen[1]!], method: enableBlackAttacks)
                        
                        // If any squares are enabled, set knightMove to true and disableAll.
                        if enableCount() > 0 {
                            queenMove = true
                        }
                        B.setImage(img, for: .normal)
                    }
                    // For every white pawn on the board...
                    for i in 0..<pawnNum {
                        // Store the image of the pressed button, disableAll and enable the ith pawns moves
                        disableAll()
                        let img = B.image(for: .normal)
                        pawnMoves(rank: pawn[i][0]!, file: pawn[i][1]!, enemyPieces: blackPieces, d: -1)
                        
                        // Disable moves that put or leave the king in check and restore the origional image of B.
                        blockFinder(king: UIImage(named: "K1")!, piece: UIImage(named: "P1")!, B: buttonArray[pawn[i][0]!][pawn[i][1]!], method: enableBlackAttacks)
                        B.setImage(img, for: .normal)
                        
                        // If any squares are enabled, set knightMove to true and disableAll.
                        if enableCount() > 0 {
                            pawnMove[i] = true
                        }
                    }
                    
                    // If no pieces can move, declare the game over and assign the apropriate win conition.
                    if !kingMove && !bishMove && !rookMove && !knightMove && !queenMove && pawnMove.allSatisfy({ $0 == false }) {
                        gameOver = true
                        winCondition = "black won by chekcmate"
                        
                    }
                    
                    // DisableAll
                    disableAll()
                }
                
                // Check for promotion.
                // If a black pawn has been moved...
                if B.image(for: .normal) == UIImage(named: "P") {
                    // if the pawn has moved to its final rank set its image to the black queen, and adjust material accordingly.
                    if whitePawnDirection == -1 {
                        let pawnLocation = findIndex(B: B)
                        if pawnLocation.row == 6 {
                            buttonArray[pawnLocation.row][pawnLocation.column].setImage(UIImage(named: "Q"), for: .normal)
                            blackMaterial += 8
                        }
                    } else if whitePawnDirection == 1 {
                        let pawnLocation = findIndex(B: B)
                        if pawnLocation.row == 0 {
                            buttonArray[pawnLocation.row][pawnLocation.column].setImage(UIImage(named: "Q"), for: .normal)
                            whiteMaterial += 8
                        }
                    }
                    
                // Else if a white pawn has been moved...
                } else if B.image(for: .normal) == UIImage(named: "P1") {
                    // if the pawn has moved to its final rank set its image to the white queen, and adjust material accordingly.
                    if whitePawnDirection == -1 {
                        let pawnLocation = findIndex(B: findPiece(B: UIImage(named: "P1")!)!)
                        if pawnLocation.row == 0 {
                            buttonArray[pawnLocation.row][pawnLocation.column].setImage(UIImage(named: "Q1"), for: .normal)
                        }
                    } else if whitePawnDirection == 1 {
                        let pawnLocation = findIndex(B: findPiece(B: UIImage(named: "P1")!)!)
                        if pawnLocation.row == 6 {
                            buttonArray[pawnLocation.row][pawnLocation.column].setImage(UIImage(named: "Q1"), for: .normal)
                        }
                    }
                }
                
                // Enable all buttons, exit midturn, and swich turns
                enableAll()
                disableEmpty()
                midturn = false
                
                if whiteMove {
                    whiteMove = false
                    disableWhite()
                } else {
                    whiteMove = true
                    disableBlack()
                    
                }
                if flipOn {
                    flip()
                }
                
                // Display material
                if whiteMaterial > blackMaterial {
                    if whitePawnDirection == -1 {
                        bottomMaterialLabel.text = "+\(whiteMaterial - blackMaterial)"
                        topMaterialLabel.text = "  "
                    } else {
                        topMaterialLabel.text = "+\(whiteMaterial - blackMaterial)"
                        bottomMaterialLabel.text = ""
                    }
                } else if whiteMaterial < blackMaterial {
                    if whitePawnDirection == -1 {
                        topMaterialLabel.text = "+\(blackMaterial - whiteMaterial)"
                        bottomMaterialLabel.text = "  "
                    } else {
                        bottomMaterialLabel.text = "+\(blackMaterial - whiteMaterial)"
                        topMaterialLabel.text = "  "
                    }

                } else {
                    topMaterialLabel.text = "  "
                    bottomMaterialLabel.text = "  "
                }
                
                // Display win condition
                if gameOver {
                    winView.isHidden = false
                    winLabel.text = winCondition
                    disableAll()
                    resetButtonO.isEnabled = false
                }
                
            // If B was deselected...
            } else {
                // exit midturn and reset the board.
                midturn = false
                pressed.backgroundColor = pressedcolor
                enableAll()
                disableEmpty()
                if whiteMove {
                    disableBlack()
                } else {
                    disableWhite()
                }
                
            }
            
            
        }
    }
    
    // Disables all buttons in the board.
    func disableAll() {
        for row in buttonArray {
            for B in row {
                B.isEnabled = false
                B.backgroundColor = B.backgroundColor?.withAlphaComponent(0.5)
            }
        }
    }
    
    // Enables all buttons in the board.
    func enableAll() {
        for row in buttonArray {
            for B in row {
                B.isEnabled = true
                B.backgroundColor = B.backgroundColor?.withAlphaComponent(1)
            }
        }
    }
    
    // Disables the black pieces.
    func disableBlack() {
        let imagesToDisable = [UIImage(named: "K"), UIImage(named: "Q"), UIImage(named: "R"), UIImage(named: "B"), UIImage(named: "N"), UIImage(named: "P")]
        for row in buttonArray {
            for B in row {
                if imagesToDisable.contains(B.image(for: .normal)) {
                    B.isEnabled = false
                    
                }
            }
        }
    }
    
    // Disables the white pieces.
    func disableWhite() {
        let imagesToDisable = [UIImage(named: "K1"), UIImage(named: "Q1"), UIImage(named: "R1"), UIImage(named: "B1"), UIImage(named: "N1"), UIImage(named: "P1")]
        for row in buttonArray {
            for B in row {
                if imagesToDisable.contains(B.image(for: .normal)) {
                    B.isEnabled = false
                    
                }
            }
        }
    }
    
    // Disables the empty buttons.
    func disableEmpty() {
        let imagesToDisable = [UIImage(named: "K1"), UIImage(named: "Q1"), UIImage(named: "R1"), UIImage(named: "B1"), UIImage(named: "N1"), UIImage(named: "P1"), UIImage(named: "K"), UIImage(named: "Q"), UIImage(named: "R"), UIImage(named: "B"), UIImage(named: "N"), UIImage(named: "P")]
        for row in buttonArray {
            for B in row {
                if !imagesToDisable.contains(B.image(for: .normal)) {
                    B.isEnabled = false
                    
                }
            }
        }
    }
    
    // Enable the moves of the bishop.
    func bishopMoves(rank: Int, file: Int, samePieces: [UIImage], enemyPieces: [UIImage]) {
        // Initialize i and j to the rank and file of a button adjacent to the bishop.
        var i = rank - 1; var j = file - 1
        // While i and j are in the bounds of the board...
        while (i >= 0 && j >= 0) {
            // if a same colored piece is on this button...
            if samePieces.contains(buttonArray[i][j].image(for: .normal)!) {
                // break out of the loop.
                break
            // Else if a different colored piece is on this button...
            } else if enemyPieces.contains(buttonArray[i][j].image(for: .normal)!) {
                // enable the current button then break out of the loop.
                buttonArray[i][j].isEnabled = true
                buttonArray[i][j].backgroundColor = buttonArray[i][j].backgroundColor?.withAlphaComponent(1)
                break
            // Else if there is no piece on this button...
            } else {
                // enable the button and move to the next button on the current diagonal.
                buttonArray[i][j].isEnabled = true
                buttonArray[i][j].backgroundColor = buttonArray[i][j].backgroundColor?.withAlphaComponent(1)
                i -= 1
                j -= 1
            }
        }
        // Initialize k and l to the rank and file of the next button adjacent to the bishop.
        var k = rank + 1; var l = file + 1
        // While k and l are in the bounds of the board...
        while (k < buttonArray.count && l < buttonArray[rank].count) {
            // if a same colored piece is on this button...
            if samePieces.contains(buttonArray[k][l].image(for: .normal)!) {
                // break out of the loop.
                break
            // Else if a different colored piece is on this button...
            } else if enemyPieces.contains(buttonArray[k][l].image(for: .normal)!) {
                // enable the current button then break out of the loop.
                buttonArray[k][l].isEnabled = true
                buttonArray[k][l].backgroundColor = buttonArray[k][l].backgroundColor?.withAlphaComponent(1)
                break
            // Else if there is no piece on this button...
            } else {
                // enable the button and move to the next button on the next diagonal.
                buttonArray[k][l].isEnabled = true
                buttonArray[k][l].backgroundColor = buttonArray[k][l].backgroundColor?.withAlphaComponent(1)
                k += 1
                l += 1
            }
        }
        // Initialize m and n to the rank and file of the next button adjacent to the bishop.
        var m = rank + 1; var n = file - 1
        // While m and n are in the bounds of the board...
        while (m < buttonArray.count && n >= 0) {
            // if a same colored piece is on this button...
            if samePieces.contains(buttonArray[m][n].image(for: .normal)!) {
                // break out of the loop.
                break
            // Else if a different colored piece is on this button...
            } else if enemyPieces.contains(buttonArray[m][n].image(for: .normal)!) {
                // enable the current button then break out of the loop.
                buttonArray[m][n].isEnabled = true
                buttonArray[m][n].backgroundColor = buttonArray[m][n].backgroundColor?.withAlphaComponent(1)
                break
            // Else if there is no piece on this button...
            } else {
                // enable the button and move to the next button on the next diagonal.
                buttonArray[m][n].isEnabled = true
                buttonArray[m][n].backgroundColor = buttonArray[m][n].backgroundColor?.withAlphaComponent(1)
                m += 1
                n -= 1
            }
        }
        // Initialize t and v to the rank and file of the next button adjacent to the bishop.
        var t = rank - 1; var v = file + 1
        // While t and v are in the bounds of the board...
        while (t >= 0 && v < buttonArray[rank].count) {
            // if a same colored piece is on this button...
            if samePieces.contains(buttonArray[t][v].image(for: .normal)!) {
                // break out of the loop.
                break
            // Else if a different colored piece is on this button...
            } else if enemyPieces.contains(buttonArray[t][v].image(for: .normal)!) {
                // enable the current button then break out of the loop.
                buttonArray[t][v].isEnabled = true
                buttonArray[t][v].backgroundColor = buttonArray[t][v].backgroundColor?.withAlphaComponent(1)
                break
                // Else if there is no piece on this button...
            } else {
                // enable the button and move to the next button on the next diagonal.
                buttonArray[t][v].isEnabled = true
                buttonArray[t][v].backgroundColor = buttonArray[t][v].backgroundColor?.withAlphaComponent(1)
                t -= 1
                v += 1
            }
        }
    }
    
    // Enable the moves of the king.
    func kingMoves(rank: Int, file: Int, imagesToDisable: [UIImage]) {
        // If a button adjacent to the king is in bounds and not occupied by a same color piece...
        if rank + 1 < buttonArray.count && !imagesToDisable.contains(buttonArray[rank + 1][file].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank + 1][file].isEnabled = true
            buttonArray[rank + 1][file].backgroundColor = buttonArray[rank + 1][file].backgroundColor?.withAlphaComponent(1)
        }
        // If the next button adjacent to the king is in bounds and not occupied by a same color piece...
        if rank - 1 >= 0 && !imagesToDisable.contains(buttonArray[rank - 1][file].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank - 1][file].isEnabled = true
            buttonArray[rank - 1][file].backgroundColor = buttonArray[rank - 1][file].backgroundColor?.withAlphaComponent(1)
        }
        // If the next button adjacent to the king is in bounds and not occupied by a same color piece...
        if file + 1 < buttonArray[rank].count && !imagesToDisable.contains(buttonArray[rank][file + 1].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank][file + 1].isEnabled = true
            buttonArray[rank][file + 1].backgroundColor = buttonArray[rank][file + 1].backgroundColor?.withAlphaComponent(1)
        }
        // If the next button adjacent to the king is in bounds and not occupied by a same color piece...
        if  file - 1 >= 0 && !imagesToDisable.contains(buttonArray[rank][file - 1].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank][file - 1].isEnabled = true
            buttonArray[rank][file - 1].backgroundColor = buttonArray[rank][file - 1].backgroundColor?.withAlphaComponent(1)
        }
        // If the next button adjacent to the king is in bounds and not occupied by a same color piece...
        if rank + 1 < buttonArray.count && file + 1 < buttonArray[rank].count &&  !imagesToDisable.contains(buttonArray[rank + 1][file + 1].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank + 1][file + 1].isEnabled = true
            buttonArray[rank + 1][file + 1].backgroundColor = buttonArray[rank + 1][file + 1].backgroundColor?.withAlphaComponent(1)
        }
        // If the next button adjacent to the king is in bounds and not occupied by a same color piece...
        if  rank - 1 >= 0 && file - 1 >= 0 && !imagesToDisable.contains(buttonArray[rank - 1][file - 1].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank - 1][file - 1].isEnabled = true
            buttonArray[rank - 1][file - 1].backgroundColor = buttonArray[rank - 1][file - 1].backgroundColor?.withAlphaComponent(1)
        }
        // If the next button adjacent to the king is in bounds and not occupied by a same color piece...
        if  rank + 1 < buttonArray.count && file - 1 >= 0 && !imagesToDisable.contains(buttonArray[rank + 1][file - 1].image(for: .normal)!){
            // enable the button.
            buttonArray[rank + 1][file - 1].isEnabled = true
            buttonArray[rank + 1][file - 1].backgroundColor = buttonArray[rank + 1][file - 1].backgroundColor?.withAlphaComponent(1)
        }
        // If the next button adjacent to the king is in bounds and not occupied by a same color piece...
        if rank - 1 >= 0 && file + 1 < buttonArray[rank].count && !imagesToDisable.contains(buttonArray[rank - 1][file + 1].image(for: .normal)!){
            // enable the button.
            buttonArray[rank - 1][file + 1].isEnabled = true
            buttonArray[rank - 1][file + 1].backgroundColor = buttonArray[rank - 1][file + 1].backgroundColor?.withAlphaComponent(1)
        }
    }
    
    // Enable the moves of the king.
    func rookMoves(rank: Int, file: Int, samePieces: [UIImage], enemyPieces: [UIImage]) {
        // Initialize i to the rank of a button adjacent to the rook.
        var i = rank - 1
        // While i is in the bounds of the board...
        while (i >= 0) {
            // if a same colored piece is on this button...
            if samePieces.contains(buttonArray[i][file].image(for: .normal)!) {
                // break out of the loop.
                break
            // Else if a different colored piece is on this button...
            } else if enemyPieces.contains(buttonArray[i][file].image(for: .normal)!) {
                // enable the current button then break out of the loop.
                buttonArray[i][file].isEnabled = true
                buttonArray[i][file].backgroundColor = buttonArray[i][file].backgroundColor?.withAlphaComponent(1)
                break
            // Else if there is no piece on this button...
            } else {
                // enable the button and move to the next button on the current file.
                buttonArray[i][file].isEnabled = true
                buttonArray[i][file].backgroundColor = buttonArray[i][file].backgroundColor?.withAlphaComponent(1)
                i -= 1
            }
        }
        // Initialize k to the rank of the next button adjacent to the rook.
        var k = rank + 1
        // While k is in the bounds of the board...
        while (k < buttonArray.count) {
            // if a same colored piece is on this button...
            if samePieces.contains(buttonArray[k][file].image(for: .normal)!) {
                // break out of the loop.
                break
            // Else if a different colored piece is on this button...
            } else if enemyPieces.contains(buttonArray[k][file].image(for: .normal)!) {
                // enable the current button then break out of the loop.
                buttonArray[k][file].isEnabled = true
                buttonArray[k][file].backgroundColor = buttonArray[k][file].backgroundColor?.withAlphaComponent(1)
                break
            // Else if there is no piece on this button...
            } else {
                // enable the button and move to the next button on the next file.
                buttonArray[k][file].isEnabled = true
                buttonArray[k][file].backgroundColor = buttonArray[k][file].backgroundColor?.withAlphaComponent(1)
                k += 1
            }
        }
        // Initialize j to the file of the next button adjacent to the rook.
        var j = file - 1
        // While j is in the bounds of the board...
        while (j >= 0) {
            // if a same colored piece is on this button...
            if samePieces.contains(buttonArray[rank][j].image(for: .normal)!) {
                // break out of the loop.
                break
            // Else if a different colored piece is on this button...
            } else if enemyPieces.contains(buttonArray[rank][j].image(for: .normal)!) {
                // enable the current button then break out of the loop.
                buttonArray[rank][j].isEnabled = true
                buttonArray[rank][j].backgroundColor = buttonArray[rank][j].backgroundColor?.withAlphaComponent(1)
                break
            // Else if there is no piece on this button...
            } else {
                // enable the button and move to the next button on the next rank.
                buttonArray[rank][j].isEnabled = true
                buttonArray[rank][j].backgroundColor = buttonArray[rank][j].backgroundColor?.withAlphaComponent(1)
                j -= 1
            }
        }
        // Initialize l to the file of the next button adjacent to the rook.
        var l = file + 1
        // While l is in the bounds of the board...
        while (l < buttonArray[rank].count) {
            // if a same colored piece is on this button...
            if samePieces.contains(buttonArray[rank][l].image(for: .normal)!) {
                // break out of the loop.
                break
            // Else if a different colored piece is on this button...
            } else if enemyPieces.contains(buttonArray[rank][l].image(for: .normal)!) {
                // enable the current button then break out of the loop.
                buttonArray[rank][l].isEnabled = true
                buttonArray[rank][l].backgroundColor = buttonArray[rank][l].backgroundColor?.withAlphaComponent(1)
                break
            // Else if there is no piece on this button...
            } else {
                // enable the button and move to the next button on the next rank.
                buttonArray[rank][l].isEnabled = true
                buttonArray[rank][l].backgroundColor = buttonArray[rank][l].backgroundColor?.withAlphaComponent(1)
                l += 1
            }
        }
    }
    
    // Enable the moves of the knight.
    func knightMoves(rank: Int, file: Int, imagesToDisable: [UIImage]) {
        // If a button two squares in one direction and one square in another direction is in bounds and is not occupied by a same colored piece...
        if rank + 2 < buttonArray.count && file + 1 < buttonArray[rank].count && !imagesToDisable.contains(buttonArray[rank + 2][file + 1].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank + 2][file + 1].isEnabled = true
            buttonArray[rank + 2][file + 1].backgroundColor = buttonArray[rank + 2][file + 1].backgroundColor?.withAlphaComponent(1)
        }
        // If the next button two squares in one direction and one square in another direction is in bounds and is not occupied by a same colored piece...
        if rank - 2 >= 0 && file - 1 >= 0 && !imagesToDisable.contains(buttonArray[rank - 2][file - 1].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank - 2][file - 1].isEnabled = true
            buttonArray[rank - 2][file - 1].backgroundColor = buttonArray[rank - 2][file - 1].backgroundColor?.withAlphaComponent(1)
        }
        // If the next button two squares in one direction and one square in another direction is in bounds and is not occupied by a same colored piece...
        if rank + 2 < buttonArray.count && file - 1 >= 0 && !imagesToDisable.contains(buttonArray[rank + 2][file - 1].image(for: .normal)!){
            // enable the button.
            buttonArray[rank + 2][file - 1].isEnabled = true
            buttonArray[rank + 2][file - 1].backgroundColor = buttonArray[rank + 2][file - 1].backgroundColor?.withAlphaComponent(1)
        }
        // If the next button two squares in one direction and one square in another direction is in bounds and is not occupied by a same colored piece...
        if rank - 2 >= 0 && file + 1 < buttonArray[rank].count && !imagesToDisable.contains(buttonArray[rank - 2][file + 1].image(for: .normal)!){
            // enable the button.
            buttonArray[rank - 2][file + 1].isEnabled = true
            buttonArray[rank - 2][file + 1].backgroundColor = buttonArray[rank - 2][file + 1].backgroundColor?.withAlphaComponent(1)
        }
        // If the next button two squares in one direction and one square in another direction is in bounds and is not occupied by a same colored piece...
        if rank + 1 < buttonArray.count && file + 2 < buttonArray[rank].count && !imagesToDisable.contains(buttonArray[rank + 1][file + 2].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank + 1][file + 2].isEnabled = true
            buttonArray[rank + 1][file + 2].backgroundColor = buttonArray[rank + 1][file + 2].backgroundColor?.withAlphaComponent(1)
        }
        // If the next button two squares in one direction and one square in another direction is in bounds and is not occupied by a same colored piece...
        if rank - 1 >= 0 && file - 2 >= 0 && !imagesToDisable.contains(buttonArray[rank - 1][file - 2].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank - 1][file - 2].isEnabled = true
            buttonArray[rank - 1][file - 2].backgroundColor = buttonArray[rank - 1][file - 2].backgroundColor?.withAlphaComponent(1)
        }
        // If the next button two squares in one direction and one square in another direction is in bounds and is not occupied by a same colored piece...
        if rank + 1 < buttonArray.count && file - 2 >= 0 && !imagesToDisable.contains(buttonArray[rank + 1][file - 2].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank + 1][file - 2].isEnabled = true
            buttonArray[rank + 1][file - 2].backgroundColor = buttonArray[rank + 1][file - 2].backgroundColor?.withAlphaComponent(1)
        }
        // If the next button two squares in one direction and one square in another direction is in bounds and is not occupied by a same colored piece...
        if rank - 1 >= 0 && file + 2 < buttonArray[rank].count && !imagesToDisable.contains(buttonArray[rank - 1][file + 2].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank - 1][file + 2].isEnabled = true
            buttonArray[rank - 1][file + 2].backgroundColor = buttonArray[rank - 1][file + 2].backgroundColor?.withAlphaComponent(1)
        }
    }
    
    // Enable the moves of the pawn.
    func pawnMoves(rank: Int, file: Int, enemyPieces: [UIImage], d: Int) {
        // If the button ahead of the pawn is in bounds and it is not occupied by a piece...
        if rank - d * (whitePawnDirection) < buttonArray.count && rank - d * (whitePawnDirection) >= 0 && !piecesArray.contains(buttonArray[rank - d * (whitePawnDirection)][file].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank - d * (whitePawnDirection)][file].isEnabled = true
            buttonArray[rank - d * (whitePawnDirection)][file].backgroundColor = buttonArray[rank - d * (whitePawnDirection)][file].backgroundColor?.withAlphaComponent(1)
        }
        // If the button ahead of the pawn and one square to the side is in bounds and it is not occupied by a piece...
        if rank - d * (whitePawnDirection) >= 0 && file - 1 >= 0 && enemyPieces.contains(buttonArray[rank - d * (whitePawnDirection)][file - 1].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank - d * (whitePawnDirection)][file - 1].isEnabled = true
            buttonArray[rank - d * (whitePawnDirection)][file - 1].backgroundColor = buttonArray[rank - d * (whitePawnDirection)][file - 1].backgroundColor?.withAlphaComponent(1)
        }
        // If the button ahead of the pawn and the other square to the side is in bounds and it is not occupied by a piece...
        if rank - d * (whitePawnDirection) >= 0  && rank < 6 && file + 1 < buttonArray[rank].count && enemyPieces.contains(buttonArray[rank - d * (whitePawnDirection)][file + 1].image(for: .normal)!) {
            // enable the button.
            buttonArray[rank - d * (whitePawnDirection)][file + 1].isEnabled = true
            buttonArray[rank - d * (whitePawnDirection)][file + 1].backgroundColor = buttonArray[rank - d * (whitePawnDirection)][file + 1].backgroundColor?.withAlphaComponent(1)
            
        }
        
    }
    
    // Enable the attacks of the black pieces.
    func enableBlackAttacks() {
        // For every button in the board.
        for i in 0..<buttonArray.count {
            for j in 0..<buttonArray[i].count {
                // If there is a black knight on the current button...
                if buttonArray[i][j].image(for: .normal) == UIImage(named: "N")! {
                    // enable the moves of the kight with no images to disable.
                    knightMoves(rank: i, file: j, imagesToDisable: [])
                    
                // Else if there is a black bishop on the current button...
                } else if buttonArray[i][j].image(for: .normal) == UIImage(named: "B")! {
                    // enable the moves of the kight with all buttons but the black bishop being declared enemy pieces.
                    bishopMoves(rank: i, file: j, samePieces: [], enemyPieces: [UIImage(named: "R")!, UIImage(named: "Q")!, UIImage(named: "N")!, UIImage(named: "P")!, UIImage(named: "K")!, UIImage(named: "R1")!, UIImage(named: "B1")!, UIImage(named: "Q1")!, UIImage(named: "N1")!, UIImage(named: "P1")!])
                    
                // Else if there is a black rook on the current button...
                } else if buttonArray[i][j].image(for: .normal) == UIImage(named: "R")! {
                    // enable the moves of the rook with all buttons but the black rook being declared enemy pieces.
                    rookMoves(rank: i, file: j, samePieces: [], enemyPieces: [UIImage(named: "Q")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!, UIImage(named: "K")!, UIImage(named: "R1")!, UIImage(named: "B1")!, UIImage(named: "Q1")!, UIImage(named: "N1")!, UIImage(named: "P1")!])
                    
                // Else if there is a black queen on the current button...
                } else if buttonArray[i][j].image(for: .normal) == UIImage(named: "Q")! {
                    // enable the moves of the queen with all buttons but the black queen being declared enemy pieces.
                    bishopMoves(rank: i, file: j, samePieces: [], enemyPieces: [UIImage(named: "R")!, UIImage(named: "Q1")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!, UIImage(named: "K")!, UIImage(named: "R1")!, UIImage(named: "B1")!, UIImage(named: "N1")!, UIImage(named: "P1")!])
                    rookMoves(rank: i, file: j, samePieces: [], enemyPieces: [UIImage(named: "R")!, UIImage(named: "Q1")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!, UIImage(named: "K")!, UIImage(named: "R1")!, UIImage(named: "B1")!, UIImage(named: "N1")!, UIImage(named: "P1")!])
                    
                // Else if there is a black queen on the current button...
                } else if buttonArray[i][j].image(for: .normal) == UIImage(named: "K")! {
                    // enable the moves of the king with no images to disable.
                    kingMoves(rank: i, file: j, imagesToDisable: [])
                    
                // Else if there is a black pawn on the current button...
                } else if buttonArray[i][j].image(for: .normal) == UIImage(named: "P")! {
                    // if it will be in bounds...
                    if j + 1 < 5 && i > 0 && i < 6 {
                        // enable the attack to one side of the pawn.
                        buttonArray[i - whitePawnDirection][j + 1].isEnabled = true
                        buttonArray[i - whitePawnDirection][j + 1].backgroundColor = buttonArray[i - whitePawnDirection][j + 1].backgroundColor?.withAlphaComponent(1)
                }
                    // if it will be in bounds...
                    if j - 1 >= 0 && i > 0 && i < 6 {
                        // enable the attack to the other side of the pawn.
                        buttonArray[i - whitePawnDirection][j - 1].isEnabled = true
                        buttonArray[i - whitePawnDirection][j - 1].backgroundColor = buttonArray[i - whitePawnDirection][j - 1].backgroundColor?.withAlphaComponent(1)
                }
                   
                // Else if there is a black king on the current button...
                } else if buttonArray[i][j].image(for: .normal) == UIImage(named: "K1")! {
                        // save the location of the enemy king.
                        enemyKing = [i, j]
      
                }
            }
        }
    }
    
    // Enable the attacks of the white pieces.
    func enableWhiteAttacks() {
        // For every button in the board.
        for i in 0..<buttonArray.count {
            for j in 0..<buttonArray[i].count {
                // If there is a white knight on the current button...
                if buttonArray[i][j].image(for: .normal) == UIImage(named: "N1")! {
                    // enable the moves of the kight with no images to disable.
                    knightMoves(rank: i, file: j, imagesToDisable: [])
                 
                // Else if there is a white bishop on the current button...
                } else if buttonArray[i][j].image(for: .normal) == UIImage(named: "B1")! {
                    // enable the moves of the bishop with all buttons but the white bishop being declared enemy pieces.
                    bishopMoves(rank: i, file: j, samePieces: [], enemyPieces: [UIImage(named: "R")!, UIImage(named: "Q")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!, UIImage(named: "R1")!, UIImage(named: "Q1")!, UIImage(named: "N1")!, UIImage(named: "P1")!, UIImage(named: "K1")!])
                    
                // Else if there is a white rook on the current button...
                } else if buttonArray[i][j].image(for: .normal) == UIImage(named: "R1")! {
                    // enable the moves of the rook with all buttons but the white rook being declared enemy pieces.
                    rookMoves(rank: i, file: j, samePieces: [], enemyPieces: [UIImage(named: "R")!, UIImage(named: "Q")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!, UIImage(named: "B1")!, UIImage(named: "Q1")!, UIImage(named: "N1")!, UIImage(named: "P1")!, UIImage(named: "K1")!])
                    
                // Else if there is a white queen on the current button...
                } else if buttonArray[i][j].image(for: .normal) == UIImage(named: "Q1")! {
                    // enable the moves of the queen with all buttons but the white queen being declared enemy pieces.
                    bishopMoves(rank: i, file: j, samePieces: [], enemyPieces: [UIImage(named: "R")!, UIImage(named: "Q")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!, UIImage(named: "R1")!, UIImage(named: "B1")!, UIImage(named: "N1")!, UIImage(named: "P1")!, UIImage(named: "K1")!])
                    rookMoves(rank: i, file: j, samePieces: [], enemyPieces: [UIImage(named: "R")!, UIImage(named: "Q")!, UIImage(named: "B")!, UIImage(named: "N")!, UIImage(named: "P")!, UIImage(named: "R1")!, UIImage(named: "B1")!, UIImage(named: "N1")!, UIImage(named: "P1")!, UIImage(named: "K1")!])
                    
                // Else if there is a white king on the current button...
                } else if buttonArray[i][j].image(for: .normal) == UIImage(named: "K1")! {
                    // enable the moves of the king with no images to disable.
                      kingMoves(rank: i, file: j, imagesToDisable: [])
                
                // Else if there is a white pawn on the current button...
                } else if buttonArray[i][j].image(for: .normal) == UIImage(named: "P1")! {
                    // if it will be in bounds...
                    if j + 1 < 5 && i > 0 && i < 6 {
                        // enable the attack to one side of the pawn.
                        buttonArray[i + whitePawnDirection][j + 1].isEnabled = true
                        buttonArray[i + whitePawnDirection][j + 1].backgroundColor = buttonArray[i + whitePawnDirection][j + 1].backgroundColor?.withAlphaComponent(1)
                    }
                    // if it will be in bounds...
                    if j - 1 >= 0 && i > 0 && i < 6 {
                        // enable the attack to the other side of the pawn.
                        buttonArray[i + whitePawnDirection][j - 1].isEnabled = true
                        buttonArray[i + whitePawnDirection][j - 1].backgroundColor = buttonArray[i + whitePawnDirection][j - 1].backgroundColor?.withAlphaComponent(1)
                    }
                // Else if there is a black king on the current button...
                } else if buttonArray[i][j].image(for: .normal) == UIImage(named: "K")! {
                    // save the location of the enemy king.
                        enemyKing = [i, j]
           
                  }
                    
                }
            }
    }
    
    // Disable enabled square sthat put or leave the king in check.
    func blockFinder(king: UIImage, piece: UIImage, B: UIButton, method: () -> Void) {
        
        // Create an empty array of UIButtons called moves.
        var moves = [UIButton]()
        
        // For each button on the board...
        for i in 0..<buttonArray.count {
            for j  in 0..<buttonArray[i].count {
                // if the button is enabled...
                if buttonArray[i][j].isEnabled {
                    // add it to moves.
                    moves.append(buttonArray[i][j])
                }
            }
        }
        
        // Disable all buttons and create an empty array of UIButtons called blocks...
        disableAll()
        var blocks = [UIButton]()
        // for each button in moves...
         for move in 0..<moves.count {
             // Store the image of the button in a temporary variable and move the image from the pressed button B to the current button.
             let temp: UIImage? = moves[move].image(for: .normal)
             moves[move].setImage(piece, for: .normal)
             B.setImage(UIImage(), for: .normal)
             // Enable white or black attacks, depending on how the method is called.
             method()
             // If the king is disabled...
             if !buttonArray[enemyKing![0]][enemyKing![1]].isEnabled {
                // add the current move to blocks.
                blocks.append(moves[move])
            }
             // DisableAll and restore the origional image alues of the current button and b .
             disableAll()
             moves[move].setImage(temp, for: .normal)
             B.setImage(piece, for: .normal)
        }
        // Enable every button in blocks.
        for block in 0..<blocks.count {
            blocks[block].isEnabled = true
            blocks[block].backgroundColor = blocks[block].backgroundColor?.withAlphaComponent(1)
        }
    }

    // Find the 2D location of a button given itself.
    func findIndex(B: UIButton) -> (row: Int, column: Int) {
        for (rowIndex, row) in buttonArray.enumerated() {
            for (columnIndex, buttonInArray) in row.enumerated() {
                if buttonInArray == B {
                    return (row: rowIndex, column: columnIndex)
                }
            }
        }
        return (0, 0)
    }
    
    // Find the button which holds an image given the image.
    func findPiece(B: UIImage) -> (UIButton?) {
        for i in 0..<buttonArray.count {
            for j in 0..<buttonArray[i].count {
                if buttonArray[i][j].image(for: .normal) == B {
                    return buttonArray[i][j]
                }
            }
        }
        return nil
        
    }
    // Return the amount of enabled squares on the board.
    func enableCount() -> Int {
        var count = 0
        for i in 0 ..< buttonArray.count {
            for j in 0 ..< buttonArray[i].count {
                if buttonArray[i][j].isEnabled == true {
                    count += 1
                }
            }
        }
        return count
    }
    
    // Flip the board.
    func flip() {
        // If we are not midturn...
        if !midturn {
            // Swap the pawns movement direction.
            whitePawnDirection *= -1
            // For the first half of every button in the board...
            for i in 0 ..< buttonArray.count/2 {
                for j in 0 ..< buttonArray[i].count {
                    // set the image of the first button to the image of the button at 6 - its rank and the same file.
                    let temp = buttonArray[i][j].image(for: .normal)
                    buttonArray[i][j].setImage(buttonArray[6 - i][j].image(for: .normal), for: .normal)
                    buttonArray[6 - i][j].setImage(temp, for: .normal)
                }
            }
            // Set up the board for the next turn.
            enableAll()
            disableEmpty()
            if whiteMove {
                disableBlack()
            } else {
                disableWhite()
            }
        }
    }
}
