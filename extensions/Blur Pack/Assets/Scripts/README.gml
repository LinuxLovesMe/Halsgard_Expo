/*
To apply the effects writes in POST DRAW event.

CAUTION!!.  You can set the blur iterations for change the blur quality,
            but higher values ​​reduce performance.

FUNCTIONS ====================================================================================================

gfx_blur(surface, iterations, size, bokeh);

    ARGUMENT            DESCRIPTION
    surface             the surface for blur.
    iterations          more iterations = more quality = less performance. recommended from 1 to 3.
    size                blur size in pixels.
    bokeh               intensifies the high tones (CAUTION!!, requires more performance).

    return: N/A

gfx_blur_directional(surface, iterations, centered, direction, size);

    ARGUMENT            DESCRIPTION
    surface             the surface for blur.
    iterations          more iterations = more quality = less performance. recommended from 1 to 4.
    centered            uses each pixel as the center of the blur (true - false).
    direction           blur direction in degrees.
    size                blur size in pixels.

    return: N/A

gfx_blur_gaussian(surface, iterations, radius, bokeh);

    ARGUMENT            DESCRIPTION
    surface             the surface for blur.
    iterations          more iterations = more quality = less performance. recommended from 1 to 4.
    radius              blur radius in pixels.
    bokeh               intensifies the high tones (CAUTION!!, requires more performance).

    return: N/A

gfx_blur_masked(surface, tex_mask, iterations, radius, bokeh, invert);

    ARGUMENT            DESCRIPTION
    surface             the surface for blur.
    tex_mask
    iterations          more iterations = more quality = less performance. recommended from 1 to 3.
    radius              blur radius in pixels
    bokeh               intensifies the high tones (CAUTION!!, requires more performance).
    invert

    return: N/A

gfx_blur_radial(surface, iterations, x, y, centered, radius);

    ARGUMENT            DESCRIPTION
    surface             the surface for blur.
    iterations          more iterations = more quality = less performance. recommended from 1 to 4.
    x                   the x position of the blur.
    y                   the y position of the blur.
    centered            uses each pixel as the center of the blur (true - false).
    radius              blur radius in pixels.

    return: N/A

gfx_blur_twist(surface, iterations, x, y, angle);

    ARGUMENT            DESCRIPTION
    surface             the surface for blur.
    iterations          more iterations = more quality = less performance. recommended from 1 to 4.
    x                   the x position of the blur.
    y                   the y position of the blur.
    angle               blur angle in degrees.
    
    return: N/A
*/
