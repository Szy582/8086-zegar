org 100h
start:
	call ent
	mov ah,9
	mov dx,tekst
	int 21h
petla:
	call ent
	call wysCzas
	
	mov ah,0
	int 16h ;pobrany znak -> al
	cmp al,98 ;b=98
	jne petla
	
koniec:
	mov ax,4c00h
	int 21h


tekst	db "b - konczy program$"

wysCzas:
	mov ah,2ch
	int 21h ;zwraca akt. czas do ch,cl,dh
	
	mov al,ch ;godz
	call wyswZn
	call dwuk
	
	mov al,cl ;min
	call wyswZn
	call dwuk
	
	mov al,dh ;sek
	call wyswZn
	ret
	
dwuk:
	pusha
	mov ah,2
	mov dl,58
	int 21h
	popa
	ret
	
wyswZn: ;wyświetla ostatnie 2 cyfry z al
	pusha
	xor ah,ah
	mov bl,10
	div bl ;al=wyn, ah=reszta
	mov cl,ah ; reszta
	mov dl,al
	mov ah,2
	add dl,48
	int 21h
	mov dl,cl
	add dl,48
	int 21h
	popa
	ret
		

ent:
	pusha
	mov ah,2
	mov dl,13
	int 21h
	mov dl,10
	int 21h
	popa
	ret

