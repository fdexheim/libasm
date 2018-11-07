# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memset.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/31 09:59:44 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/07 10:58:04 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_memset

_ft_memset:
	push rax
	push rdi
	push rsi
	push rdx

	mov rcx, rdx
	xor rax, rax
	mov rax, rsi
	and rax, 0xff
	rep stosb

	pop rdx
	pop rsi
	pop rdi
	pop rax

	mov rax, rdi
	ret
