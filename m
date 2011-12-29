From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] ARM: EXYNOS: Invert VCLK polarity for framebuffer on
 Origen board
Date: Thu, 29 Dec 2011 12:31:14 +0900
Message-ID: <028901ccc5da$51a211a0$f4e634e0$%kim@samsung.com>
References: <1322718611-20934-1-git-send-email-tushar.behera@linaro.org>
 <1322718611-20934-4-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10125 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751336Ab1L2DbQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 22:31:16 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWY00JGK4G3ZH70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:31:15 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWY00C634G2NH40@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:31:14 +0900 (KST)
In-reply-to: <1322718611-20934-4-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, patches@linaro.org

Tushar Behera wrote:
> 
> Framebuffer driver needs to fetch the video data during the rising
> edge of the VCLK. Otherwise, there are some glitches in the LCD
> display.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/mach-exynos/mach-origen.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-
> exynos/mach-origen.c
> index f56d027..38f0556 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -588,7 +588,8 @@ static struct s3c_fb_pd_win origen_fb_win0 = {
>  static struct s3c_fb_platdata origen_lcd_pdata __initdata = {
>  	.win[0]		= &origen_fb_win0,
>  	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB,
> -	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
> +	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC |
> +				VIDCON1_INV_VCLK,
>  	.setup_gpio	= exynos4_fimd0_gpio_setup_24bpp,
>  };
> 
> --
> 1.7.4.1

OK, will apply this.

And I will review 1/3 and 2/3 patches soon.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
