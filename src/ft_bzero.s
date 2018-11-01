# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_bzero.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/17 12:31:50 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/01 10:09:44 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_bzero

end:
	pop rdi
	pop rdx
	ret

_ft_bzero:
	push rdx
	push rdi
	mov rdx, 0 ;			set counter to 0

loop:
	mov byte[rdi], 0 ;		set address value to 0
	inc rdx ;				inc address
	inc rdi
	cmp rsi, rdx ;			compare counter with size
	jne loop ;				brother do you have some loops
	jmp end
