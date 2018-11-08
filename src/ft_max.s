# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_max.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/08 11:05:09 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/08 11:10:44 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_max

section .text

otherone:
	mov rax, rsi
	ret

_ft_max:
	mov rax, rdi
	cmp rdi, rsi
	jb otherone
	ret
