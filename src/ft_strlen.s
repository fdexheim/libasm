# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/30 09:55:01 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/30 14:03:49 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text

global _ft_strlen
global count
global end

count:
	rep ; something
	jmp end

end:
	mov rax, rdi
	pop rdx
	pop rsi
	pop rdi
	ret

_ft_strlen:
	push rdi
	push rsi
	push rdx
	mov rdx, rdi
	mov rdi, 0
	jmp count
