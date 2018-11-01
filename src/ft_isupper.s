# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isupper.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 10:08:49 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/01 10:10:30 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_isupper

notupper:
	mov rax, 0			;we set return value to 0 (true)
	ret

_ft_isupper:
	mov rax, 1			; set initial return value to true
	cmp rdi, 0x41		; make sure parameter is over upper end
	jl notupper			; if not, tell it to f*ck off
	cmp rdi, 0x5a		; now compare with higher end
	jg notupper			; been here done that
	ret
