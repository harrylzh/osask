/*
 *  kernel.c
 */
char *vidptr = (char *)0xb8000; // video mem begins here.显存开始地址

enum vga_color {
	VGA_COLOR_BLACK = 0,
	VGA_COLOR_BLUE = 1,
	VGA_COLOR_GREEN = 2,
	VGA_COLOR_CYAN = 3,
	VGA_COLOR_RED = 4,
	VGA_COLOR_MAGENTA = 5,
	VGA_COLOR_BROWN = 6,
	VGA_COLOR_LIGHT_GREY = 7,
	VGA_COLOR_DARK_GREY = 8,
	VGA_COLOR_LIGHT_BLUE = 9,
	VGA_COLOR_LIGHT_GREEN = 10,
	VGA_COLOR_LIGHT_CYAN = 11,
	VGA_COLOR_LIGHT_RED = 12,
	VGA_COLOR_LIGHT_MAGENTA = 13,
	VGA_COLOR_LIGHT_BROWN = 14,
	VGA_COLOR_WHITE = 15,
};

void screen_clear();            // header

void screen_clear()
{ // body
    unsigned int j = 0;
    while (j < 80 * 25 * 2)
    {
        /* blank character */
        vidptr[j] = ' ';
        /* attribute-byte - light grey on black screen */
        vidptr[j + 1] = 0x07;//color
        vidptr[j + 1] = 0x07;//color
        j = j + 2;
    }
}
void kmain(void)
{
    const char *str = "my first kernel,hello world function";

    unsigned int i = 0;
    unsigned int j = 0;

    /* this loops clears the screen将显存设置为空
     * there are 25 lines each of 80 columns; each element takes 2 bytes */
    // while (j < 80 * 25 * 2)
    // {
    //     /* blank character */
    //     vidptr[j] = ' ';
    //     /* attribute-byte - light grey on black screen */
    //     vidptr[j + 1] = 0x07;
    //     j = j + 2;
    // }
    screen_clear();

    j = 0;

    /* this loop writes the string to video memory */
    while (str[j] != '\0')
    {
        /* the character's ascii */
        vidptr[i] = str[j];
        /* attribute-byte: give character black bg and light grey fg */
        vidptr[i + 1] = 0x07;
        ++j;
        i = i + 2;
    }
    return;
}