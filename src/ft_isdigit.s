# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isdigit.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/22 15:04:57 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/01 10:10:23 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_isdigit

itsdigitmate:
	mov rax, 1			;we set return value to 1 (true)
	jmp done

_ft_isdigit:
	mov rax, 0			; set initial return value to false
	cmp rdi, 0x30		; make sure parameter is over lower end
	jl done				; if not, tell it to f*ck off
	cmp rdi, 0x39		; now compare with higher end
	jle itsdigitmate	; ayy m89 it's a digit
	jmp done			; we wish the finction a good day

done:
	ret					; cya
