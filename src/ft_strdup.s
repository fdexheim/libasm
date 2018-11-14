# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/31 13:29:53 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/14 12:45:40 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	extern _ft_strlen ; size_t		ft_strlen(const char *s);
	extern _ft_memcpy ; void		*ft_memcpy(void *dst, void *src, size_t n);
	extern _malloc ; void			*malloc(size_t size);
	global _ft_strdup ; char		*strdup(const char *s1);

badmem:
	pop rdx
	pop rsi

badaddress:
	mov rax, 0

epilogue:
	leave
	ret

_ft_strdup:
	enter 0, 0
	cmp rdi, 0 ;					naughty naughty user
	je badaddress

	;get lengh for new string:
	push rdi ;						saving address of src
	call _ft_strlen
	mov rdi, rax
	push rax ;						saving lengh returned by strlen

	;allocate memory
	inc rdi ;						for the terminal 0 in the allocated string
	xor rax, rax
	push rdi
	push rsi ;						for allignment, we don't care about what's in rsi
	call _malloc
	pop rsi ;						see above
	pop rdi
	cmp rax, 0 ;					did malloc fuckup ?
	je badmem
	mov byte[rax + rdi - 1], 0
	mov rdi, rax

copy:
	; copy data from str1 to str 2
	pop rdx ;						size argument from pushed rax
	pop rsi ;						address of src from pushed rdi
	call _ft_memcpy
	jmp epilogue
