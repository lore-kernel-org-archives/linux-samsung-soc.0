From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Add usb ehci device to the SMDKC210
Date: Wed, 31 Aug 2011 09:26:00 +0900
Message-ID: <00c301cc6774$8f978180$aec68480$%kim@samsung.com>
References: <1313142848-14468-1-git-send-email-jg1.han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46970 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754081Ab1HaA0D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Aug 2011 20:26:03 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQR007BZNV7U9L0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 09:26:01 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQR001JBNVDH4@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 09:26:01 +0900 (KST)
In-reply-to: <1313142848-14468-1-git-send-email-jg1.han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Yulgon Kim' <yulgon.kim@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>

Jingoo Han wrote:
> 
> This patch is to support usb ehci device to the SMDKC210 board.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/mach-exynos4/Kconfig         |    2 ++
>  arch/arm/mach-exynos4/mach-smdkc210.c |   16 ++++++++++++++++
>  2 files changed, 18 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index 3ceefdb..12a0481 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -115,6 +115,7 @@ config MACH_SMDKC210
>  	bool "SMDKC210"
>  	select CPU_EXYNOS4210
>  	select S5P_DEV_FIMD0
> +	select S5P_DEV_USB_EHCI
>  	select S3C_DEV_RTC
>  	select S3C_DEV_WDT
>  	select S3C_DEV_I2C1
> @@ -127,6 +128,7 @@ config MACH_SMDKC210
>  	select EXYNOS4_DEV_PD
>  	select EXYNOS4_DEV_SYSMMU
>  	select EXYNOS4_SETUP_FIMD0
> +	select EXYNOS4_SETUP_USB_PHY
>  	select EXYNOS4_SETUP_I2C1
>  	select EXYNOS4_SETUP_SDHCI
>  	help
> diff --git a/arch/arm/mach-exynos4/mach-smdkc210.c b/arch/arm/mach-
> exynos4/mach-smdkc210.c
> index a7c65e0..2cd2eb4 100644
> --- a/arch/arm/mach-exynos4/mach-smdkc210.c
> +++ b/arch/arm/mach-exynos4/mach-smdkc210.c
> @@ -36,6 +36,8 @@
>  #include <plat/pd.h>
>  #include <plat/gpio-cfg.h>
>  #include <plat/backlight.h>
> +#include <plat/ehci.h>
> +#include <plat/clock.h>
> 
>  #include <mach/map.h>
> 
> @@ -216,6 +218,16 @@ static struct i2c_board_info i2c_devs1[] __initdata =
{
>  	{I2C_BOARD_INFO("wm8994", 0x1a),},
>  };
> 
> +/* USB EHCI */
> +static struct s5p_ehci_platdata smdkc210_ehci_pdata;
> +
> +static void __init smdkc210_ehci_init(void)
> +{
> +	struct s5p_ehci_platdata *pdata = &smdkc210_ehci_pdata;
> +
> +	s5p_ehci_set_platdata(pdata);
> +}
> +
>  static struct platform_device *smdkc210_devices[] __initdata = {
>  	&s3c_device_hsmmc0,
>  	&s3c_device_hsmmc1,
> @@ -224,6 +236,7 @@ static struct platform_device *smdkc210_devices[]
> __initdata = {
>  	&s3c_device_i2c1,
>  	&s3c_device_rtc,
>  	&s3c_device_wdt,
> +	&s5p_device_ehci,
>  	&exynos4_device_ac97,
>  	&exynos4_device_i2s0,
>  	&exynos4_device_pd[PD_MFC],
> @@ -296,6 +309,9 @@ static void __init smdkc210_machine_init(void)
>  	samsung_bl_set(&smdkc210_bl_gpio_info, &smdkc210_bl_data);
>  	s5p_fimd0_set_platdata(&smdkc210_lcd0_pdata);
> 
> +	smdkc210_ehci_init();
> +	clk_xusbxti.rate = 24000000;
> +
>  	platform_add_devices(smdkc210_devices,
> ARRAY_SIZE(smdkc210_devices));
>  }
> 
> --
> 1.7.1

Hi Jingoo,

Maybe as you know, I merged smdkc210.c into smdkv310.c because its
components are similar so I can't apply this now.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
