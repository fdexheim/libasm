# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_cat.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/05 11:48:09 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/14 15:53:30 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

%define BUFFSIZE						1024
%define MACH_SYSCALL(nb)				0x2000000 | nb
%define READ							3 ; ssize_t read(int fildes, void *buf, size_t nbytes);
%define WRITE							4 ; ssize_t write(int fildes, const void *buf, size_t nbyte);
%define	STDOUT							1

extern _ft_puts ;						int			ft_puts(const char *s);
extern _ft_bzero ;						void		ft_bzero(void *s, size_t n);
global _ft_cat ;						void		ft_cat(int fd);

section .bss
	bufferino resb BUFFSIZE

section .text

_ft_cat:
	enter 0, 0

	cmp rdi, 0
	jl end

	push rdi
	mov rsi, BUFFSIZE
	lea rdi, [rel bufferino]
	call _ft_bzero
	pop rdi

	lea rsi, [rel bufferino]

loop:
	mov rax, MACH_SYSCALL(READ) ;		rdi should already be at the right place
	mov rdx, BUFFSIZE
	push rsi
	syscall
	pop rsi

	cmp rax, 0
	jle end

	push rdi
	push rsi

	mov rdx, rax ;						length returned by read in write parameter
	mov rax, MACH_SYSCALL(WRITE)
	mov rdi, STDOUT
	syscall ;							loosing a whole day because you forgot syscall hmmmm mnyieeees

	pop rsi
	pop rdi

	jmp loop ;							brother may i have some loops

end:
	leave
	ret
