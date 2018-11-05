# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcat.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 11:00:27 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/05 11:31:43 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strcat

addend:
	inc rdi
	mov byte[rdi], 0
	jmp end

copy:
	mov al, byte[rsi]
	mov byte[rdi], al
	inc rdi
	inc rsi
	cmp byte[rsi], 0
	jne copy
	jmp addend

advance:
	inc rdi
	cmp byte[rdi], 0
	jne advance
	jmp copy

end:
	pop rsi
	pop rdi
	mov rax, rdi
	ret

_ft_strcat:
	push rdi
	push rsi
	mov rax, rdi
	cmp byte[rsi], 0
	je end
	cmp byte[rdi], 0
	je copy
	jmp advance
