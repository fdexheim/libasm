# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isascii.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 09:33:48 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/01 10:10:04 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_isascii

itsasciimate:
	mov rax, 1			;we set return value to 1 (true)
	ret

notascii:
	ret

_ft_isascii:
	mov rax, 0			; set initial return value to false
	cmp rdi, 0x0		; make sure parameter is over lower end
	jl notascii			; if not, tell it to f*ck off
	cmp rdi, 0x7f		; now compare with higher end
	jle itsasciimate	; ayy m89 it's an ascii
	ret
