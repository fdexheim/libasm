# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memset.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/31 09:59:44 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/31 15:32:48 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_memset

_ft_memset:
	push rax
	push r8
	push rdi

	mov rcx, rsi
	mov r8, rsi
	and r8, 0xff
	mov rax, r8
	rep lodsb

	pop rdi
	pop r8
	pop rax
