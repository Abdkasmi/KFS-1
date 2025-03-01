#include <stddef.h>

size_t strlen(const char* str)
{
	size_t len = 0;
	while (str[len])
		len++;
	return len;
}

size_t	strcmp(const char *s1, const char *s2)
{
	size_t	i = 0;

	while (s1[i] != '\0' || s2[i] != '\0')
	{
		if (s1[i] != s2[i])
			return (s1[i] - s2[i]);
		i++;
	}
	return (s1[i] - s2[i]);
}

void	strncpy(const char *dest, const char *src, size_t size)
{
	size_t	i;

	i = -1;
	while (++i < size)
		dest[i] = src[i];
}

void kernel_main() {
    volatile unsigned char *video_memory = (unsigned char *)0xB8000; // Video memory address
    video_memory[0] = '4'; // Write '4' to the screen
    video_memory[1] = 0x07; // Light gray on black background
    video_memory[2] = '2'; // Write '2' to the screen
    video_memory[3] = 0x07; // Light gray on black background
}
