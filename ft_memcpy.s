;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mbooth <mbooth@student.42.fr>              +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/04/04 19:34:07 by mbooth            #+#    #+#              ;
;    Updated: 2015/04/05 10:51:27 by mbooth           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

section .text
	global _ft_memcpy

_ft_memcpy:
	push rdi					;initial address
	mov rcx, rdx				;rdx - size to be copied
	rep movsb					;from rsi to rdi
	pop rax						;initial address
	ret