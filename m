From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: s3c64xx: Select GPIO_GENERIC_PLATFORM for Cragganmore
Date: Fri, 22 Jan 2016 09:21:44 +0900
Message-ID: <56A17618.4030008@samsung.com>
References: <1453400718-26720-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:64414 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751406AbcAVAVn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jan 2016 19:21:43 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O1B00GHGVO52L50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Jan 2016 00:21:41 +0000 (GMT)
In-reply-to: <1453400718-26720-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsnmicro.com

On 22.01.2016 03:25, Mark Brown wrote:
> The Cragganmore machine driver provides platform data for the generic GPIO
> platform driver which uses structures only defined if the driver is
> enabled. Since there is little reason to use the platform without the GPIOs
> add a select to avoid build failures.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm/mach-s3c64xx/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
> index 7c0c420c3016..98d2aa9393f1 100644
> --- a/arch/arm/mach-s3c64xx/Kconfig
> +++ b/arch/arm/mach-s3c64xx/Kconfig
> @@ -310,6 +310,7 @@ config MACH_WLF_CRAGG_6410
>  	depends on I2C=y
>  	select CPU_S3C6410
>  	select LEDS_GPIO_REGISTER
> +	select GPIO_GENERIC_PLATFORM
>  	select S3C64XX_DEV_SPI0
>  	select S3C64XX_SETUP_FB_24BPP
>  	select S3C64XX_SETUP_I2C1
> 


Thanks for the patch!
This was already fixed by Arnd:
http://marc.info/?l=linux-gpio&m=145237423205247&w=2

Best regards,
Krzysztof
