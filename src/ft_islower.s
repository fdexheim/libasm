# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_islower.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 10:00:43 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/31 15:32:28 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_islower
	global notlower

notlower:
	mov rax, 0			; we set return value to 0 (false)
	ret

_ft_islower:
	mov rax, 1			; set initial return value to true
	cmp rdi, 0x61		; make sure parameter is over lower end
	jl notlower			; if not, tell it to f*ck off
	cmp rdi, 0x7a		; now compare with higher end
	jg notlower			; been here done that
	ret
