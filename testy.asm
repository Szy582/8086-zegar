; TESTY:
; aby uruchomić test należy dodać funkcje testowe na końcu programu,
; następnie wywołać je na początku jako funkcje, np:
; org 100h
; call t1
; (...)

t1: ;testuje wyświetlanie zmierzonego czasu
	; działa poprawnie
	; powinno być:
	; 54g67m23s

	
	mov bx,zmGodz
	mov [bx],byte 54
	mov bx,zmMin
	mov [bx],byte 67
	mov bx,zmSek
	mov [bx],byte 23
	call wysZmCzas
	pop ax
	jmp koniec
	
t2: ; testowanie odejmowania czasu
	; działa poprawnie
	; powinno być:
	; 52g12m13s
	
	mov bx,aktGodz
	mov [bx],byte 54
	mov bx,aktMin
	mov [bx],byte 15
	mov bx,aktSek
	mov [bx],byte 23
	
	mov bx,stGodz
	mov [bx],byte 2
	mov bx,stMin
	mov [bx],byte 3
	mov bx,stSek
	mov [bx],byte 10
	
	call obliczCzas
	call wysZmCzas
	pop ax
	jmp koniec
	
t3: ; testowanie 'dodajSek'
	; działa poprawnie
	; powinno być:
	; 24g34m86s
	
	mov bx,aktGodz
	mov [bx],byte 24
	mov bx,aktMin
	mov [bx],byte 35
	mov bx,aktSek
	mov [bx],byte 26
	
	call dodajSek
	
	
	call obliczCzas
	call wysZmCzas
	pop ax
	jmp koniec
	
t4: ; testowanie 'dodajMin'
	; działa poprawnie
	; powinno być:
	; 25g97m26s
	
	mov bx,aktGodz
	mov [bx],byte 26
	mov bx,aktMin
	mov [bx],byte 37
	mov bx,aktSek
	mov [bx],byte 26
	
	call dodajMin
	
	
	call obliczCzas
	call wysZmCzas
	pop ax
	jmp koniec
	
t5: ; testowanie odejmowania z przesunięciem sek (tylko)
	; działa poprawnie
	; powinno być:
	; 00g01m07s
	
	mov bx,aktGodz
	mov [bx],byte 10
	mov bx,aktMin
	mov [bx],byte 27
	mov bx,aktSek
	mov [bx],byte 5
	
	mov bx,stGodz
	mov [bx],byte 10
	mov bx,stMin
	mov [bx],byte 25
	mov bx,stSek
	mov [bx],byte 58
	
	call obliczCzas
	call wysZmCzas
	pop ax
	jmp koniec
	
t6: ; testowanie odejmowania z brakującą minutą
	; działa poprawnie
	; powinno być:
	; 00g59m58s
	
	mov bx,aktGodz
	mov [bx],byte 11
	mov bx,aktMin
	mov [bx],byte 0
	mov bx,aktSek
	mov [bx],byte 5
	
	mov bx,stGodz
	mov [bx],byte 10
	mov bx,stMin
	mov [bx],byte 0
	mov bx,stSek
	mov [bx],byte 7
	
	call obliczCzas
	call wysZmCzas
	pop ax
	jmp koniec
	
t7: ; testowanie odejmowania 
	; działa poprawnie
	; zmierzony czas: 1g-2s+3m
	; powinno być:
	; 01g02m58s
	
	mov bx,aktGodz
	mov [bx],byte 11
	mov bx,aktMin
	mov [bx],byte 3
	mov bx,aktSek
	mov [bx],byte 5
	
	mov bx,stGodz
	mov [bx],byte 10
	mov bx,stMin
	mov [bx],byte 0
	mov bx,stSek
	mov [bx],byte 7
	
	call obliczCzas
	call wysZmCzas
	pop ax
	jmp koniec

t8: ; testowanie odejmowania 
	; działa poprawnie
	; zmierzony czas: 3g-3s-7m
	; powinno być:
	; 02g52m57s
	
	mov bx,aktGodz
	mov [bx],byte 13
	mov bx,aktMin
	mov [bx],byte 2
	mov bx,aktSek
	mov [bx],byte 4
	
	mov bx,stGodz
	mov [bx],byte 10
	mov bx,stMin
	mov [bx],byte 9
	mov bx,stSek
	mov [bx],byte 7
	
	call obliczCzas
	call wysZmCzas
	pop ax
	jmp koniec