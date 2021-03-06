;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_bzero.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mbooth <mbooth@student.42.fr>              +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/04/02 16:06:29 by mbooth            #+#    #+#              ;
;    Updated: 2015/04/03 16:48:36 by mbooth           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

section .text
	global _ft_bzero

_ft_bzero:
	enter 0, 0
	cmp   rsi, 0
	jz    exit
	mov   rax, rsi
	mov   rbx, rdi

ft_bzero_loop:
	cmp   rax, 0
	jz    exit
	mov   [rbx], byte 0
	inc   rbx
	dec   rax
	jmp   ft_bzero_loop

exit:
	leave
	ret