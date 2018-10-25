# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isprint.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 09:43:14 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/25 10:00:24 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
global _ft_isprint
global nope

nope:
	mov rax, 0			;we set return value to 0 (true)
	ret

_ft_isprint:
	mov rax, 1			; set initial return value to true
	cmp rdi, 0x20		; make sure parameter is over lower end
	jl nope		; if not, tell it to f*ck off
	cmp rdi, 0x7e		; now compare with higher end
	jg nope				; been here done that
	ret
