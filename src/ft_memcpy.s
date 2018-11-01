# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/31 11:23:39 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/01 10:10:33 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_memcpy

_ft_memcpy:
	push rax
	push rdi
	push rsi
	push rcx

	mov rcx, rdx
	rep movsb

	pop rcx
	pop rsi
	pop rdi
	pop rax
