From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH][Resend] ARM: EXYNOS: Add HSOTG support to SMDK4X12
Date: Fri, 13 Jul 2012 20:28:30 +0900
Message-ID: <117f01cd60ea$a1164f20$e342ed60$%kim@samsung.com>
References: <1340252515-15999-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33049 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752136Ab2GML2c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 07:28:32 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M730056AJVEXLP0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 20:28:31 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M73005O9JVJYA30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 20:28:31 +0900 (KST)
In-reply-to: <1340252515-15999-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org


> -----Original Message-----
> From: Sachin Kamat [mailto:sachin.kamat@linaro.org]
> Sent: Thursday, June 21, 2012 1:22 PM
> To: linux-samsung-soc@vger.kernel.org
> Cc: kgene.kim@samsung.com; sachin.kamat@linaro.org; patches@linaro.org
> Subject: [PATCH][Resend] ARM: EXYNOS: Add HSOTG support to SMDK4X12
> 
> S3C-HSOTG support is added to SMDK4212 and SMDK4412 boards.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> Rebased on Kukjin Kim's tree -next/board-samsung branch.
> ---
>  arch/arm/mach-exynos/Kconfig         |    2 ++
>  arch/arm/mach-exynos/mach-smdk4x12.c |    7 +++++++
>  2 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index f5fb6ea..ee8fa10 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -362,6 +362,7 @@ config MACH_SMDK4212
>  	select S3C_DEV_I2C3
>  	select S3C_DEV_I2C7
>  	select S3C_DEV_RTC
> +	select S3C_DEV_USB_HSOTG
>  	select S3C_DEV_WDT
>  	select S5P_DEV_FIMC0
>  	select S5P_DEV_FIMC1
> @@ -378,6 +379,7 @@ config MACH_SMDK4212
>  	select EXYNOS4_SETUP_I2C7
>  	select EXYNOS4_SETUP_KEYPAD
>  	select EXYNOS4_SETUP_SDHCI
> +	select EXYNOS4_SETUP_USB_PHY
>  	help
>  	  Machine support for Samsung SMDK4212
> 
> diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-
> exynos/mach-smdk4x12.c
> index e134c95..61abbc4 100644
> --- a/arch/arm/mach-exynos/mach-smdk4x12.c
> +++ b/arch/arm/mach-exynos/mach-smdk4x12.c
> @@ -19,6 +19,7 @@
>  #include <linux/pwm_backlight.h>
>  #include <linux/regulator/machine.h>
>  #include <linux/serial_core.h>
> +#include <linux/platform_data/s3c-hsotg.h>
> 
>  #include <asm/mach/arch.h>
>  #include <asm/hardware/gic.h>
> @@ -236,6 +237,9 @@ static struct samsung_keypad_platdata
> smdk4x12_keypad_data __initdata = {
>  	.cols		= 8,
>  };
> 
> +/* USB OTG */
> +static struct s3c_hsotg_plat smdk4x12_hsotg_pdata;
> +
>  static struct platform_device *smdk4x12_devices[] __initdata = {
>  	&s3c_device_hsmmc2,
>  	&s3c_device_hsmmc3,
> @@ -244,6 +248,7 @@ static struct platform_device *smdk4x12_devices[]
> __initdata = {
>  	&s3c_device_i2c3,
>  	&s3c_device_i2c7,
>  	&s3c_device_rtc,
> +	&s3c_device_usb_hsotg,
>  	&s3c_device_wdt,
>  	&s5p_device_fimc0,
>  	&s5p_device_fimc1,
> @@ -295,6 +300,8 @@ static void __init smdk4x12_machine_init(void)
>  	s3c_sdhci2_set_platdata(&smdk4x12_hsmmc2_pdata);
>  	s3c_sdhci3_set_platdata(&smdk4x12_hsmmc3_pdata);
> 
> +	s3c_hsotg_set_platdata(&smdk4x12_hsotg_pdata);
> +
>  	platform_add_devices(smdk4x12_devices,
> ARRAY_SIZE(smdk4x12_devices));
>  }
> 
> --
> 1.7.4.1

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
