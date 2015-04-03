;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcat.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mbooth <mbooth@student.42.fr>              +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/04/03 17:24:01 by mbooth            #+#    #+#              ;
;    Updated: 2015/04/03 18:19:28 by mbooth           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

section .text
	global _ft_strcat

_ft_strcat:
	enter 0, 0
	mov rax, rdi				;move address of s1 (rdi) to return register (rax)	

find_end_s1:
	cmp [rax], byte 0		;if rax[r11] == '\0'
	je  add_second_str 			;jump to add second string to s1
	inc rax
	jmp find_end_s1

add_second_str:
	cmp [rsi], byte 0
	je  exit
	mov rbx, [rsi]
	mov [rax], rbx
	inc rax
	inc rsi
	jmp add_second_str

exit:
	mov rax, rdi
	leave
	ret