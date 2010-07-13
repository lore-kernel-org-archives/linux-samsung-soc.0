From: yiffie9819 <yiffie9819@gmail.com>
Subject: Re: [PATCH v2] s3c-fb: Automatically calculate pixel clock when none
 is given
Date: Tue, 13 Jul 2010 12:14:49 +0900
Message-ID: <4C3BDA29.1030205@gmail.com>
References: <4c3baddb.d37b0e0a.67e4.ffffcb55@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15030 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752681Ab0GMDOv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jul 2010 23:14:51 -0400
In-reply-to: <4c3baddb.d37b0e0a.67e4.ffffcb55@mx.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, akpm@linux-foundation.org, ben-linux@fluff.org

 I tested this patch by using s5pv210.
It is verified by linux-2.6.32.
The result of test is the same pixel clock as before applying patch.

Tested-by: Donghwa Lee <yiffie9819@gmail.com>


2010/7/13 Maurus Cuelenaere <mcuelenaere@gmail.com>
> This patch adds a simple algorithm which calculates the pixel clock based on the
> video mode parameters. This is only done when no pixel clock is supplied through
> the platform data.
>
> Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
> ---
>
> Changes since v1:
> Re-posted this to the correct fbdev mailing list.
>
> ---
>  drivers/video/s3c-fb.c |   25 +++++++++++++++++++++++++
>  1 files changed, 25 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
> index 9682ecc..e4715eb 100644
> --- a/drivers/video/s3c-fb.c
> +++ b/drivers/video/s3c-fb.c
> @@ -654,6 +654,28 @@ static struct fb_ops s3c_fb_ops = {
>  };
>  
>  /**
> + * s3c_fb_missing_pixclock() - calculates pixel clock
> + * @mode: The video mode to change.
> + *
> + * Calculate the pixel clock when none has been given through platform data.
> + */
> +static void __devinit s3c_fb_missing_pixclock(struct fb_videomode *mode)
> +{
> +	u64 pixclk = 1000000000000ULL;
> +	u32 div;
> +
> +	div  = mode->left_margin + mode->hsync_len + mode->right_margin +
> +	       mode->xres;
> +	div *= mode->upper_margin + mode->vsync_len + mode->lower_margin +
> +	       mode->yres;
> +	div *= mode->refresh ? : 60;
> +
> +	do_div(pixclk, div);
> +
> +	mode->pixclock = pixclk;
> +}
> +
> +/**
>   * s3c_fb_alloc_memory() - allocate display memory for framebuffer window
>   * @sfb: The base resources for the hardware.
>   * @win: The window to initialise memory for.
> @@ -925,6 +947,9 @@ static int __devinit s3c_fb_probe(struct platform_device *pdev)
>  		if (!pd->win[win])
>  			continue;
>  
> +		if (!pd->win[win]->win_mode.pixclock)
> +			s3c_fb_missing_pixclock(&pd->win[win]->win_mode);
> +
>  		ret = s3c_fb_probe_win(sfb, win, &sfb->windows[win]);
>  		if (ret < 0) {
>  			dev_err(dev, "failed to create window %d\n", win);
