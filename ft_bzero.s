;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_bzero.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mbooth <mbooth@student.42.fr>              +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/04/02 16:06:29 by mbooth            #+#    #+#              ;
;    Updated: 2015/04/03 15:24:13 by mbooth           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

section .text
	global _ft_bzero

_ft_bzero:
	cmp rsi, 0
	jz  exit
	mv  rax, rsi
	mv  rbx, rdi
	;; jmp to loop?

ft_bzero_loop:
	cmp rax, 0
	jz  exit
	mov byte[rbx], 0
	inc rbx
	dec rax
	jmp ft_bzero_loop

exit: 
	ret