From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Add USB EHCI device to Origen
Date: Wed, 31 Aug 2011 09:30:38 +0900
Message-ID: <00c401cc6775$35251900$9f6f4b00$%kim@samsung.com>
References: <1313564420-862-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50262 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754081Ab1HaAak (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Aug 2011 20:30:40 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQR00605O2SGXG0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 09:30:38 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQR005UFO32EY@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 09:30:38 +0900 (KST)
In-reply-to: <1313564420-862-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, patches@linaro.org

Sachin Kamat wrote:
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos4/Kconfig       |    2 ++
>  arch/arm/mach-exynos4/mach-origen.c |   17 +++++++++++++++++
>  2 files changed, 19 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index 3ab0f18..fba97a4 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -189,8 +189,10 @@ config MACH_NURI
>  config MACH_ORIGEN
>  	bool "ORIGEN"
>  	select CPU_EXYNOS4210
> +	select S5P_DEV_USB_EHCI
>  	select S3C_DEV_RTC
>  	select S3C_DEV_WDT
> +	select EXYNOS4_SETUP_USB_PHY

If possible, please keep the ordering :(

>  	select S3C_DEV_HSMMC2
>  	select EXYNOS4_SETUP_SDHCI
>  	help
> diff --git a/arch/arm/mach-exynos4/mach-origen.c
b/arch/arm/mach-exynos4/mach-
> origen.c
> index ed59f86..d101756 100644
> --- a/arch/arm/mach-exynos4/mach-origen.c
> +++ b/arch/arm/mach-exynos4/mach-origen.c
> @@ -24,6 +24,8 @@
>  #include <plat/devs.h>
>  #include <plat/sdhci.h>
>  #include <plat/iic.h>
> +#include <plat/ehci.h>
> +#include <plat/clock.h>
> 
>  #include <mach/map.h>
> 
> @@ -79,10 +81,21 @@ static struct s3c_sdhci_platdata origen_hsmmc2_pdata
> __initdata = {
>  	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
>  };
> 
> +/* USB EHCI */
> +static struct s5p_ehci_platdata origen_ehci_pdata;
> +
> +static void __init origen_ehci_init(void)
> +{
> +	struct s5p_ehci_platdata *pdata = &origen_ehci_pdata;
> +
> +	s5p_ehci_set_platdata(pdata);
> +}
> +
>  static struct platform_device *origen_devices[] __initdata = {
>  	&s3c_device_hsmmc2,
>  	&s3c_device_rtc,
>  	&s3c_device_wdt,
> +	&s5p_device_ehci,
>  };
> 
>  static void __init origen_map_io(void)
> @@ -95,6 +108,10 @@ static void __init origen_map_io(void)
>  static void __init origen_machine_init(void)
>  {
>  	s3c_sdhci2_set_platdata(&origen_hsmmc2_pdata);
> +
> +	origen_ehci_init();
> +	clk_xusbxti.rate = 24000000;
> +
>  	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
>  }
> 
> --
> 1.7.4.1

OK, will apply with re-ordering as per my comments.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
