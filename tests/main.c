/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/10/31 14:59:48 by fdexheim          #+#    #+#             */
/*   Updated: 2018/11/08 13:48:51 by fdexheim         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/libftasm.h"
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

int			main()
{
	const char		*src1 = "";
	const char		*src2 = "42";
	const char		*src3 = "Absolute toppest keks of them all";
	char			*src3p;

	int i;
	i = ft_puts(src1);
//	printf("return src1 = %d\n", i);
	i = ft_puts(src2);
//	printf("return src2 = %d\n", i);
	i = ft_puts(src3);
//	printf("return src3 = %d\n", i);
	write(1, "topkek1\n", 8);
	src3p = (char *)malloc(20);
	write(1, "topkek2\n", 8);
	bzero((void *)src3p, 20);
	write(1, "topkek3\n", 8);
	ft_memcpy(src3p, src3, 15);
	write(1, "topkek4\n", 8);
	ft_puts(src3p);

	printf("%ld \n", ft_strlen(src1));
	printf("%ld \n", ft_strlen(src2));
	printf("%ld \n", ft_strlen(src3));

	return 0;
}
