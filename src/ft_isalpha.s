# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalpha.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/24 10:39:13 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/01 10:09:59 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	extern _ft_islower
	extern _ft_isupper
	global _ft_isalpha

notalpha:
	mov rax, 0
	ret

_ft_isalpha:
	call _ft_islower
	cmp rax, 0				; compare with minimum value of 'a' character
	jne notalpha
	call _ft_isupper
	cmp rax, 0
	jne notalpha
	mov rax, 1
	ret
