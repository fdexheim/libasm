# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_min.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/08 11:11:02 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/08 11:11:36 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_min

section .text

otherone:
	mov rax, rsi
	ret

_ft_min:
	mov rax, rdi
	cmp rdi, rsi
	ja otherone
	ret
