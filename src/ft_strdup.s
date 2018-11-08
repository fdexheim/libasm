# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/31 13:29:53 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/08 14:38:02 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	extern _ft_strlen
	extern _ft_memcpy
	extern _malloc
	global _ft_strdup

epilogue:
	pop rdx
	pop rsi
	pop rdi
	ret

badmem:
	mov rax, 0
	jmp epilogue

_ft_strdup:
	push rdi
	push rsi
	push rdx

getlen:
	call _ft_strlen
	mov rsi, rdi
	mov rdx, rax
	mov rdi, rax

allocate:
	inc rdi						; for the terminal 0 in the allocated string
	push rdi
	call _malloc
	pop rdi
	cmp rax, 0
	je badmem
	mov byte[rax + rdx + 1], 0

copy:
	mov rdi, rax
	call _ft_memcpy
	jmp epilogue
