From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: ADD USB EHCI device to SMDKV310
Date: Fri, 19 Aug 2011 23:11:12 +0900
Message-ID: <005001cc5e79$d9bc93d0$8d35bb70$%kim@samsung.com>
References: <1313564357-32331-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45459 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752123Ab1HSOLk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 10:11:40 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ600L22I2K4DC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 23:11:12 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ6004EJI2OYP@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 23:11:12 +0900 (KST)
In-reply-to: <1313564357-32331-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, patches@linaro.org, 'Jingoo Han' <jg1.han@samsung.com>

Sachin Kamat wrote:
> 
> Signed-off-by: Bhuvana Kakunoori <bhuvana.kakunoori@linaro.org>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos4/Kconfig         |    2 ++
>  arch/arm/mach-exynos4/mach-smdkv310.c |   16 ++++++++++++++++
>  2 files changed, 18 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index bb29d51..cc97d23 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -136,6 +136,7 @@ config MACH_SMDKV310
>  	bool "SMDKV310"
>  	select CPU_EXYNOS4210
>  	select S5P_DEV_FIMD0
> +	select S5P_DEV_USB_EHCI
>  	select S3C_DEV_RTC
>  	select S3C_DEV_WDT
>  	select S3C_DEV_I2C1
> @@ -151,6 +152,7 @@ config MACH_SMDKV310
>  	select SAMSUNG_DEV_PWM
>  	select EXYNOS4_DEV_SYSMMU
>  	select EXYNOS4_SETUP_FIMD0
> +	select EXYNOS4_SETUP_USB_PHY
>  	select EXYNOS4_SETUP_I2C1
>  	select EXYNOS4_SETUP_KEYPAD
>  	select EXYNOS4_SETUP_SDHCI
> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-
> exynos4/mach-smdkv310.c
> index 5f62b2b..b6c28ea 100644
> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> @@ -33,6 +33,8 @@
>  #include <plat/gpio-cfg.h>
>  #include <plat/backlight.h>
>  #include <plat/mfc.h>
> +#include <plat/ehci.h>
> +#include <plat/clock.h>
> 
>  #include <mach/map.h>
> 
> @@ -167,6 +169,16 @@ static struct i2c_board_info i2c_devs1[] __initdata =
{
>  	{I2C_BOARD_INFO("wm8994", 0x1a),},
>  };
> 
> +/* USB EHCI */
> +static struct s5p_ehci_platdata smdkv310_ehci_pdata;
> +
> +static void __init smdkv310_ehci_init(void)
> +{
> +	struct s5p_ehci_platdata *pdata = &smdkv310_ehci_pdata;
> +
> +	s5p_ehci_set_platdata(pdata);
> +}
> +
>  static struct platform_device *smdkv310_devices[] __initdata = {
>  	&s3c_device_hsmmc0,
>  	&s3c_device_hsmmc1,
> @@ -175,6 +187,7 @@ static struct platform_device *smdkv310_devices[]
> __initdata = {
>  	&s3c_device_i2c1,
>  	&s3c_device_rtc,
>  	&s3c_device_wdt,
> +	&s5p_device_ehci,
>  	&exynos4_device_ac97,
>  	&exynos4_device_i2s0,
>  	&samsung_device_keypad,
> @@ -258,6 +271,9 @@ static void __init smdkv310_machine_init(void)
> 
>  	samsung_bl_set(&smdkv310_bl_gpio_info, &smdkv310_bl_data);
> 
> +	smdkv310_ehci_init();
> +	clk_xusbxti.rate = 24000000;
> +
>  	platform_add_devices(smdkv310_devices,
> ARRAY_SIZE(smdkv310_devices));
>  	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
>  }
> --
> 1.7.4.1

(Cc'ed Jingoo Han)

Well, this is same with Jingoo's patch on smdkc210 which has been submitted
at 12th Aug.

I requested to him to re-work this on smdkv310 on his patch just now...
Hmm...I don't know :(

Let me think again...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
