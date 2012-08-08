From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Fix compilation error with s3c2410_defconfig
Date: Wed, 08 Aug 2012 10:32:22 +0900
Message-ID: <0a3701cd7505$a852fe30$f8f8fa90$%kim@samsung.com>
References: <1344333546-16995-1-git-send-email-tushar.behera@linaro.org>
 <098f01cd7488$0d66d630$28348290$%kim@samsung.com> <5020F568.5020204@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51781 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755120Ab2HHBce (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Aug 2012 21:32:34 -0400
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Tushar Behera' <tushar.behera@linaro.org>, thierry.reding@avionic-design.de
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, s.hauer@pengutronix.de, patches@linaro.org

Kukjin Kim wrote:
> 

[...]

> 
> From: Tushar Behera <tushar.behera@linaro.org>
> Subject: [PATCH] ARM: SAMSUNG: Fix compilation error with
> s3c2410_defconfig
> 
> Commit 2663e766c56a ("ARM Samsung: Move s3c pwm driver to pwm framework")

Oops, this should be "215c29d3d0e9"...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> moved Samsung PWM driver to drivers/pwm and the config option to select
> this driver has changed.
> 
> This patch fixes following build-error with s3c2410_defconfig.
> 
> arch/arm/mach-s3c24xx/built-in.o: In function 'rx1950_lcd_power':
> arch/arm/mach-s3c24xx/mach-rx1950.c:430: undefined reference to
> 'pwm_config'
> arch/arm/mach-s3c24xx/mach-rx1950.c:431: undefined reference to
> 'pwm_disable'
> arch/arm/mach-s3c24xx/mach-rx1950.c:437: undefined reference to
> 'pwm_config'
> arch/arm/mach-s3c24xx/mach-rx1950.c:438: undefined reference to
> 'pwm_enable'
> arch/arm/mach-s3c24xx/built-in.o: In function 'rx1950_backlight_exit':
> arch/arm/mach-s3c24xx/mach-rx1950.c:504: undefined reference to 'pwm_free'
> arch/arm/mach-s3c24xx/built-in.o: In function 'rx1950_backlight_init':
> arch/arm/mach-s3c24xx/mach-rx1950.c:487: undefined reference to
> 'pwm_request'
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> [kgene.kim@samsung.com: re-worked as per review comments]
> Cc: Thierry Reding <thierry.reding@avionic-design.de>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s3c24xx/Kconfig |    4 ++--
>  arch/arm/plat-samsung/Kconfig |    2 +-
>  drivers/pwm/Kconfig           |    2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
> index e249611..d56b0f7 100644
> --- a/arch/arm/mach-s3c24xx/Kconfig
> +++ b/arch/arm/mach-s3c24xx/Kconfig
> @@ -483,7 +483,7 @@ config MACH_NEO1973_GTA02
>  	select I2C
>  	select POWER_SUPPLY
>  	select MACH_NEO1973
> -	select S3C2410_PWM
> +	select S3C24XX_PWM
>  	select S3C_DEV_USB_HOST
>  	help
>  	   Say Y here if you are using the Openmoko GTA02 / Freerunner GSM
> Phone
> @@ -493,7 +493,7 @@ config MACH_RX1950
>  	select S3C24XX_DCLK
>  	select PM_H1940 if PM
>  	select I2C
> -	select S3C2410_PWM
> +	select S3C24XX_PWM
>  	select S3C_DEV_NAND
>  	select S3C2410_IOTIMING if S3C2440_CPUFREQ
>  	select S3C2440_XTAL_16934400
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 7aca31c..dcdfb77 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -403,7 +403,7 @@ config S5P_DEV_USB_EHCI
> 
>  config S3C24XX_PWM
>  	bool "PWM device support"
> -	select HAVE_PWM
> +	select PWM
>  	help
>  	  Support for exporting the PWM timer blocks via the pwm device
>  	  system
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 8fc3808..34c8ec1 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -59,7 +59,7 @@ config PWM_PXA
> 
>  config PWM_SAMSUNG
>  	tristate "Samsung pwm support"
> -	depends on PLAT_SAMSUNG
> +	def_bool PLAT_SAMSUNG
>  	help
>  	  Generic PWM framework driver for Samsung.
> 
> --
> 1.7.4.1
