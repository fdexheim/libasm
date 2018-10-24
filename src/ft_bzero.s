# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_bzero.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/17 12:31:50 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/24 15:32:20 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_bzero

_ft_bzero:
	mov rdx, 0 ;				set counter to 0
	mov byte[rdi + rdx], 0 ;	set address value to 0
	inc rdx ;					inc address
	cmp rsi, rdx ;				compare counter with size
	jne _ft_bzero ;				brother do you have some loops
	ret
