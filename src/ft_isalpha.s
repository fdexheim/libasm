# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalpha.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/24 10:39:13 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/05 09:45:17 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	extern _ft_islower
	extern _ft_isupper
	global _ft_isalpha

isalpha:
	mov rax, 1
	ret

_ft_isalpha:
	call _ft_islower
	cmp rax, 0				; is it not a lowercase
	jne isalpha
	call _ft_isupper		; is it not a uppercase
	cmp rax, 0
	jne isalpha
	ret
