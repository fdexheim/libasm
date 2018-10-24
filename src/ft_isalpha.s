# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalpha.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/24 10:39:13 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/24 15:32:01 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_isalpha
	global mightbelower
	global mightbeupper
	global isalphamate
	global end

_ft_isalpha:
	mov rsi, 0			; set initial return value to false
	cmp rdi, 0x61		; compare with minimum value of 'a' character
	jge mightbelower

isalphamate:
	mov rsi, 1			; setting return value to 1 (true)
	jmp end

mightbelower:
	cmp rdi, 0x7a		; 'z'
	jle isalphamate
	cmp rdi, 0x41		; compare with minimum value of 'A' character
	jge mightbeupper

mightbeupper:
	cmp rdi, 0x5a		; 'Z'
	jle isalphamate

end:
	ret
