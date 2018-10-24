# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isdigit.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/22 15:04:57 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/24 15:39:01 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
global _ft_isdigit
global itsdigitmate
global done

itsdigitmate:
	mov rsi, 1			;we set return value to 1 (true)
	jmp done

_ft_isdigit:
	mov rsi, 0			; set initial return value to false
	cmp rdi, 0x30		; make sure parameter is over lower end
	jl done				; if not, tell it to f*ck off
	cmp rdi, 0x39		; now compare with higher end
	jle itsdigitmate	; ayy m89 it's a digit
	jmp done			; we wish the finction a good day

done:
	ret					; cya
