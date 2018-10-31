# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/31 13:29:53 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/31 15:33:34 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	extern _ft_strlen
	extern _ft_memcpy
	extern malloc
	global _ft_strdup
	global badmem
	global epilogue

epilogue:
	ret

badmem:
	mov rax, 0
	ret

_ft_strdup:
	call _ft_strlen

	mov rsi, rdi
	mov rdx, rax
	mov rdi, rax

	inc rdi						; for the terminal 0 in the allocated string
	call malloc
	cmp rax, 0
	je badmem
	mov byte[rax + rdx + 1], 0
	mov rdi, rax
	call _ft_memcpy
	jmp epilogue
