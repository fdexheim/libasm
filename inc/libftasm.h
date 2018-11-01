/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libftasm.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/10/26 10:07:22 by fdexheim          #+#    #+#             */
/*   Updated: 2018/11/01 10:54:44 by fdexheim         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTASM_H
# define LIBFTASM_H

#include <stddef.h>

void		ft_bzero(void *s, size_t n);
int			ft_isalnum(int c);
int			ft_isalpha(int c);
int			ft_isascii(int c);
int			ft_isdigit(int c);
int			ft_islower(int c);
int			ft_isprint(int c);
int			ft_isupper(int c);
void		*ft_memcpy(void *dst, const void *src, size_t n);
void		*ft_memset(void *b, int c, size_t len);
int			ft_puts(const char *s);
char		*ft_strcat(const char *s1, const char *s2, size_t n);
char		*ft_strdup(const char *s1);
size_t		ft_strlen(const char *s);
int			ft_tolower(int c);
int			ft_toupper(int c);

#endif
