From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Enable MFC on Origen
Date: Sun, 02 Oct 2011 16:07:46 +0900
Message-ID: <001401cc80d1$fd103600$f730a200$%kim@samsung.com>
References: <1317378712-12287-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63151 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751584Ab1JBHHr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Oct 2011 03:07:47 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSF00FR8FSUGR30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 02 Oct 2011 16:07:46 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSF007FXFSYLM50@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sun, 02 Oct 2011 16:07:46 +0900 (KST)
In-reply-to: <1317378712-12287-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> This patch enables multi-format codec (MFC) support on Origen board.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> PD related code in KConfig and header are added only because for-next
branch of
> Kgene's tree does not have it enabled yet.
> 
> ---
>  arch/arm/mach-exynos4/Kconfig       |    2 ++
>  arch/arm/mach-exynos4/mach-origen.c |   13 +++++++++++++
>  2 files changed, 15 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index d0491c2..93f9a62 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -243,6 +243,8 @@ config MACH_ORIGEN
>  	select S5P_DEV_I2C_HDMIPHY
>  	select S5P_DEV_TV
>  	select S5P_DEV_USB_EHCI
> +	select S5P_DEV_MFC
> +	select EXYNOS4_DEV_PD
>  	select SAMSUNG_DEV_BACKLIGHT
>  	select SAMSUNG_DEV_PWM
>  	select EXYNOS4_SETUP_SDHCI
> diff --git a/arch/arm/mach-exynos4/mach-origen.c
b/arch/arm/mach-exynos4/mach-origen.c
> index 421294b..4e53d10 100644
> --- a/arch/arm/mach-exynos4/mach-origen.c
> +++ b/arch/arm/mach-exynos4/mach-origen.c
> @@ -30,6 +30,8 @@
>  #include <plat/clock.h>
>  #include <plat/gpio-cfg.h>
>  #include <plat/backlight.h>
> +#include <plat/mfc.h>
> +#include <plat/pd.h>
> 
>  #include <mach/map.h>
> 
> @@ -167,6 +169,10 @@ static struct platform_device *origen_devices[]
__initdata = {
>  	&s5p_device_hdmi,
>  	&s5p_device_i2c_hdmiphy,
>  	&s5p_device_mixer,
> +	&s5p_device_mfc,
> +	&s5p_device_mfc_l,
> +	&s5p_device_mfc_r,
> +	&exynos4_device_pd[PD_MFC],
>  	&origen_device_gpiokeys,
>  };
> 
> @@ -188,6 +194,11 @@ static void __init origen_map_io(void)
>  	s3c24xx_init_uarts(origen_uartcfgs, ARRAY_SIZE(origen_uartcfgs));
>  }
> 
> +static void __init origen_reserve(void)
> +{
> +	s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
> +}
> +
>  static void __init origen_machine_init(void)
>  {
>  	/*
> @@ -203,6 +214,7 @@ static void __init origen_machine_init(void)
>  	s5p_i2c_hdmiphy_set_platdata(NULL);
> 
>  	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
> +	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
> 
>  	samsung_bl_set(&origen_bl_gpio_info, &origen_bl_data);
>  }
> @@ -214,4 +226,5 @@ MACHINE_START(ORIGEN, "ORIGEN")
>  	.map_io		= origen_map_io,
>  	.init_machine	= origen_machine_init,
>  	.timer		= &exynos4_timer,
> +	.reserve	= &origen_reserve,
>  MACHINE_END
> --
> 1.7.4.1

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
