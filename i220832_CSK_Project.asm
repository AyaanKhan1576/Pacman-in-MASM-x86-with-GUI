INCLUDE Irvine32.inc
includelib Winmm.lib

.data

ground BYTE "------------------------------------------------------------------------------------------------------------------------",0
ground1 BYTE "|",0ah,0
ground2 BYTE "|",0

temp byte ?

strScore BYTE "Your score is: ",0
score BYTE 0
score2 BYTE 0
score3 DWORD 0

strLives BYTE "Lives: ", 0
lives BYTE 3

strLevel BYTE "Level: ", 0
level BYTE 1

xPos BYTE 20
yPos BYTE 20

Enemy1_xPos BYTE 10
Enemy1_yPos BYTE 6
Enemy2_xPos BYTE 50
Enemy2_yPos BYTE 10
Enemy3_xPos BYTE 20
Enemy3_yPos BYTE 10
Enemy4_xPos BYTE 51
Enemy4_yPos BYTE 10
Enemy5_xPos BYTE 50
Enemy5_yPos BYTE 25

xCoinPos BYTE ?
yCoinPos BYTE ?

inputChar BYTE ?

start_screen BYTE "PACMAN GAME", 0
start_screen2 BYTE "Enter Your Name", 0
start_screen3 BYTE "Press any key to start", 0
nameInput BYTE 255 DUP(?)

menu_screen BYTE "1. Start Game", 0
menu_screen2 BYTE "2. Exit Game", 0
menu_screen3 BYTE "3. Instructions ", 0
menu_screen4 BYTE "Enter your choice: ", 0

insruction BYTE "Instructions", 0
instruction2 BYTE "W - Move up", 0
instruction3 BYTE "S - Move down", 0
instruction4 BYTE "A - Move left", 0
instruction5 BYTE "D - Move right", 0
instruction6 BYTE "P - Pause", 0
instruction7 BYTE "X - Exit Game", 0

wall DB '|', 0    
wallHorizontal BYTE "-----", 0
wallVertical DB '|', 0 

xWall DWORD 90 DUP(?)
yWall DWORD 90 DUP(?)

    map_row EQU 29
    map_col EQU 53

   map1 BYTE "+---------------------------------------------------+"
        BYTE "| . . . . . . . . . . . . . . . . . . . . . . . . . |"
        BYTE "| . . . . . . . . . . . . . . . | . . . . . . . . . |"
        BYTE "|-----------| . . . . . . . . . | . . . . . . . . . |"
        BYTE "| . . . . . . . . . . . . . . . | . . . . . . . . . |"
        BYTE "| . . . . . . . . . . . . . . . | . . . . . . . . . |"
        BYTE "|                                                   |"
        BYTE "|------------------|. . . . . . . . . . . . . . . . |"
        BYTE "|------------------|. . . . . .|--------------------|"
        BYTE "| . . . . . . . . . . . . . . . . . . . . . . . . . |"
        BYTE "| . . . . . . |--------------------|. . . . . . . . |"
        BYTE "| . . . . . . | . . . . | . . . . . . . . . . . . . |"
        BYTE "| . . . . . . | . . . . | . . . . . . . . . . . . . |"
        BYTE "| . . . . . . | . . . . | . . .|--------------------|"
        BYTE "| . . . . . . | . . . . | . . .|--------------------|"
        BYTE "| . . . . . . . . . . . | . . . . . . . . . . . | . |"
        BYTE "| . . . . . . . . . . . | . . . . . . . . . . . | . |"
        BYTE "| . . . . . . | . . . . . . . . . . . . . . . . | . |"
        BYTE "| . . . . . . | . . . . . . . . . . . . . . . . | . |"
        BYTE "| . . . . . . | . . . . . . --------|-------. . | . |"
        BYTE "| . . . . . . | . . . . . . . . . . | . . . . . . . |"
        BYTE "|----------------|. . . . . . . . . | . . . . . . . |"
        BYTE "| . . . . . . | . . . . . . . . . . | . . . . . . . |"
        BYTE "| . . . . . . | . . . . . . . . . . | . . . . . . . |"
        BYTE "| . . . . . . | . . . . . . . . . . . . . . . . . . |"
        BYTE "| . . . . . . | . . . . . . . . . . . . . . . . . . |"
        BYTE "| . . . . . . | . . . . . . . . |-------------------|"
        BYTE "| . . . . . . . . . . . . . . . . . . . . . . . . . |"
        BYTE "+---------------------------------------------------+", 0 
        ;22i-0832 : 5+8+3+2 = 18 walls

   map2 BYTE "+---------------------------------------------------+"
        BYTE "| . . . . . . . . . . . . . . . . . . . . . . . . . |"
        BYTE "| . . . . . . . . . . . . . . . . . . . . . . . . . |"
        BYTE "|                                                   |"
        BYTE "| . . . . . . . . . . . . . . . . . . . . . . . . . |"
        BYTE "| . . . . . . . . . . . . . . . . . . . . . . . . . |"        
        BYTE "| . . . |___ \  |___ \ (_). . . . . . . . . . . . . |"  
        BYTE "| . . .  __) |   __) | | |. . . . . . . . . . . . . |"
        BYTE "| . . . / __/   / __/  | |. . . . . . . . . . . . . |"
        BYTE "| . . .|_____| |_____| |_|. . . . . . . . . . . . . |"
        BYTE "|                                                   |"
        BYTE "|   . .  ___     ___    _____   ____  . . . . . .   |"
        BYTE "|   . . / _ \   ( _ )  |___ /  |___ \ . . . . . .   |"
        BYTE "|   . .| | | |  / _ \    |_ \    __) |. . . . . .   |"
        BYTE "|   . .| |_| | | (_) |  ___) |  / __/ . . . . . .   |"
        BYTE "|   . . \___/   \___/  |____/  |_____|. . . . . .   |"
        BYTE "|                                                   |"
        BYTE "| . . . .  _  . . . . . . . . . . . . . . . . . . . |"
        BYTE "| . . . . / \     _   _    ____    ____   ____  . . |"
        BYTE "| . . .  / _ \   | | | |  / _  |  / _  | |  _ \ . . |"
        BYTE "| . . . / ___ \  | |_| |@| (_| | | (_| | | | | |. . |"
        BYTE "| . . ./_/   \_\  \___ |  \____|  \____| |_| |_|. . |"
        BYTE "| . . . . . . . . |___/ . . . . . . . . . . . . . . |"
        BYTE "| . . . _  __  _  . . . . . . . . . . . . . . . . . |"
        BYTE "| . . .| |/ / | |__     ____   ____ . . . . . . . . |"
        BYTE "| . . .|   /  |  _ \   / _  | |  _ \  . . . . . . . |"
        BYTE "| . . .|   \  | | | | | (_| | | | | | . . . . . . . |"
        BYTE "| . . .|_|\_\ |_| |_|  \____| |_| |_| . . . . . . . |"
        BYTE "+---------------------------------------------------+", 0 

   map3 BYTE "+---------------------------------------------------+"
        BYTE "|   . . . . . . . . . . . . . . .  . . .   . . . . .|"
        BYTE "| . +-----------------+ . | . +-----------------+ . |"
        BYTE "| . |                 | . | . |                 { . |"
        BYTE "| . +-----------------+ . | . +-----------------+ . |"
        BYTE "| . . . . . . . . . . . . . . . .  . . .   . . . . .|"
        BYTE "| . ------------------- . | .  -------+   +------ . |"
        BYTE "|   . . . . . . . . . . . . . . . . . |   | . . . . |"
        BYTE "+----------+ . +----+ . | . +---------+   +----------"
        BYTE "           | . |    |   | . | . . . . .   . . . . . |"
        BYTE "~----------+ . +----+   | . | . +-----------------+ |"
        BYTE "| . . . . . . . .   . . . . | H |     PACMAN      | |"
        BYTE "~----------+ . +----+   | . | . +-----------------+ |"
        BYTE "           | . |    |   | @ | . . . . .   . . . . . |"
        BYTE "+----------+ . +----+ . | . +---------+   +---------+"
        BYTE "|   . . . . . . .   . . . . . . . . . |   | . . . . |"
        BYTE "| . ------------------- . | .  -------+   +------ . |"
        BYTE "| . . . . . . . . . . . . . . . . . . .   . . . . . |"
        BYTE "| . +-----------------+ . | . +-----------------+ . |"
        BYTE "| . }                 | . | . |                 | . |"
        BYTE "| . +-----------------+ . | . +-----------------+ . |"
        BYTE "|   . . . . . . . . . . . . . . . . . . . . . . . . |"
        BYTE "| . . . . . . . . . . . . . . . . . . . . . . . . . |"
        BYTE "| . . . . . . . . . . . . . . . . . . . . . . . . . |"
        BYTE "| . . . . . . . . . . . . . . . . . . . . . . . . . |"
        BYTE "| . . . . . . . . . . . . . . . . . . . . . . . . . |"
        BYTE "| . . . . . . . . . . . . . . . . . . . . . . . . . |"
        BYTE "| . . . . . . . . . . . . . . . . . . . . . . . . . |"
        BYTE "+---------------------------------------------------+", 0 



        visitedPositions BYTE 1537 DUP(0)
        col BYTE 26
        row BYTE 13

        enemy1_direction BYTE 1
        enemy2_direction BYTE 1
        enemy3_direction BYTE 1
        enemy4_direction BYTE 1
        enemy5_direction BYTE 1

        fruit_count BYTE 1
        powerFlag BYTE 0
        revolutionCount BYTE 0

        powerStr BYTE "Power Up: On", 0
        powerStr2 BYTE "Power Up: Off", 0

        strGameOver BYTE "Game Over", 0

        fileName BYTE "game_data.txt", 0

        
        BUFFER_SIZE = 255   
        buffer BYTE BUFFER_SIZE DUP(?)

        gameDataFileName BYTE "game_data.txt", 0
        gameDataBuffer BYTE 500 DUP(?)
        scoreArray DWORD 1000 DUP(?) 
        entryCount DWORD ?
        

        play_music db 'music.wav',0  

        PlaySound PROTO,
        pszSound:PTR BYTE,
        hmod:DWORD,
        fdwSound:DWORD
        
.code

startScreen PROC

    mov edx,OFFSET start_screen
	call WriteString
    call crlf

	mov edx,OFFSET start_screen2
	call WriteString
    call crlf

    mov edx, OFFSET nameInput  ; Load the address of nameInput
    mov ecx, 255
    call ReadString
    call Crlf

    call waitmsg

ret
startScreen ENDP


instructions PROC

    call clrscr
    mov edx,OFFSET insruction
    call WriteString
    call Crlf

	mov edx,OFFSET instruction2
    call WriteString
    call Crlf

	mov edx,OFFSET instruction3
    call WriteString
    call Crlf

	mov edx,OFFSET instruction4
    call WriteString
    call Crlf

	mov edx,OFFSET instruction5
    call WriteString
    call Crlf

	mov edx,OFFSET instruction6
    call WriteString
    call Crlf

	mov edx,OFFSET instruction7
    call WriteString
    call Crlf

	call waitmsg
    call clrscr

ret
instructions ENDP

menu PROC

    mov edx,OFFSET menu_screen
    call WriteString
	call Crlf

    mov edx,OFFSET menu_screen2
	call WriteString
	call Crlf

    mov edx,OFFSET menu_screen3
	call WriteString
	call Crlf

    mov edx,OFFSET menu_screen4
	call WriteString
	call Crlf

    call readInt
    cmp eax,1
	je startgame

    cmp eax, 2
    je exitGame

    cmp eax, 3
    je instruct

    ;cmp eax, 4
    ;jge highscores

    instruct:
        call instructions
        jmp menu

   ; highscores:
        ;call ReadAndSortScores
        ;jmp menu


    exitGame:
        exit

    startgame:


ret
menu ENDP

DrawWalls PROC

    mov eax, blue           ; Set wall color
    call SetTextColor

        mov esi, offset xWall
		mov edi, offset yWall

        mov dl, 10
        mov dh, 10
        call Gotoxy
        mov edx, OFFSET wallHorizontal
        call WriteString

        mov dl, 10
        mov dh, 10
        mov ecx, 5
        loop1:
            mov [esi], dl
			mov [edi], dh
            inc dl
            add esi, 4
            add edi, 4
            loop loop1
        
        mov dl, 10
        mov dh, 20
        call Gotoxy
        mov edx, OFFSET wallHorizontal
        call WriteString

        mov dl, 10
        mov dh, 20
        mov ecx, 5
        loop2:
            mov [esi], dl
			mov [edi], dh
            inc dl
            add esi, 4
            add edi, 4
            loop loop2

        mov dl, 40
        mov dh, 20
        call Gotoxy
        mov edx, OFFSET wallHorizontal
        call WriteString

        mov dl, 40
        mov dh, 20
        mov ecx, 5
        loop3:
            mov [esi], dl
			mov [edi], dh
            inc dl
            add esi, 4
            add edi, 4
            loop loop3


        mov dl, 40
        mov dh, 4
        call Gotoxy
        mov edx, OFFSET wallHorizontal
        call WriteString

        mov dl, 40
        mov dh, 4
        mov ecx, 5
        loop4:
            mov [esi], dl
			mov [edi], dh
            inc dl
            add esi, 4
            add edi, 4
            loop loop4

        mov dl, 70
        mov dh, 15
        call Gotoxy
        mov edx, OFFSET wallHorizontal
        call WriteString

        mov dl, 70
        mov dh, 15
        mov ecx, 5
        loop5:
            mov [esi], dl
			mov [edi], dh
            inc dl
            add esi, 4
            add edi, 4
            loop loop5

        mov dl, 70
        mov dh, 7
        call Gotoxy
        mov edx, OFFSET wallHorizontal
        call WriteString

        mov dl, 70
        mov dh, 7
        mov ecx, 5
        loop6:
            mov [esi], dl
			mov [edi], dh
            inc dl
            add esi, 4
            add edi, 4
            loop loop6

        mov dl, 90
        mov dh, 10
        call Gotoxy
        mov edx, OFFSET wallHorizontal
        call WriteString

        mov dl, 90
        mov dh, 10
        mov ecx, 5
        loop7:
            mov [esi], dl
			mov [edi], dh
            inc dl
            add esi, 4
            add edi, 4
            loop loop7

        mov dl, 90
        mov dh, 20
        call Gotoxy
        mov edx, OFFSET wallHorizontal
        call WriteString

        mov dl, 90
        mov dh, 20
        mov ecx, 5
        loop8:
            mov [esi], dl
			mov [edi], dh
            inc dl
            add esi, 4
            add edi, 4
            loop loop8

        mov dl, 50
        mov dh, 15
        call Gotoxy
        mov edx, OFFSET wallHorizontal
        call WriteString

        mov dl, 50
        mov dh, 15
        mov ecx, 5
        loop9:
            mov [esi], dl
			mov [edi], dh
            inc dl
            add esi, 4
            add edi, 4
            loop loop9

        mov dl, 30
        mov dh, 15
        call Gotoxy
        mov edx, OFFSET wallHorizontal
        call WriteString

        mov dl, 30
        mov dh, 15
        mov ecx, 5
        loop10:
            mov [esi], dl
			mov [edi], dh
            inc dl
            add esi, 4
            add edi, 4
            loop loop10

        mov ecx, 5
        mov dh,10
        mov temp,dh
        a2:
        mov dh,temp
        mov dl,10
        mov [esi], dl
        mov [edi], dh
            add esi, 4
            add edi, 4
        call Gotoxy
        mov edx,OFFSET ground2
        call WriteString
        inc temp
        loop a2

        mov ecx, 5
        mov dh,20
        mov temp,dh
        b2:
        mov dh,temp
        mov dl,10
        mov [esi], dl
        mov [edi], dh
            add esi, 4
            add edi, 4
        call Gotoxy
        mov edx,OFFSET ground2
        call WriteString
        inc temp
        loop b2

        mov ecx, 5
        mov dh,20
        mov temp,dh
        c2:
        mov dh,temp
        mov dl,40
        mov [esi], dl
        mov [edi], dh
            add esi, 4
            add edi, 4
        call Gotoxy
        mov edx,OFFSET ground2
        call WriteString
        inc temp
        loop c2

        mov ecx, 5
        mov dh,4
        mov temp,dh
        d2:
        mov dh,temp
        mov dl,40
        mov [esi], dl
        mov [edi], dh
            add esi, 4
            add edi, 4
        call Gotoxy
        mov edx,OFFSET ground2
        call WriteString
        inc temp
        loop d2

        mov ecx, 5
        mov dh,15
        mov temp,dh
        e2:
        mov dh,temp
        mov dl,70
        mov [esi], dl
        mov [edi], dh
            add esi, 4
            add edi, 4
        call Gotoxy
        mov edx,OFFSET ground2
        call WriteString
        inc temp
        loop e2

        mov ecx, 5
        mov dh,7
        mov temp,dh
        f2:
        mov dh,temp
        mov dl,70
        mov [esi], dl
        mov [edi], dh
            add esi, 4
            add edi, 4
        call Gotoxy
        mov edx,OFFSET ground2
        call WriteString
        inc temp
        loop f2

        mov ecx, 5
        mov dh,10
        mov temp,dh
        g2:
        mov dh,temp
        mov dl,55
        mov [esi], dl
        mov [edi], dh
            add esi, 4
            add edi, 4
        call Gotoxy
        mov edx,OFFSET ground2
        call WriteString
        inc temp
        loop g2

        mov ecx, 5
        mov dh,15
        mov temp,dh
        h2:
        mov dh,temp
        mov dl,30
        mov [esi], dl
        mov [edi], dh
            add esi, 4
            add edi, 4
        call Gotoxy
        mov edx,OFFSET ground2
        call WriteString
        inc temp
        loop h2

    ret
DrawWalls ENDP



main PROC

	call startScreen
    INVOKE PlaySound, OFFSET play_music, NULL,11
    call Clrscr

    call menu
    call Clrscr

    

    gameStart:


    mov cl, level
    cmp cl, 1
    je level1
    cmp cl, 2
    je level2
    cmp cl, 3
    je level3

    level3:
    call clrscr
    mov eax, score3
    mov ecx, 0
    mov cl, 0
    mov cl, score
    add eax, ecx
    mov ecx, 0
    mov cl, score2
    add score3, ecx
    mov score, 0
    mov cl, 3
    mov lives, cl
    mov xPos, 2
    mov yPos, 2
    call setMap
    call DrawPlayer
    mov revolutionCount, 1
    mov powerFlag, 0
    mov fruit_count, 1
    mov Enemy1_yPos, 5
    call Enemy1_draw
    call Enemy3_draw
    call Enemy4_draw
    call Enemy5_draw
    call setCoin
    call DrawCoin
    jmp gameloop

    level2:
    call clrscr
    mov cl, 0
    mov cl, score
    add score2, cl
    mov score, 0
    mov cl, 3
    mov lives, cl
    mov Enemy1_yPos, 3
    mov xPos, 2
    mov yPos, 2
    call setMap
    call DrawPlayer
    call Enemy1_draw
    call Enemy2_draw
    mov fruit_count, 1
    call setCoin
    call DrawCoin
    jmp gameLoop
    

    level1:
    call setMap
    call DrawPlayer
    call Enemy1_draw
    

    call Randomize
    
    gameLoop:

        mov cl, score
        cmp score, 200
        ja inc_level
        jmp game
            
        inc_level:
            inc level
            cmp level, 2
            je level2
            cmp level, 3
            je level3
            dec level
            jmp exitGame

        game:
        mov cl, lives
        cmp cl, 0
        jle exitGame
       
        ;mov cl, level
        ;cmp cl, 2
        ;jne continue5


        ;continue5:

        pushad
        mov DX,0
        mov dl,yPos
        mov dh,xPos
        call fruitCollision
        popad

        mov eax,white (black * 16)
        call SetTextColor

        ; draw score:
        mov dl,60
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteInt

        mov dl, 60
        mov dh, 1
        call Gotoxy
        mov edx, offset strLives
        call writeString
        mov al, lives
        call WriteInt

        mov dl, 60
        mov dh, 2
        call Gotoxy
        mov edx, offset strLevel
        call writeString
        mov al, level
        call WriteInt

        cmp powerFlag, 1
        jne onGround
        mov dl, 60
        mov dh, 3
        call Gotoxy
        mov edx, offset powerStr
        call writeString
        
        cmp revolutionCount, 5
        jne onGround
        mov powerFlag, 0
        mov dl, 60
        mov dh, 3
        call Gotoxy
        mov edx, offset powerStr2
        call writeString

        ; gravity logic:
        ;gravity:
        ;cmp yPos,27
        ;jg onGround
        ; make player fall:
        ;call UpdatePlayer
        ;inc yPos
        ;call DrawPlayer
        ;mov eax,80
        ;call Delay
        ;jmp gravity

        onGround:

        
        ;call Enemy1_draw
        
        

        call Enemy1_Update
        pushad
        call enemy_collision
        call Movement_Enemy1
        
        call Enemy1_draw
        popad

        mov cl, level
        cmp cl, 2
        je l2_enemy
        cmp cl, 3
        je l3_enemy
        jmp continue2

        l3_enemy:
            call Enemy3_Update
            pushad
            call enemy_collision3
            call Movement_Enemy3
            
            call Enemy3_draw
            
            call specialFruit
            call teleport
            popad

            call Enemy4_Update
            pushad
            call enemy_collision4
            call Movement_Enemy4
            call Enemy4_draw
            
            popad

            call Enemy5_Update
            pushad
            call enemy_collision5
            call Movement_Enemy5
            
            call Enemy5_draw
            popad
            jmp continue2

        l2_enemy:
            call Enemy2_Update
            pushad
            call enemy_collision2
            call Movement_Enemy2
            
            call Enemy2_draw
            call specialFruit
            popad
        
        continue2:
        ; get user key input:
        call ReadChar
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar, "p"
        je pause1

        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight

       ; moveUp:
        ; allow player to jump:
        ;mov ecx,1
        ;jumpLoop:
            ;call UpdatePlayer
            ;dec yPos
            ;call DrawPlayer
            ;mov eax,70
            ;call Delay
        ;loop jumpLoop
        ;jmp gameLoop

        moveUp:
            ;cmp yPos, 2
            ;jle HitWall

            call UpdatePlayer
            dec yPos

            mov esi, offset xWall
            mov edi, offset yWall
            mov ecx, 90

            pushad
            mov DX,0
            mov dl,yPos
            mov dh,xPos
            call wallCollision

            cmp ah, 0
            je Revert
            ;cmp ah, 1
            ;je continue1
            ;inc score

            continue1:
            ;call UpdatePlayer
            ;dec yPos
            call DrawPlayer
            popad
            jmp gameLoop

            Revert:
            ;call UpdatePlayer
            inc yPos    ;return
            call DrawPlayer
            popad 
            jmp gameLoop

        moveDown:
            ;cmp yPos, 28   
            ;jge HitWall 
            call UpdatePlayer
            inc yPos

            mov esi, offset xWall
            mov edi, offset yWall
            mov ecx, 90

            pushad
            mov DX,0
            mov dl,yPos
            mov dh,xPos
            call wallCollision 

            cmp ah, 0
            je Revert2

            ;call UpdatePlayer
            ;inc yPos
            call DrawPlayer
            popad
            jmp gameLoop

            Revert2:
            dec yPos    ;return
            call DrawPlayer
            popad 
            jmp gameLoop

        moveLeft:
            ;cmp xPos, 1   
            ;jle HitWall

            call UpdatePlayer
            dec xPos

            mov esi, offset xWall
            mov edi, offset yWall
            mov ecx, 90

            pushad
            mov DX,0
            mov dl,yPos
            mov dh,xPos
            call wallCollision

            cmp ah, 0
            je Revert3

            ;call UpdatePlayer
            ;dec xPos
            ;call enemy_collision
            call DrawPlayer
            popad
            jmp gameLoop

            Revert3:
            inc xPos    ;return
            ;call enemy_collision
            call DrawPlayer
            popad 
            jmp gameLoop

        moveRight:
            ;cmp xPos, 118   
            ;jge HitWall

            call UpdatePlayer
            inc xPos

            mov esi, offset xWall
            mov edi, offset yWall
            mov ecx, 90

            pushad
            mov DX,0
            mov dl,yPos
            mov dh,xPos
            call wallCollision

            cmp ah, 0
            je Revert4
            cmp ah, 2
            ;je increase
            ;jmp continue4

            ;increase:
            ;inc score

            continue4:

            ;call UpdatePlayer
            ;inc xPos
            ;call enemy_collision
            call DrawPlayer
            popad
            jmp gameLoop

            Revert4:
            dec xPos    ;return
            ;call enemy_collision
            call DrawPlayer
            popad 
            jmp gameLoop

        pause1:
            pushad
            call clrscr
            call menu
            call clrscr
            popad
            call setMap
            call setCoin
            call DrawCoin
            jmp gameloop

    HitWall:
        jmp gameLoop



    jmp gameLoop



    exitGame:
    call clrscr
    call gameover
    exit
main ENDP

DrawPlayer PROC
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al,"X"
    call WriteChar
    ret
DrawPlayer ENDP

UpdatePlayer PROC
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al, ' '
    call WriteChar

    mov al, 0
    mov ah, 0
    mov al, dl      ; Player's X position
    
    mov bl, 0
    mov bh, 0
    mov bl, map_col  ; TOTAL ROW

    imul bl
    movzx bx, dh    ;yposition
    add ax, bx      ; RESULT + COL
    ;mov map1[eax], ' '

    ret
UpdatePlayer ENDP

DrawCoin PROC
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,xCoinPos
    mov dh,yCoinPos
    call Gotoxy
    mov al,"$"
    call WriteChar
    ret
DrawCoin ENDP

setCoin PROC
    mov cl, fruit_count
    cmp cl, 1
    je fruit1
    cmp cl, 2
    je fruit2
    cmp cl, 3
    je fruit3
    cmp cl, 4
    je fruit4
    jmp no_more

    fruit1:
        mov xCoinPos, 2
        mov yCoinPos, 1
        ;inc fruit_count
        ret

    fruit2:
        mov xCoinPos, 51
        mov yCoinPos, 25
        ;inc fruit_count
        ret

    fruit3:
        mov xCoinPos, 2
        mov yCoinPos, 25
        ;inc fruit_count
        ret 

    fruit4:
        mov xCoinPos, 51
        mov yCoinPos, 2
        ;inc fruit_count
        ret

    no_more:

    ret
setCoin ENDP

wallCollision PROC
    
    level1:

    mov al, 0
    mov ah, 0
    mov al, dl      ; Player's X position
    
    mov bl, 0
    mov bh, 0
    mov bl, map_col  ; TOTAL ROW

    imul bl
    movzx bx, dh    ;yposition
    add ax, bx      ; RESULT + COL

    mov cl, level
    cmp cl, 1
    je level1_map
    cmp cl, 2
    je level2_map
    cmp cl, 3
    je level3_map

    level1_map:
    mov al, map1[eax]
    jmp map_set

    level2_map:
    mov al, map2[eax]
    jmp map_set

    level3_map:
    mov al, map3[eax]
    jmp map_set


    map_set:

    cmp al, '|'
    je  yesCollision
    cmp al, '-'
    je  yesCollision
    cmp al, '+'
    je  yesCollision
    cmp al, '/'
    je  yesCollision
    cmp al, '_'
    je  yesCollision
    cmp al, '\'
    je  yesCollision
    cmp al, '('
    je  yesCollision
    cmp al, ')'
    je  yesCollision


   
    mov ah, 1
    ret

yesCollision:
   
    ;mov ah, 0
    xor ah,ah 
    ret
wallCollision ENDP

setMap PROC
    mov dl, 0   
    mov dh, 0  

    rowLoop:
        mov dh, 0   

    columnLoop:
    
        call wallCollision
         
        call WriteChar

        inc dh  
        cmp dh, map_col  
        jl columnLoop 

        call Crlf 
        inc dl
        cmp dl, map_row
        jl rowLoop  

        ret
setMap ENDP

fruitCollision PROC
    mov al, 0
    mov ah, 0
    mov al, dl      ; Player's X position
    
    mov bl, 0
    mov bh, 0
    mov bl, map_col  ; TOTAL ROW

    imul bl
    movzx bx, dh    ;yposition
    add ax, bx      ; RESULT + COL

    mov cl, level
    cmp cl, 1
    je level1_score
    cmp cl, 2
    je level2_score
    cmp cl, 3
    je level3_score

    level1_score:
    mov bl, map1[eax]
    jmp score_set

    level2_score:
    mov bl, map2[eax]
    jmp score_set

    level3_score:
    mov bl, map3[eax]
    jmp score_set

    score_set:
    ; Check if it is '.'
    cmp bl, '.'
    jne checkPower

    cmp cl, 1
    je updatemap_l1
    cmp cl, 2
    je updatemap_l2
    cmp cl, 3
    je updatemap_l3

    updatemap_l1:
    ; If it is '.', update map and increment counters
    mov map1[eax], ' '
    ;INC foodEaten
    INC score
    jmp done2

    updatemap_l2:
    mov map2[eax], ' '
    inc score
    jmp done2

    updatemap_l3:
    mov map3[eax], ' '
    inc score
    jmp done2

checkPower:
    ; Check if it is '@'
    cmp bl, '@'
    jne done1

    cmp cl, 2
    je power_l2
    cmp cl, 3
    je power_l3

    power_l3:
    mov map3[eax], ' '
    mov powerFlag, 1
    jmp done2

    power_l2:
    mov map2[eax], ' '
    mov powerFlag, 1
    jmp done2


    ;add score, 20
    ;call setCoin
    ;call DrawCoin
    jmp done2

    ; If it is 'o', update map and special power
    ;mov map1[eax], ' '
    ;mov bl, specialPowerLimit
    ;mov specialPower, bl
    jmp done2

done1:
    cmp bl, 'H'
    jne done2
    
    cmp cl, 3
    je cherry_pls
    jmp done2

    cherry_pls:
    mov map3[eax], ' '
    inc lives
    jmp done2

    done2:


    ret
fruitCollision ENDP

Enemy1_draw PROC

    ;pushad
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,Enemy1_xPos
    mov dh,Enemy1_yPos
    call Gotoxy
    mov al,"C"
    call WriteChar
    ;popad
    ret

Enemy1_draw ENDP

Enemy1_Update PROC

   ; pushad
    mov dl, Enemy1_xPos
    mov dh, Enemy1_yPos
    call Gotoxy
    mov al, ' '
    call WriteChar
    ;popad

    ret
Enemy1_Update ENDP

Movement_Enemy1 PROC

    ;mov cl, level
    ;cmp cl, 3
    ;jne move_idc

    ;call enemy_collision

    move_idc:
    mov cl, enemy1_direction
    cmp cl, 1
    je move_right
    jmp move_left

    move_left:
        dec Enemy1_xPos
        cmp Enemy1_xPos, 2
        jle change_direction
        jmp finish

    move_right:
        inc Enemy1_xPos
        cmp Enemy1_xPos, 50
        ja change_direction
        jmp finish

    change_direction:
        mov cl, enemy1_direction
        cmp cl, 1
        jne change_direction2
        mov cl, 0
        mov enemy1_direction, cl
        jmp finish

    change_direction2:
        mov cl, 1
        mov enemy1_direction, cl
        jmp finish

    finish:
    ;popad

ret
Movement_Enemy1 ENDP

enemy_collision1 PROC

        mov bl,xPos
        cmp bl,Enemy1_xPos
        jne notCollecting
        mov bl,yPos
        cmp bl,Enemy1_yPos
        jne notCollecting
        cmp powerFlag, 1
        je killEnemy
        dec lives
        jmp notCollecting

        killEnemy:
            add score, 50
            mov Enemy1_xPos, 2
            mov Enemy1_yPos, 3

        notCollecting:

ret
enemy_collision1 ENDP


enemy_collision PROC

        mov bl,xPos
        sub bl,Enemy1_xPos
        cmp bl, 0
        jge skips
        neg bl

        skips:
        cmp bl, 0           ; CHANGE TO ADJUST
        ja notCollectings2
        mov bl,yPos
        sub bl,Enemy1_yPos
        cmp bl, 0
        jge skips2
        neg bl

        skips2:
        cmp bl, 0          ;CHANGE TO ADJUST
        ja notCollectings2
        cmp powerFlag, 1
        je killEnemys2
        dec lives
        jmp notCollectings2

        killEnemys2:
            mov Enemy1_yPos, 5
            mov Enemy1_xPos, 2
            add score, 50

        notCollectings2:

ret
enemy_collision ENDP

Enemy2_draw PROC

    ;pushad
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,Enemy2_xPos
    mov dh,Enemy2_yPos
    call Gotoxy
    mov al,"C"
    call WriteChar
    ;popad
    ret

Enemy2_draw ENDP

Enemy2_Update PROC

   ; pushad
    mov dl, Enemy2_xPos
    mov dh, Enemy2_yPos
    call Gotoxy
    mov al, ' '
    call WriteChar
    ;popad

    ret
Enemy2_Update ENDP

Movement_Enemy2 PROC

    ;call enemy_collision2
    ;pushad
    ;1 = DOWN. 2 = LEFT. 3 = UP. 4 = RIGHT

    mov cl, enemy2_direction
    cmp cl, 1
    je move_down
    cmp cl, 2
    je move_left
    cmp cl, 3
    je move_up
    cmp cl, 4
    je move_right

    move_left:
        dec Enemy2_xPos
        cmp Enemy2_xPos, 2
        jle change_direction3
        jmp finish2

    move_down:
        inc Enemy2_yPos
        cmp Enemy2_yPos, 15
        ja change_direction3
        jmp finish2

    move_up:
        dec Enemy2_yPos
        cmp Enemy2_yPos, 10
        jle change_direction3
        jmp finish2

    move_right:
        inc Enemy2_xPos
        cmp Enemy2_xPos, 50
        ja change_direction3
        jmp finish2

    change_direction3:
        mov cl, enemy2_direction
        cmp cl, 1
        je setLeft
        cmp cl, 2
        je setUp
        cmp cl, 3
        je setRight
        cmp cl, 4
        je setDown
        jmp finish2

        setLeft:
            mov cl, 2
            mov enemy2_direction, cl
            mov cl, powerFlag
            cmp cl, 1
            jne finish2
            cmp level, 2
            jne finish2
            inc revolutionCount
            jmp finish2

        setUp:
            mov cl, 3
            mov enemy2_direction, cl
            jmp finish2

        setRight:
            mov cl, 4
            mov enemy2_direction, cl
            jmp finish2

        setDown:
            mov cl, 1
            mov enemy2_direction, cl
            jmp finish2

        finish2:
        ;call enemy_collision2
ret
Movement_Enemy2 ENDP

enemy_collision2 PROC

        mov bl,xPos
        sub bl,Enemy2_xPos
        cmp bl, 0
        jge skip
        neg bl

        skip:
        cmp bl, 0           ; CHANGE TO ADJUST
        ja notCollecting2
        mov bl,yPos
        sub bl,Enemy2_yPos
        cmp bl, 0
        jge skip2
        neg bl

        skip2:
        cmp bl, 0          ;CHANGE TO ADJUST
        ja notCollecting2
        cmp powerFlag, 1
        je killEnemy2
        dec lives
        jmp notCollecting2

        killEnemy2:
            mov Enemy2_yPos, 11
            mov Enemy2_xPos, 2
            add score, 50

        notCollecting2:

ret
enemy_collision2 ENDP

enemy_collisionss3 PROC

        mov bl,xPos
        cmp bl,Enemy2_xPos
        jne notCollecting2
        mov bl,yPos
        cmp bl,Enemy2_yPos
        jne notCollecting2
        ; player is intersecting coin:
        dec lives

        notCollecting2:

ret
enemy_collisionss3 ENDP

specialFruit PROC

        mov bl,xPos
        cmp bl, xCoinPos
        jne notCollecting2
        mov bl,yPos
        cmp bl, yCoinPos
        jne notCollecting2
        ; player is intersecting coin:
        add score, 20
        inc fruit_count
        call setCoin
        call DrawCoin

        notCollecting2:


ret
specialFruit ENDP

teleport PROC

    mov bl, xPos
    mov bh, yPos
    cmp bl, 48
    jne check2
    cmp bh, 3
    jne check2
    mov xPos, 3
    mov yPos, 19
    mov dl, 48
    mov dh, 3
    call Gotoxy
    mov al, '{'
    call writeChar


    check2:
    cmp bl, 4
    jne noTeleport
    cmp bh, 19
    jne noTeleport
    mov xPos, 49
    mov yPos, 3
    mov dl, 4
    mov dh, 19
    call Gotoxy
    mov al, '}'
    call writeChar



    noTeleport:

ret
teleport ENDP

Enemy3_draw PROC

    ;pushad
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,Enemy3_xPos
    mov dh,Enemy3_yPos
    call Gotoxy
    mov al,"C"
    call WriteChar
    ;popad
    ret

Enemy3_draw ENDP

Enemy3_Update PROC

   ; pushad
    mov dl, Enemy3_xPos
    mov dh, Enemy3_yPos
    call Gotoxy
    mov al, ' '
    call WriteChar
    ;popad

    ret
Enemy3_Update ENDP

Movement_Enemy3 PROC

    ;pushad
    ;1 = DOWN. 2 = LEFT. 3 = UP. 4 = RIGHT

    mov cl, enemy3_direction
    cmp cl, 1
    je move_down2
    cmp cl, 2
    je move_left2
    cmp cl, 3
    je move_up2
    cmp cl, 4
    je move_right2

    move_left2:
        dec Enemy3_xPos
        pushad
        mov dx, 0
        mov dl, Enemy3_yPos
        mov dh, Enemy3_xPos
        call wallCollision
        cmp ah, 0
        popad
        jne noChange
        inc Enemy3_xPos
        jmp change_direction4

    move_down2:
        inc Enemy3_yPos
        pushad
        mov dx, 0
        mov dl, Enemy3_yPos
        mov dh, Enemy3_xPos
        call wallCollision
        cmp ah, 0
        popad
        jne noChange
        dec Enemy3_yPos
        jmp change_direction4

    move_up2:
        dec Enemy3_yPos
        pushad
        mov dx, 0
        mov dl, Enemy3_yPos
        mov dh, Enemy3_xPos
        call wallCollision
        cmp ah, 0
        popad
        jne noChange
        inc Enemy3_yPos
        jmp change_direction4

    move_right2:
        inc Enemy3_xPos
        pushad
        mov dx, 0
        mov dl, Enemy3_yPos
        mov dh, Enemy3_xPos
        call wallCollision
        cmp ah, 0
        popad
        jne noChange
        dec Enemy3_xPos
        jmp change_direction4

    change_direction4:
        mov cl, enemy3_direction
        cmp cl, 1
        je setLeft2
        cmp cl, 2
        je setUp2
        cmp cl, 3
        je setRight2
        cmp cl, 4
        je setDown2
        jmp noChange

        setLeft2:
            mov cl, 2
            mov enemy3_direction, cl
            mov cl, powerFlag
            cmp cl, 1
            jne noChange
            ;inc revolutionCount
            jmp noChange

        setUp2:
            mov cl, 3
            mov enemy3_direction, cl
            jmp noChange

        setRight2:
            mov cl, 4
            mov enemy3_direction, cl
            jmp noChange

        setDown2:
            mov cl, 1
            mov enemy3_direction, cl
            jmp noChange





    noChange:

ret
Movement_Enemy3 ENDP

enemy_collision3 PROC

        mov bl,xPos
        sub bl,Enemy3_xPos
        cmp bl, 0
        jge skip3
        neg bl

        skip3:
        cmp bl, 0           ; CHANGE TO ADJUST
        ja notCollecting3
        mov bl,yPos
        sub bl,Enemy3_yPos
        cmp bl, 0
        jge skip4
        neg bl

        skip4:
        cmp bl, 0          ;CHANGE TO ADJUST
        ja notCollecting3
        cmp powerFlag, 1
        je killEnemy3
        dec lives
        jmp notCollecting3

        killEnemy3:
            mov Enemy3_yPos, 10
            mov Enemy3_xPos, 20
            add score, 50

        notCollecting3:

ret
enemy_collision3 ENDP

Enemy5_draw PROC

    ;pushad
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,Enemy5_xPos
    mov dh,Enemy5_yPos
    call Gotoxy
    mov al,"C"
    call WriteChar
    ;popad
    ret

Enemy5_draw ENDP

Enemy5_Update PROC

   ; pushad
    mov dl, Enemy5_xPos
    mov dh, Enemy5_yPos
    call Gotoxy
    mov al, ' '
    call WriteChar
    ;popad

    ret
Enemy5_Update ENDP

Movement_Enemy5 PROC

    ;pushad
    ;1 = DOWN. 2 = LEFT. 3 = UP. 4 = RIGHT

    mov cl, enemy5_direction
    cmp cl, 1
    je move_down4
    cmp cl, 2
    je move_left4
    cmp cl, 3
    je move_up4
    cmp cl, 4
    je move_right4

    move_left4:
        dec Enemy5_xPos
        pushad
        mov dx, 0
        mov dl, Enemy5_yPos
        mov dh, Enemy5_xPos
        call wallCollision
        cmp ah, 0
        popad
        jne noChange3
        inc Enemy5_xPos
        jmp change_direction6

    move_down4:
        inc Enemy5_yPos
        pushad
        mov dx, 0
        mov dl, Enemy5_yPos
        mov dh, Enemy5_xPos
        call wallCollision
        cmp ah, 0
        popad
        jne noChange3
        dec Enemy5_yPos
        jmp change_direction6

    move_up4:
        dec Enemy5_yPos
        pushad
        mov dx, 0
        mov dl, Enemy5_yPos
        mov dh, Enemy5_xPos
        call wallCollision
        cmp ah, 0
        popad
        jne noChange3
        inc Enemy5_yPos
        jmp change_direction6

    move_right4:
        inc Enemy5_xPos
        pushad
        mov dx, 0
        mov dl, Enemy5_yPos
        mov dh, Enemy5_xPos
        call wallCollision
        cmp ah, 0
        popad
        jne noChange3
        dec Enemy5_xPos
        jmp change_direction6

    change_direction6:
        mov cl, enemy5_direction
        cmp cl, 1
        je setRight4
        cmp cl, 2
        je setUp4
        cmp cl, 3
        je setDown4
        cmp cl, 4
        je setLeft4
        jmp noChange3

        setLeft4:
            mov cl, 2
            mov enemy5_direction, cl
            mov cl, powerFlag
            cmp cl, 1
            jne noChange3
            ;inc revolutionCount
            jmp noChange3

        setUp4:
            mov cl, 3
            mov enemy5_direction, cl
            jmp noChange3

        setRight4:
            mov cl, 4
            mov enemy5_direction, cl
            jmp noChange3

        setDown4:
            mov cl, 1
            mov enemy5_direction, cl
            jmp noChange3





    noChange3:

ret
Movement_Enemy5 ENDP


enemy_collision5 PROC

        mov bl,xPos
        sub bl,Enemy5_xPos
        cmp bl, 0
        jge skip5
        neg bl

        skip5:
        cmp bl, 0           ; CHANGE TO ADJUST
        ja notCollecting5
        mov bl,yPos
        sub bl,Enemy5_yPos
        cmp bl, 0
        jge skip6
        neg bl

        skip6:
        cmp bl, 0          ;CHANGE TO ADJUST
        ja notCollecting5
        cmp powerFlag, 1
        je killEnemy5
        dec lives
        jmp notCollecting5

        killEnemy5:
            mov Enemy5_yPos, 25
            mov Enemy5_xPos, 50
            add score, 50

        notCollecting5:

ret
enemy_collision5 ENDP

Enemy4_draw PROC

    ;pushad
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,Enemy4_xPos
    mov dh,Enemy4_yPos
    call Gotoxy
    mov al,"C"
    call WriteChar
    ;popad
    ret

Enemy4_draw ENDP

Enemy4_Update PROC

   ; pushad
    mov dl, Enemy4_xPos
    mov dh, Enemy4_yPos
    call Gotoxy
    mov al, ' '
    call WriteChar
    ;popad

    ret
Enemy4_Update ENDP

Movement_Enemy4 PROC

    ;pushad
    ;1 = DOWN. 2 = LEFT. 3 = UP. 4 = RIGHT

    mov cl, enemy4_direction
    cmp cl, 1
    je move_down3
    cmp cl, 2
    je move_left3
    cmp cl, 3
    je move_up3
    cmp cl, 4
    je move_right3

    move_left3:
        dec Enemy4_xPos
        pushad
        mov dx, 0
        mov dl, Enemy4_yPos
        mov dh, Enemy4_xPos
        call wallCollision
        cmp ah, 0
        popad
        jne noChange2
        inc Enemy4_xPos
        jmp change_direction5

    move_down3:
        inc Enemy4_yPos
        pushad
        mov dx, 0
        mov dl, Enemy4_yPos
        mov dh, Enemy4_xPos
        call wallCollision
        cmp ah, 0
        popad
        jne noChange2
        dec Enemy4_yPos
        jmp change_direction5

    move_up3:
        dec Enemy4_yPos
        pushad
        mov dx, 0
        mov dl, Enemy4_yPos
        mov dh, Enemy4_xPos
        call wallCollision
        cmp ah, 0
        popad
        jne noChange2
        inc Enemy4_yPos
        jmp change_direction5

    move_right3:
        inc Enemy4_xPos
        pushad
        mov dx, 0
        mov dl, Enemy4_yPos
        mov dh, Enemy4_xPos
        call wallCollision
        cmp ah, 0
        popad
        jne noChange2
        dec Enemy4_xPos
        jmp change_direction5

    change_direction5:
        mov cl, enemy4_direction
        cmp cl, 1
        je setLeft3
        cmp cl, 2
        je setUp3
        cmp cl, 3
        je setRight3
        cmp cl, 4
        je setDown3
        jmp noChange2

        setLeft3:
            mov cl, 2
            mov enemy4_direction, cl
            mov cl, powerFlag
            cmp cl, 1
            jne noChange2
            inc revolutionCount
            jmp noChange2

        setUp3:
            mov cl, 3
            mov enemy4_direction, cl
            jmp noChange2

        setRight3:
            mov cl, 4
            mov enemy4_direction, cl
            jmp noChange2

        setDown3:
            mov cl, 1
            mov enemy4_direction, cl
            jmp noChange2





    noChange2:

ret
Movement_Enemy4 ENDP

enemy_collision4 PROC

        mov bl,xPos
        sub bl,Enemy4_xPos
        cmp bl, 0
        jge skip4
        neg bl

        skip4:
        cmp bl, 0           ; CHANGE TO ADJUST
        ja notCollecting4
        mov bl,yPos
        sub bl,Enemy4_yPos
        cmp bl, 0
        jge skip5
        neg bl

        skip5:
        cmp bl, 0          ;CHANGE TO ADJUST
        ja notCollecting4
        cmp powerFlag, 1
        je killEnemy4
        dec lives
        jmp notCollecting4

        killEnemy4:
            mov Enemy4_yPos, 10
            mov Enemy4_xPos, 51
            add score, 50

        notCollecting4:

ret
enemy_collision4 ENDP

gameover PROC

    mov dl, 1
    mov dh, 0
    call Gotoxy
    mov edx, offset nameInput
    call writeString

    mov dl, 1
    mov dh, 1
    call Gotoxy
    mov edx, offset strGameOver
    call WriteString

    mov eax, 0
    mov ebx, 0
    mov dl, 1
    mov dh, 2
    call Gotoxy
    mov edx, offset strScore
    call WriteString
    mov ebx, score3
    mov al, score
    add ebx, eax
    mov eax, 0
    mov al, score2
    add ebx, eax
    ;add bl, score2
    
    ;mov al, bl
    mov eax, ebx
    mov score3, eax
    call WriteDec

    mov eax, 0
        mov dl, 1
        mov dh, 3
        call Gotoxy
        mov edx, offset strLevel
        call writeString
        mov al, level
        call WriteInt
    call crlf

 
    ;INVOKE CreateFile, ADDR fileName, GENERIC_WRITE, 0, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
    ;INVOKE CreateFile, ADDR fileName, GENERIC_WRITE, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0

    INVOKE CreateFile, ADDR fileName, FILE_APPEND_DATA, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0


    MOV ebx, eax  
    CMP ebx, INVALID_HANDLE_VALUE 
    JE fileError  



    mov eax, ebx
    MOV edx, OFFSET nameInput
    MOV ecx, LENGTHOF nameInput  
    CALL WriteToFile   

    MOV eax, 0
    mov eax, score3
    pushad
    call IntToString
    popad
    mov eax, ebx
    mov edx, offset buffer
    mov ecx, BUFFER_SIZE
    CALL WriteToFile 

    MOV eax, 0
    mov al, level
    pushad
    call IntToString
    popad
    mov eax, ebx
    mov edx, offset buffer
    mov ecx, BUFFER_SIZE
    call WriteToFile

    INVOKE CloseHandle, ebx

    fileError:


    call waitmsg
    call clrscr
ret
gameover ENDP

IntToString PROC

   mov ecx, 10
   mov edi, offset buffer
   resetLoop:
        mov BYTE PTR [edi], 0
        inc edi
        loop resetLoop

    mov ecx, BUFFER_SIZE 
    mov edi, OFFSET buffer  
    mov BYTE PTR [edi], 0  

    mov ebx, 10    
    add edi, 4
    mov BYTE PTR [edi], 0
    dec edi

convertLoop:
    xor edx, edx    
    div ebx         
    add dl, '0'     
    ;dec edi         
    mov [edi], dl  
    dec edi
    dec ecx        

    cmp ecx, 0      
    jz endConversion  

    test eax, eax   
    jnz convertLoop 

endConversion:
    add edi, 5
    mov BYTE PTR [edi], 0
    ret
IntToString ENDP

ReadAndSortScores PROC

    INVOKE CreateFile, ADDR gameDataFileName, GENERIC_READ, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0
  
    CMP eax, INVALID_HANDLE_VALUE
    JE fileError


    mov edx, OFFSET gameDataBuffer
    INVOKE ReadFile, eax, edx, SIZEOF gameDataBuffer, ADDR entryCount, 0

    test eax, eax
    JS fileError
    
    INVOKE CloseHandle, eax


    ;mov ecx, 0
    mov esi, OFFSET gameDataBuffer
    mov edi, OFFSET scoreArray
    mov ecx, 0
    parseLoop:
        cmp ecx, entryCount
        jge sortScores
       
        mov eax, [esi] 
        mov [edi], eax 
        add esi, 4 
        mov edx, [esi] 
        add esi, 4 
        mov edi, OFFSET gameDataBuffer 
        add edi, [esi]
        mov [edi], edx 
        add edi, 4 
        mov eax, edx 
        mov ecx, 0
        nameLoop:
            mov al, [esi + ecx + 4] 
            mov [edi + ecx], al 
            inc ecx 
            loop nameLoop 

        add edi, eax
        mov BYTE PTR [edi], 0 
        add esi, eax 
        add esi, 4
        add eax, 5
        add edi, eax  
        inc ecx
        jmp parseLoop

    sortScores:
        call sortScores2


    mov ecx, 0
    displayLoop:
        cmp ecx, entryCount
        jge exitProcedure
        mov eax, [scoreArray + ecx * 8] 
        call WriteDec
        mov edx, [scoreArray + ecx * 8 + 4]
        call WriteString
        inc ecx
        jmp displayLoop

    exitProcedure:
    ret

fileError:
    ret

ReadAndSortScores ENDP

GetString PROC
    mov edi, edx
    readLoop:
        mov al, [esi]
        mov [edi], al
        inc esi
        inc edi
        cmp al, 0
        jnz readLoop
    ret
GetString ENDP

sortScores2 PROC

    mov ecx, entryCount
    dec ecx 
    jz sorted

outerLoop:
    xor edx, edx 
    mov edi, 0 

innerLoop:
        mov eax, [scoreArray + edi * 8] 
        cmp eax, [scoreArray + edi * 8 + 8] 
        jg swapScores 

        inc edi 
        inc edx 
        cmp edx, ecx 
        jl innerLoop 

  
        dec ecx
        jnz outerLoop 

    sorted:
        ret

    swapScores:
        ; Swap the scores
        mov eax, [scoreArray + edi * 8] 
        mov ebx, [scoreArray + edi * 8 + 4] 
        xchg eax, [scoreArray + edi * 8 + 8] 
        xchg ebx, [scoreArray + edi * 8 + 12] 
    ret

sortScores2 ENDP


END main