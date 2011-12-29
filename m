From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: Remove unconditional power domain disables
Date: Thu, 29 Dec 2011 12:37:18 +0900
Message-ID: <029001ccc5db$2a8a5400$7f9efc00$%kim@samsung.com>
References: <1325071546-28711-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48182 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752173Ab1L2DhT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 22:37:19 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWY007594PRIN50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:37:19 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWY00C1M4Q6M250@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:37:18 +0900 (KST)
In-reply-to: <1325071546-28711-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> Now that we have software runtime power management support this code is
> redundant.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/pm.c |   13 -------------
>  1 files changed, 0 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/pm.c b/arch/arm/mach-s3c64xx/pm.c
> index 055dac9..7d3e81b 100644
> --- a/arch/arm/mach-s3c64xx/pm.c
> +++ b/arch/arm/mach-s3c64xx/pm.c
> @@ -346,23 +346,10 @@ int __init s3c64xx_pm_init(void)
> 
>  static __init int s3c64xx_pm_initcall(void)
>  {
> -	u32 val;
> -
>  	pm_cpu_prep = s3c64xx_pm_prepare;
>  	pm_cpu_sleep = s3c64xx_cpu_suspend;
>  	pm_uart_udivslot = 1;
> 
> -	/*
> -	 * Unconditionally disable power domains that contain only
> -	 * blocks which have no mainline driver support.
> -	 */
> -	val = __raw_readl(S3C64XX_NORMAL_CFG);
> -	val &= ~(S3C64XX_NORMALCFG_DOMAIN_G_ON |
> -		 S3C64XX_NORMALCFG_DOMAIN_V_ON |
> -		 S3C64XX_NORMALCFG_DOMAIN_I_ON |
> -		 S3C64XX_NORMALCFG_DOMAIN_P_ON);
> -	__raw_writel(val, S3C64XX_NORMAL_CFG);
> -
>  #ifdef CONFIG_S3C_PM_DEBUG_LED_SMDK
>  	gpio_request(S3C64XX_GPN(12), "DEBUG_LED0");
>  	gpio_request(S3C64XX_GPN(13), "DEBUG_LED1");
> --
> 1.7.7.3

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
