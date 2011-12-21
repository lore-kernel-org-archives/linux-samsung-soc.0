From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Add USB OHCI support to ORIGEN board
Date: Wed, 21 Dec 2011 18:16:38 +0900
Message-ID: <00a201ccbfc1$3ed0dad0$bc729070$%han@samsung.com>
References: <1324457752-26056-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59297 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752553Ab1LUJQk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Dec 2011 04:16:40 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWJ003GVR3JZTQ0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2011 18:16:39 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.153])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWJ00EVZR3RU550@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2011 18:16:39 +0900 (KST)
In-reply-to: <1324457752-26056-1-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, 'Jingoo Han' <jg1.han@samsung.com>

Hi, Tushar.

Tushar Behera wrote:
> -----Original Message-----
> Subject: [PATCH] ARM: EXYNOS: Add USB OHCI support to ORIGEN board
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> Signed-off-by: Angus Ainslie <angus.ainslie@linaro.org>

Acked-by: Jingoo Han <jg1.han@samsung.com>

Thanks.

Best regards,
Jingoo Han
> ---
> 
> This patch are based Kukjin's for-next branch and OHCI related
> patches from Jingoo Han.
> [PATCH v2 0/3] Support Samsung Exynos OHCI device and driver
> 
>  arch/arm/mach-exynos/Kconfig       |    1 +
>  arch/arm/mach-exynos/mach-origen.c |   13 +++++++++++++
>  2 files changed, 14 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index bd1bb9f1..0da2ced 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -304,6 +304,7 @@ config MACH_ORIGEN
>  	select SAMSUNG_DEV_PWM
>  	select EXYNOS4_DEV_DMA
>  	select EXYNOS4_DEV_PD
> +	select EXYNOS4_DEV_USB_OHCI
>  	select EXYNOS4_SETUP_FIMD0
>  	select EXYNOS4_SETUP_SDHCI
>  	select EXYNOS4_SETUP_USB_PHY
> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
> index f56d027..a0116036 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -42,6 +42,7 @@
>  #include <plat/fb.h>
>  #include <plat/mfc.h>
> 
> +#include <mach/ohci.h>
>  #include <mach/map.h>
> 
>  /* Following are default values for UCON, ULCON and UFCON UART registers */
> @@ -487,6 +488,16 @@ static void __init origen_ehci_init(void)
>  	s5p_ehci_set_platdata(pdata);
>  }
> 
> +/* USB OHCI */
> +static struct exynos4_ohci_platdata origen_ohci_pdata;
> +
> +static void __init origen_ohci_init(void)
> +{
> +	struct exynos4_ohci_platdata *pdata = &origen_ohci_pdata;
> +
> +	exynos4_ohci_set_platdata(pdata);
> +}
> +
>  static struct gpio_keys_button origen_gpio_keys_table[] = {
>  	{
>  		.code			= KEY_MENU,
> @@ -627,6 +638,7 @@ static struct platform_device *origen_devices[] __initdata = {
>  	&s5p_device_mfc_l,
>  	&s5p_device_mfc_r,
>  	&s5p_device_mixer,
> +	&exynos4_device_ohci,
>  	&exynos4_device_pd[PD_LCD0],
>  	&exynos4_device_pd[PD_TV],
>  	&exynos4_device_pd[PD_G3D],
> @@ -702,6 +714,7 @@ static void __init origen_machine_init(void)
>  	s3c_sdhci0_set_platdata(&origen_hsmmc0_pdata);
> 
>  	origen_ehci_init();
> +	origen_ohci_init();
>  	clk_xusbxti.rate = 24000000;
> 
>  	s5p_tv_setup();
> --
> 1.7.4.1
