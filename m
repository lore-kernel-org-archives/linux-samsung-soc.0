From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH 3/3] ARM: Exynos: Rework platform data for lcd controller
 for Origen board
Date: Tue, 06 Mar 2012 16:32:46 +0900
Message-ID: <002601ccfb6b$536bfc00$fa43f400$%han@samsung.com>
References: <1330789808-8253-1-git-send-email-thomas.abraham@linaro.org>
 <1330789808-8253-4-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:38538 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757881Ab2CFHcs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Mar 2012 02:32:48 -0500
In-reply-to: <1330789808-8253-4-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-fbdev@vger.kernel.org
Cc: FlorianSchandinat@gmx.de, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, patches@linaro.org, 'Jingoo Han' <jg1.han@samsung.com>

> -----Original Message-----
> From: Thomas Abraham [mailto:thomas.abraham@linaro.org]
> Sent: Sunday, March 04, 2012 12:50 AM
> To: linux-fbdev@vger.kernel.org
> Cc: FlorianSchandinat@gmx.de; linux-samsung-soc@vger.kernel.org; kgene.kim@samsung.com;
> jg1.han@samsung.com; ben-linux@fluff.org; patches@linaro.org
> Subject: [PATCH 3/3] ARM: Exynos: Rework platform data for lcd controller for Origen board
> 
> The 'default_win' element in the platform data is removed and the lcd panel
> video timing values are moved out of individual window configuration data.
> 
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Jingoo Han <jg1.han@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

It looks good.

Acked-by: Jingoo Han <jg1.han@samsung.com>

> ---
>  arch/arm/mach-exynos/mach-origen.c |   24 ++++++++++++++----------
>  1 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
> index f57aed4..dc4ecc3 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -583,22 +583,26 @@ static struct platform_device origen_lcd_hv070wsa = {
>  };
> 
>  static struct s3c_fb_pd_win origen_fb_win0 = {
> -	.win_mode = {
> -		.left_margin	= 64,
> -		.right_margin	= 16,
> -		.upper_margin	= 64,
> -		.lower_margin	= 16,
> -		.hsync_len	= 48,
> -		.vsync_len	= 3,
> -		.xres		= 1024,
> -		.yres		= 600,
> -	},
> +	.xres			= 512,
> +	.yres			= 300,
>  	.max_bpp		= 32,
>  	.default_bpp		= 24,
>  };
> 
> +static struct fb_videomode lcd_hv070wsa_timing = {
> +	.left_margin	= 64,
> +	.right_margin	= 16,
> +	.upper_margin	= 64,
> +	.lower_margin	= 16,
> +	.hsync_len	= 48,
> +	.vsync_len	= 3,
> +	.xres		= 1024,
> +	.yres		= 600,
> +};
> +
>  static struct s3c_fb_platdata origen_lcd_pdata __initdata = {
>  	.win[0]		= &origen_fb_win0,
> +	.vtiming	= &lcd_hv070wsa_timing,
>  	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB,
>  	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC |
>  				VIDCON1_INV_VCLK,
> --
> 1.6.6.rc2
