macro printstr st
    lea dx,st
    mov ah,9
    int 21h
endm
macro goto x,y
    pusha 
    mov dh,x
    mov dl,y
    mov bh,0
    mov ah,2
    int 10h
    popa
endm
macro printchar str,color
    pusha
    mov al,str
    mov bh,0
    mov bl,color
    mov ah,9
    mov cx,1
    int 10h
    popa 
endm
.model small
.data
menu1 db "Shape:",10,13,"a-Circle b-Triangle c-Rhombus: $"
menu2 db "symbol:",10,13,"a-(+) b-(*) c-(-): $" 
menu3 db "color:",10,13,"a-Green b-Blue c-Red: $"     
menu4 db "area: $"
line db 10,13,"$"
input db 3 dup(0)
area dw ?
are dw ?
sym db ?,"$" 
col db ?
num db 3,?,3 dup("$"),"$"
row db 2
cols db 40 
f db 0
msg db "input is: $"
m1 db "Circle,$"
m2 db "Triangle,$"
m3 db "Rhombus,$"
c1 db "Green,$"
c2 db "Blue,$"
c3 db "Red,$"
tmp dw ?
.code
start:
mov ax,@data
mov ds,ax
lea si,input 
printstr menu1
call getuser
printstr line
;===============
inc si
printstr menu2
call getuser
printstr line
;===============
inc si
printstr menu3
call getuser
printstr line
;===============
printstr menu4
lea si,area
lea dx,num
mov ah,0ah
int 21h
mov ah,0
lea di,num+2
mov al,[di]
sub al,30h ;31h-30h=1
inc di
cmp [di],36h
je ok
cmp [di],13
je ok
mov bl,10
mul bl
mov bl,[di]
sub bl,30h
add al,bl
ok:
mov area,ax
;----------------
    mov ah,6
    mov bh,0fh
    mov ch,0
    mov cl,0
    mov dh,25
    mov dl,80
    mov al,0
    int 10h
;---------------- 
lea si,input+1
cmp [si],1 
je sy1
cmp [si],2
je sy2
jmp sy3
sy1:
mov sym,"+"
jmp colors
sy2:
mov sym,"*"
jmp colors
sy3:
mov sym,"-" 

;====symbol====
colors:
lea si,input+2
cmp [si],1
je cl1
cmp [si],2
je cl2
jmp cl3
cl1:
mov col,0ah
lea dx,c1
mov tmp,dx
jmp shape 
cl2:
mov col,09h
lea dx,c2
mov tmp,dx
jmp shape
cl3:
mov col,0ch 
lea dx,c3
mov tmp,dx

shape: 
mov ax,area
mov are,ax
cmp area,50
jg divs
mov dx,0
mov ax,area
mov bx,2
div bx
jmp continue
divs:
mov dx,0
mov ax,area
mov bx,4
div bx
continue: 
mov area,ax
add area,2
push ax
lea si,input
cmp [si],1
je circle
cmp [si],2
je triangle
jmp rhombus 
circle: 
goto 0,0
printstr msg
printstr m1
mov dx,tmp
mov ah,9
int 21h
printstr sym
mov dl,","
mov ah,2
int 21h
mov ax,are
call print_ax
pop ax

mov dx,0
mov cx,ax 
mov bx,2
divcirc:
cmp cx,7
jng nodiv
mov ax,cx
div bx
mov cx,ax
jmp divcirc

nodiv:
mov area,cx
add area,1
push cx
goto row,cols  
printchar sym,col
circ:
cmp f,1
je circ2
jne circ1
circ2:   
mov cx,area 
push cx           
sub row,1        
circ1:            
inc row
dec cols
goto row,cols  
printchar sym,col
loop circ1
pop cx
push cx
cmp f,1
jne circc2
sub cx,1
circc2: 
inc row
goto row,cols  
printchar sym,col
loop circc2
pop cx
push cx 
circ3:
inc row
inc cols
goto row,cols  
printchar sym,col 
loop circ3  
pop cx
push cx
cmp f,1
jne circ4
sub cx,1
circ4:
inc cols
goto row,cols
printchar sym,col 
loop circ4
pop cx
push cx 
circ5:
dec row
inc cols
goto row,cols
printchar sym,col 
loop circ5
pop cx
push cx
cmp f,1
jne circ6
sub cx,1
circ6:
dec row
goto row,cols
printchar sym,col 
loop circ6
pop cx
push cx
circ7:
dec row
dec cols
goto row,cols
printchar sym,col 
loop circ7
pop cx
push cx
cmp f,1
jne circ8
sub cx,1 
circ8:
dec cols
goto row,cols
printchar sym,col 
loop circ8  
cmp f,1
je pause
mov f,1
jmp circ


mov ah,8
int 21h                  

triangle:
 
goto 0,0
printstr msg
printstr m2
mov dx,tmp
mov ah,9
int 21h
printstr sym
mov dl,","
mov ah,2
int 21h
mov ax,are
call print_ax
pop ax


mov cx,ax
dec cx
push cx
goto row,cols  
printchar sym,col
tria:
cmp f,1
je trpr2
jne trf1
trpr2:
mov cx,area 
push cx
sub row,2
trf1:
inc row
dec cols
goto row,cols
printchar sym,col
loop trf1
pop cx
push cx 
mov ax,2
mul cx
mov cx,ax
trf2:
inc cols
goto row,cols
printchar sym,col
loop trf2
pop cx
trf3:
dec row
dec cols
goto row,cols
printchar sym,col
loop trf3
cmp f,1
je pause
mov f,1
jmp tria


rhombus:
goto 0,0
printstr msg
printstr m3
mov dx,tmp
mov ah,9
int 21h
printstr sym
mov dl,","
mov ah,2
int 21h
mov ax,are
call print_ax
pop ax

mov dx,0
mov cx,ax 
mov bx,2
divrho:
cmp cx,10
jng nodivr
mov ax,cx
div bx
mov cx,ax
jmp divrho

nodivr:
mov area,cx
add area,1
push cx
goto row,cols  
printchar sym,col
rhomb:
cmp f,1
je rhomb2
jne rhomb1
rhomb2:   
mov cx,area 
push cx           
sub row,1        
rhomb1:  
inc row
dec cols
goto row,cols
printchar sym,col
loop rhomb1 
pop cx
push cx
rmb2:  
inc row
inc cols
goto row,cols
printchar sym,col
loop rmb2 
pop cx
push cx
rmb3:  
dec row
inc cols
goto row,cols
printchar sym,col
loop rmb3
pop cx
push cx
rmb4:  
dec row
dec cols
goto row,cols
printchar sym,col
loop rmb4  
cmp f,1
je pause
mov f,1
jmp rhomb
pause:
mov ah,8
int 21h
mov ax,4c00h
int 21h  
;============
proc getuser 
    get:
    mov ah,1
    int 21h
    cmp al,61h  ;61=a
    jl get
    cmp al,63h
    jg get  
    
    cmp al,61h
    je s1
    cmp al,62h
    je s2
    cmp al,63h
    je s3
    s1:
    mov [si],1
    jmp endt
    s2:
    mov [si],2
    jmp endt
    s3:
    mov [si],3
    endt:
    ret
endp 

print_ax proc
cmp ax, 0
jne print_ax_r
    push ax
    mov al, '0'
    mov ah, 0eh
    int 10h
    pop ax
    ret 
print_ax_r:
    pusha
    mov dx, 0
    cmp ax, 0
    je pn_done
    mov bx, 10
    div bx    
    call print_ax_r
    mov ax, dx
    add al, 30h
    mov ah, 0eh
    int 10h    
    jmp pn_done
pn_done:
    popa  
    ret  
endp
end start
