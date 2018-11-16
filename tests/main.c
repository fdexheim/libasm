/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/10/31 14:59:48 by fdexheim          #+#    #+#             */
/*   Updated: 2018/11/16 08:37:18 by fdexheim         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/libftasm.h"
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

//------------------------------------------------------------------------------
static size_t		strlen_ghetto(const char *str)
{
	size_t			ret;

	ret = 0;
	if (str == NULL)
		return (0);
	while (*str)
	{
		ret++;
		str++;
	}
	return (ret);
}

//------------------------------------------------------------------------------
void				putstr_ghetto(const char *str)
{
	if (str == NULL)
	{
		write(1, "(null)", 6);
		return ;
	}
	write(1, str, strlen_ghetto(str));
}

//------------------------------------------------------------------------------
void				putnbr_ghetto(int n)
{
	char			c;

	c = 0;
	if (n == -2147483648)
	{
		putstr_ghetto("-2147483648");
		return ;
	}
	if (n < 0)
	{
		n = -n;
		write(1, "-", 1);
	}
	if (n >= 10)
	{
		putnbr_ghetto(n / 10);
	}
	c = n % 10 + '0';
	write(1, &c, 1);
}

//------------------------------------------------------------------------------
void				put_unsigned_char_ghetto_hex(const unsigned char c)
{
	const char		hexa[] = "0123456789abcdef";
	unsigned char	ol;

	if (c <= 0xf)
	{
		write(1, "0", 1);
		ol = hexa[c % 16];
		write(1, &ol, 1);
	}
	else
	{
		ol = hexa[c / 16];
		write(1, &ol, 1);
		ol = hexa[c % 16];
		write(1, &ol, 1);
	}
}

//------------------------------------------------------------------------------
void				put_size_t_ghetto(const size_t src)
{
	char			c;

	if (src >= 10)
		put_size_t_ghetto(src / 10);
	c = src % 10 + '0';
	write(1, &c, 1);
}

//------------------------------------------------------------------------------
void				dumpmem(void *ptr, size_t len)
{
	size_t			i;
	unsigned char	*topkek;

	i = 0;
	while (i < len)
	{
		topkek = ptr;
		put_unsigned_char_ghetto_hex(*topkek);
		write(1, " ", 1);
		ptr++;
		i++;
	}
}

//==============================================================================
int					main(void)
{
	const char		*empty_string = "";
	const char		*short_string = "42";
	const char		*medium_string = "You there ! Let me bend your ear for a moment !";
	const char		*long_string = "\nDo you know where the duelist tradition came from, exile?\n\nThe Ezomytes.\n\nEarly on, those western potato munchers worked out that war was a pretty bloody stupid idea. At least the wholesale slaughter side of it. So they fashioned themselves a tradition of Championship.\n\nHere's how an Ezomyte battle would go. Both sides get dressed up in their fiercest and finest war garb. They'd all prance about, banging drums and flinging curses at each other. Then, when everyone was het up enough, a few chosen lads or lasses would step forward and fight it out...to the death usually.\n\nThe point of it all? My champions win, and I get to have that fish-filled estuary on my border. Your champions win, and I hand over a few hundred cows. Deal done, and most of us get to go home.\n\nThe Eternals pinched the idea from the Ezomytes, and the Oriathans pinched the idea from the Eternals.\n";

	char			receptacle[4096]; // buffer for testing purposes
	char			receptacle2[4096]; // buffer for testing purposes
	bzero(receptacle, 4096);
	bzero(receptacle2, 4096);

	putstr_ghetto("\n-------------------- TEST ft_isalpha --------------------\n");
	putstr_ghetto("Return values\nTest 1 | 'a' | ");
	putnbr_ghetto(ft_isalpha('a'));
	putstr_ghetto("\nTest 2 | 'z' | ");
	putnbr_ghetto(ft_isalpha('z'));
	putstr_ghetto("\nTest 3 | 'A' | ");
	putnbr_ghetto(ft_isalpha('A'));
	putstr_ghetto("\nTest 4 | 'Z' | ");
	putnbr_ghetto(ft_isalpha('Z'));
	putstr_ghetto("\nTest 5 | '[' | ");
	putnbr_ghetto(ft_isalpha('['));

	putstr_ghetto("\n\n[press ENTER to continue]\n");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_isdigit --------------------\n");
	putstr_ghetto("Return values\nTest 1 | '0' | ");
	putnbr_ghetto(ft_isdigit('0'));
	putstr_ghetto("\nTest 2 | '9' | ");
	putnbr_ghetto(ft_isdigit('9'));
	putstr_ghetto("\nTest 3 | 'A' | ");
	putnbr_ghetto(ft_isdigit('A'));
	putstr_ghetto("\nTest 3 | ':' | ");
	putnbr_ghetto(ft_isdigit(':'));

	putstr_ghetto("\n\n[press ENTER to continue]");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_isalnum --------------------\n");
	putstr_ghetto("Return values\nTest 1 | '0' | ");
	putnbr_ghetto(ft_isalnum('0'));
	putstr_ghetto("\nTest 2 | '9' | ");
	putnbr_ghetto(ft_isalnum('9'));
	putstr_ghetto("\nTest 3 | 'A' | ");
	putnbr_ghetto(ft_isalnum('A'));
	putstr_ghetto("\nTest 4 | ':' | ");
	putnbr_ghetto(ft_isalnum(':'));

	putstr_ghetto("\n\n[press ENTER to continue]");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_isascii --------------------\n");
	putstr_ghetto("Return values\nTest 1 | '0'   | ");
	putnbr_ghetto(ft_isascii('0'));
	putstr_ghetto("\nTest 2 | 'del' | ");
	putnbr_ghetto(ft_isascii(0x7f));
	putstr_ghetto("\nTest 2 | 2049  | ");
	putnbr_ghetto(ft_isascii(2049));
	
	putstr_ghetto("\n\n[press ENTER to continue]");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_isprint --------------------\n");
	putstr_ghetto("Return values\nTest 1 | '0'   | ");
	putnbr_ghetto(ft_isprint('0'));
	putstr_ghetto("\nTest 2 | 'del' | ");
	putnbr_ghetto(ft_isprint(0x7f));
	putstr_ghetto("\nTest 2 | 2049  | ");
	putnbr_ghetto(ft_isprint(2049));

	putstr_ghetto("\n\n[press ENTER to continue]");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_toupper --------------------\n");
	putstr_ghetto("Return values\nTest 1 | '0'   | ");
	putnbr_ghetto(ft_toupper('0'));
	putstr_ghetto("\nTest 2 | 2049  | ");
	putnbr_ghetto(ft_toupper(2049));
	putstr_ghetto("\nTest 3 | 'F'   | ");
	putnbr_ghetto(ft_toupper('F'));
	putstr_ghetto("\nTest 4 | 'g'   | ");
	putnbr_ghetto(ft_toupper('g'));

	putstr_ghetto("\n\n[press ENTER to continue]");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_tolower --------------------\n");
	putstr_ghetto("Return values\nTest 1 | '0'   | ");
	putnbr_ghetto(ft_tolower('0'));
	putstr_ghetto("\nTest 2 | 2049  | ");
	putnbr_ghetto(ft_tolower(2049));
	putstr_ghetto("\nTest 3 | 'F'   | ");
	putnbr_ghetto(ft_tolower('F'));
	putstr_ghetto("\nTest 4 | 'g'   | ");
	putnbr_ghetto(ft_tolower('g'));

	putstr_ghetto("\n\n[press ENTER to continue]");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_strcat --------------------\n");
	putstr_ghetto("Short_string = \"");
	putstr_ghetto(short_string);
	putstr_ghetto("\"\nMedium_string = \"");
	putstr_ghetto(medium_string);
	putstr_ghetto("\"\nEmpty string into empty buffer  | ");
	ft_strcat(receptacle, empty_string);
	putstr_ghetto(receptacle);
	putstr_ghetto("\nMedium string into empty buffer | ");
	ft_strcat(receptacle, medium_string);
	putstr_ghetto(receptacle);
	putstr_ghetto("\nShort string into same buffer   | ");
	ft_strcat(receptacle, short_string);
	putstr_ghetto(receptacle);
	putstr_ghetto("\nEmpty string in same buffer     | ");
	ft_strcat(receptacle, empty_string);
	putstr_ghetto(receptacle);

	putstr_ghetto("\n\n[press ENTER to continue]");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_bzero --------------------\n");
	putstr_ghetto("[buffer reference]\n");
	dumpmem(receptacle, 20);
	ft_bzero(receptacle, 0);
	putstr_ghetto("\n\n[first 20 bytes of buffer after bzero of size 0 at start of buffer...]\n");
	dumpmem(receptacle, 20);
	ft_bzero(receptacle, 5);
	putstr_ghetto("\n\n[first 20 bytes of buffer after bzero of size 5 at start of buffer...]\n");
	dumpmem(receptacle, 20);

	putstr_ghetto("\n\n[press ENTER to continue]");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_puts --------------------\n");
	putstr_ghetto("[empty string]\n");
	ft_puts(empty_string);
	putstr_ghetto("[short string]\n");
	ft_puts(short_string);
	putstr_ghetto("[medium string]\n");
	ft_puts(medium_string);
	putstr_ghetto("[long string]\n");
	ft_puts(long_string);
	putstr_ghetto("[NULL string]\n");
	ft_puts(NULL);

	putstr_ghetto("\n\n[press ENTER to continue]");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_strlen --------------------\n");
	putstr_ghetto("Return values\nTest 1 | empty string  | ");
	putnbr_ghetto(ft_strlen(empty_string));
	putstr_ghetto("\nTest 2 | short string  | ");
	putnbr_ghetto(ft_strlen(short_string));
	putstr_ghetto("\nTest 2 | medium string | ");
	putnbr_ghetto(ft_strlen(medium_string));
	putstr_ghetto("\nTest 2 | long string   | ");
	putnbr_ghetto(ft_strlen(long_string));

	putstr_ghetto("\n\n[press ENTER to continue]");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_memset --------------------\n");
	putstr_ghetto("Remember our good friend [buffer reference] ? Well guess what he's back\n");
	dumpmem(receptacle, 20);
	ft_memset(receptacle, 42, 0);
	putstr_ghetto("\n\n[first 20 bytes of buffer after memset value 42 of size 0 at start of buffer...]\n");
	dumpmem(receptacle, 20);
	ft_memset(receptacle, 42, 10);
	putstr_ghetto("\n\n[first 20 bytes of buffer after memset value 42 of size 10 at start of buffer...]\n");
	dumpmem(receptacle, 20);

	putstr_ghetto("\n\n[press ENTER to continue]");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_memcpy --------------------\n");
	putstr_ghetto("To dispence some righteous justice, [buffer reference] brought his sidekick [buffer2] !\n");
	dumpmem(receptacle2, 20);
	putstr_ghetto("\n\n[first 20 bytes of buffer2 after memcpy of size 0]\n");
	ft_memcpy(receptacle2, receptacle, 0);
	dumpmem(receptacle2, 20);
	putstr_ghetto("\n\n[first 20 bytes of buffer2 after memcpy of size 15]\n");
	ft_memcpy(receptacle2, receptacle, 15);
	dumpmem(receptacle2, 20);

	putstr_ghetto("\n\n[press ENTER to continue]");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_strdup --------------------\n");

	char			*dup_empty;
	char			*dup_short;
	char			*dup_medium;
	char			*dup_long;

	putstr_ghetto("duplicated empty_string  | ");
	dup_empty = ft_strdup(empty_string);
	put_size_t_ghetto((size_t)dup_empty);
	putstr_ghetto("\n");
	putstr_ghetto(dup_empty);

	putstr_ghetto("\nduplicated short_string  | ");
	dup_short = ft_strdup(short_string);
	put_size_t_ghetto((size_t)dup_short);
	putstr_ghetto("\n");
	putstr_ghetto(dup_short);

	putstr_ghetto("\nduplicated medium_string | ");
	dup_medium = ft_strdup(medium_string);
	put_size_t_ghetto((size_t)dup_medium);
	putstr_ghetto("\n");
	putstr_ghetto(dup_medium);

	putstr_ghetto("\nduplicated long_string   | ");
	dup_long = ft_strdup(long_string);
	put_size_t_ghetto((size_t)dup_long);
	putstr_ghetto("\n");
	putstr_ghetto(dup_long);

	free(dup_empty);
	free(dup_short);
	free(dup_medium);
	free(dup_long);

	putstr_ghetto("\n\n[press ENTER to continue]");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_cat --------------------\n");

	int fd;

	putstr_ghetto("opening fd for file ./tests/main.c...\n");
	fd = open("./tests/main.c", O_RDONLY);
	putstr_ghetto("calling ft_cat...\nfd = ");
	put_size_t_ghetto(fd);
	putstr_ghetto("\n[wall of text warning. no seriously get an umbrella]\n");
	getchar();
	ft_cat(fd);
	putstr_ghetto("closing fd...\n");
	close(fd);
	
	putstr_ghetto("\nopening fd for file ./auteur...\n");
	fd = open("./auteur", O_RDONLY);
	put_size_t_ghetto(fd);
	putstr_ghetto("\n");
	ft_cat(fd);
	putstr_ghetto("closing fd...\n");
	close(fd);

	putstr_ghetto("\nopening fd for file ./tests/fichier_vide...\n");
	fd = open("./tests/fichier_vide", O_RDONLY);
	put_size_t_ghetto(fd);
	putstr_ghetto("\n");
	ft_cat(fd);
	putstr_ghetto("closing fd...\n");
	close(fd);


	putstr_ghetto("\nft_cat fd = 0\n"); // stdin
	ft_cat(0);
	putstr_ghetto("\nft_cat fd = 1\n"); // stdout
	ft_cat(1);
	putstr_ghetto("\nft_cat fd = 2\n"); // stderr
	ft_cat(2);

	putstr_ghetto("\nft_cat fd = -1\n");
	ft_cat(-1);

	putstr_ghetto("closed fd\b");
	ft_cat(fd);

	putstr_ghetto("\n==================== BONUS ==========================\n");
	putstr_ghetto("press ENTER to tests bonus functions");
	getchar();

	putstr_ghetto("\n-------------------- TEST ft_islower --------------------\n");
	putstr_ghetto("Return values\nTest 1 | 'a' | ");
	putnbr_ghetto(ft_islower('a'));
	putstr_ghetto("\nTest 2 | 'z' | ");
	putnbr_ghetto(ft_islower('z'));
	putstr_ghetto("\nTest 3 | 'A' | ");
	putnbr_ghetto(ft_islower('A'));
	putstr_ghetto("\nTest 4 | 'Z' | ");
	putnbr_ghetto(ft_islower('Z'));
	putstr_ghetto("\nTest 5 | '3' | ");
	putnbr_ghetto(ft_islower('3'));
	putstr_ghetto("\nTest 6 | '[' | ");
	putnbr_ghetto(ft_islower('['));

	putstr_ghetto("\n-------------------- TEST ft_isupper --------------------\n");
	putstr_ghetto("Return values\nTest 1 | 'a' | ");
	putnbr_ghetto(ft_isupper('a'));
	putstr_ghetto("\nTest 2 | 'z' | ");
	putnbr_ghetto(ft_isupper('z'));
	putstr_ghetto("\nTest 3 | 'A' | ");
	putnbr_ghetto(ft_isupper('A'));
	putstr_ghetto("\nTest 4 | 'Z' | ");
	putnbr_ghetto(ft_isupper('Z'));
	putstr_ghetto("\nTest 5 | '3' | ");
	putnbr_ghetto(ft_isupper('3'));
	putstr_ghetto("\nTest 6 | '[' | ");
	putnbr_ghetto(ft_isupper('['));

	putstr_ghetto("\n-------------------- TEST ft_min --------------------\n");
	putstr_ghetto("Return values\nTest 1 | 2049 | 1 | ");
	putnbr_ghetto(ft_min(2049, 1));
	putstr_ghetto("\nTest 2 | 1 | 2049 | ");
	putnbr_ghetto(ft_min(1, 2049));
	putstr_ghetto("\nTest 3 | 2049 | 2049 | ");
	putnbr_ghetto(ft_min(2049, 2049));
	putstr_ghetto("\nTest 4 | 0 | 2077 | ");
	putnbr_ghetto(ft_min(0, 2077));
	putstr_ghetto("\nTest 5 | -1 | 1 | ");
	putnbr_ghetto(ft_min(-1, 1));

	putstr_ghetto("\n-------------------- TEST ft_max --------------------\n");
	putstr_ghetto("Return values\nTest 1 | 2049 | 1 | ");
	putnbr_ghetto(ft_max(2049, 1));
	putstr_ghetto("\nTest 2 | 1 | 2049 | ");
	putnbr_ghetto(ft_max(1, 2049));
	putstr_ghetto("\nTest 3 | 2049 | 2049 | ");
	putnbr_ghetto(ft_max(2049, 2049));
	putstr_ghetto("\nTest 4 | 0 | 2077 | ");
	putnbr_ghetto(ft_max(0, 2077));
	putstr_ghetto("\nTest 5 | -1 | 1 | ");
	putnbr_ghetto(ft_max(-1, 1));

	putstr_ghetto("\n-------------------- TEST ft_min_s --------------------\n");
	putstr_ghetto("Return values\nTest 1 | 2049 | 1 | ");
	putnbr_ghetto(ft_min_s(2049, 1));
	putstr_ghetto("\nTest 2 | 1 | 2049 | ");
	putnbr_ghetto(ft_min_s(1, 2049));
	putstr_ghetto("\nTest 3 | 2049 | 2049 | ");
	putnbr_ghetto(ft_min_s(2049, 2049));
	putstr_ghetto("\nTest 4 | 0 | 2077 | ");
	putnbr_ghetto(ft_min_s(0, 2077));
	putstr_ghetto("\nTest 5 | -1 | 1 | ");
	putnbr_ghetto(ft_min_s(-1, 1));

	putstr_ghetto("\n-------------------- TEST ft_max_s --------------------\n");
	putstr_ghetto("Return values\nTest 1 | 2049 | 1 | ");
	putnbr_ghetto(ft_max_s(2049, 1));
	putstr_ghetto("\nTest 2 | 1 | 2049 | ");
	putnbr_ghetto(ft_max_s(1, 2049));
	putstr_ghetto("\nTest 3 | 2049 | 2049 | ");
	putnbr_ghetto(ft_max_s(2049, 2049));
	putstr_ghetto("\nTest 4 | 0 | 2077 | ");
	putnbr_ghetto(ft_max_s(0, 2077));
	putstr_ghetto("\nTest 5 | -1 | 1 | ");
	putnbr_ghetto(ft_max_s(-1, 1));


	return 0;
}
