From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: Fix up IRQ mapping for balblair on
 Cragganmore
Date: Wed, 16 Jan 2013 16:06:13 -0800
Message-ID: <0c0201cdf446$77d30aa0$67791fe0$@samsung.com>
References: <1358016152-5056-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55654 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754485Ab3AQAGd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jan 2013 19:06:33 -0500
In-reply-to: <1358016152-5056-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, 'Dimitris Papastamos' <dp@opensource.wolfsonmicro.com>, stable@vger.kernel.org

Mark Brown wrote:
> 
> From: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
> 
> We are using S3C_EINT(4) instead of S3C_EINT(5).
> 
> Signed-off-by: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm/mach-s3c64xx/mach-crag6410-module.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> index 553059f..755c0bb 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> @@ -47,7 +47,7 @@ static struct spi_board_info wm1253_devs[] = {
>  		.bus_num	= 0,
>  		.chip_select	= 0,
>  		.mode		= SPI_MODE_0,
> -		.irq		= S3C_EINT(5),
> +		.irq		= S3C_EINT(4),
>  		.controller_data = &wm0010_spi_csinfo,
>  		.platform_data = &wm0010_pdata,
>  	},
> --
> 1.7.10.4

Applied, thanks.

- Kukjin
