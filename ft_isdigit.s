;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isdigit.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mbooth <mbooth@student.42.fr>              +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/04/04 10:29:21 by mbooth            #+#    #+#              ;
;    Updated: 2015/04/04 10:52:35 by mbooth           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

section .text
	global _ft_isdigit

_ft_isdigit:
	mov rax, 0
	mov rbx, rdi
	cmp rbx, 48
	jl  exit
	cmp rbx, 57
	jg  exit
	mov rax, 1
	jmp exit

exit:
	ret