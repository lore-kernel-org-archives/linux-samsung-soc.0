From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH-Resend 2/2] ARM: EXYNOS: Add HSOTG support to SMDK4X12
Date: Tue, 19 Jun 2012 17:51:32 +0900
Message-ID: <019f01cd4df8$b9c50f20$2d4f2d60$%kim@samsung.com>
References: <1337849726-17744-1-git-send-email-sachin.kamat@linaro.org>
 <1337849726-17744-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47783 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752251Ab2FSIve (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jun 2012 04:51:34 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5U00BYKWJAA3C0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:51:33 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5U00GEGWLXIRG0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:51:33 +0900 (KST)
In-reply-to: <1337849726-17744-2-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> S3C-HSOTG support is added to SMDK4212 and SMDK4412 boards.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/Kconfig         |    2 ++
>  arch/arm/mach-exynos/mach-smdk4x12.c |    8 ++++++++
>  2 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 6682f35..95e3ee3 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -349,6 +349,7 @@ config MACH_SMDK4212
>  	select S3C_DEV_I2C3
>  	select S3C_DEV_I2C7
>  	select S3C_DEV_RTC
> +	select S3C_DEV_USB_HSOTG
>  	select S3C_DEV_WDT
>  	select SAMSUNG_DEV_BACKLIGHT
>  	select SAMSUNG_DEV_KEYPAD
> @@ -359,6 +360,7 @@ config MACH_SMDK4212
>  	select EXYNOS4_SETUP_I2C7
>  	select EXYNOS4_SETUP_KEYPAD
>  	select EXYNOS4_SETUP_SDHCI
> +	select EXYNOS4_SETUP_USB_PHY
>  	help
>  	  Machine support for Samsung SMDK4212
> 
> diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-
> exynos/mach-smdk4x12.c
> index d00e4f0..6d8f325 100644
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
> @@ -235,6 +236,9 @@ static struct samsung_keypad_platdata
> smdk4x12_keypad_data __initdata = {
>  	.cols		= 5,
>  };
> 
> +/* USB OTG */
> +static struct s3c_hsotg_plat smdk4x12_hsotg_pdata;
> +
>  static struct platform_device *smdk4x12_devices[] __initdata = {
>  	&s3c_device_hsmmc2,
>  	&s3c_device_hsmmc3,
> @@ -243,6 +247,7 @@ static struct platform_device *smdk4x12_devices[]
> __initdata = {
>  	&s3c_device_i2c3,
>  	&s3c_device_i2c7,
>  	&s3c_device_rtc,
> +	&s3c_device_usb_hsotg,
>  	&s3c_device_wdt,
>  	&samsung_device_keypad,
>  };
> @@ -281,6 +286,9 @@ static void __init smdk4x12_machine_init(void)
>  	s3c_sdhci2_set_platdata(&smdk4x12_hsmmc2_pdata);
>  	s3c_sdhci3_set_platdata(&smdk4x12_hsmmc3_pdata);
> 
> +	s3c_hsotg_set_platdata(&smdk4x12_hsotg_pdata);
> +	clk_xusbxti.rate = 24000000;

Well, already clk_xusbxti.rate is declared at the same file?

257 static void __init smdk4x12_map_io(void)
258 {
259 	clk_xusbxti.rate = 24000000;
260 



Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
