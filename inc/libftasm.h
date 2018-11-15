/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libftasm.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/10/26 10:07:22 by fdexheim          #+#    #+#             */
/*   Updated: 2018/11/15 14:00:18 by fdexheim         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTASM_H
# define LIBFTASM_H

#include <stddef.h>

void		ft_bzero(void *s, size_t n);
void		ft_cat(int fd);
int			ft_isalnum(int c);
int			ft_isalpha(int c);
int			ft_isascii(int c);
int			ft_isdigit(int c);
int			ft_islower(int c);
int			ft_isprint(int c);
int			ft_isupper(int c);
int			ft_max(unsigned int i, unsigned int j);
int			ft_max_s(int i, int j);
void		*ft_memcpy(void *dst, const void *src, size_t n);
void		*ft_memset(void *b, int c, size_t len);
int			ft_min(unsigned int i, unsigned int j);
int			ft_min_s(int i, int j);
void		ft_putaddr(size_t addr);
int			ft_puts(const char *s);
char		*ft_strcat(const char *s1, const char *s2);
char		*ft_strdup(const char *s1);
size_t		ft_strlen(const char *s);
int			ft_tolower(int c);
int			ft_toupper(int c);

#endif
