From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [RESEND PATCH 6/6] ARM: EXYNOS: USB OTG support for Universal
 C210
Date: Tue, 14 Feb 2012 11:31:45 +0530
Message-ID: <4F39F8C9.6020603@linaro.org>
References: <1328870146-20312-7-git-send-email-l.majewski@samsung.com> <1329133106-5669-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:51046 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751367Ab2BNGBu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Feb 2012 01:01:50 -0500
Received: by iacb35 with SMTP id b35so5627059iac.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Feb 2012 22:01:50 -0800 (PST)
In-Reply-To: <1329133106-5669-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On 02/13/2012 05:08 PM, Lukasz Majewski wrote:
> This patch adds platform data for using S3C-HSOTG driver at
> Universal_C210 target.
> 
> Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig                 |    1 +
>  arch/arm/mach-exynos/include/mach/map.h      |    2 ++
>  arch/arm/mach-exynos/include/mach/regs-sys.h |   20 ++++++++++++++++++++
>  arch/arm/mach-exynos/mach-universal_c210.c   |   14 ++++++++++++++
>  arch/arm/plat-samsung/devs.c                 |    2 +-

You must split these changes to platform-code and board-specific code
... and the changes to fix build-error w.r.t. S3C_DEV_USB_HSOTG should
come before OTG support is added to any of the EXYNOS based boards.

>  5 files changed, 38 insertions(+), 1 deletions(-)
>  create mode 100644 arch/arm/mach-exynos/include/mach/regs-sys.h
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 440d095..42bb710 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -246,6 +246,7 @@ config MACH_UNIVERSAL_C210
>  	select S5P_DEV_MFC
>  	select S5P_DEV_ONENAND
>  	select S5P_DEV_TV
> +	select S3C_DEV_USB_HSOTG

The same needs to be updated for nuri-board also ...

>  	select EXYNOS4_DEV_DMA
>  	select EXYNOS4_DEV_PD
>  	select EXYNOS4_SETUP_FIMD0
> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
> index a81c95b..be09588 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -34,6 +34,8 @@
>  #define EXYNOS4_PA_G2D			0x12800000
>  
>  #define EXYNOS4_PA_USB_HSOTG		0x12480000
> +#define EXYNOS4_PA_USB_HSPHY		0x125B0000

This macro is not used anywhere in the patch. I suppose it is not
required.

> +
>  #define EXYNOS4_PA_I2S0			0x03830000
>  #define EXYNOS4_PA_I2S1			0xE3100000
>  #define EXYNOS4_PA_I2S2			0xE2A00000
> diff --git a/arch/arm/mach-exynos/include/mach/regs-sys.h b/arch/arm/mach-exynos/include/mach/regs-sys.h
> new file mode 100644
> index 0000000..5682227
> --- /dev/null
> +++ b/arch/arm/mach-exynos/include/mach/regs-sys.h
> @@ -0,0 +1,20 @@
> +/* arch/arm/mach-s5pv210/include/mach/regs-sys.h
Change the file name, or still better, don't use the filename at all.

> + *
> + * Copyright 2010 Ben Dooks <ben-linux@fluff.org>
> + *
> + * S5PV210 - System registers definitions
EXYNOS?

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/* Registers related to power management */
> +#define S5P_PMREGx(x)			(S5P_VA_PMU + (x))
> +
> +#define S5P_USBOTG_PHY_CONTROL		S5P_PMREGx(0x0704)
> +#define S5P_USBOTG_PHY_EN		(1 << 0)
> +
> +/* compatibility for hsotg driver */
> +#define S3C64XX_OTHERS		S5P_USBOTG_PHY_CONTROL
> +#define S3C64XX_OTHERS_USBMASK	S5P_USBOTG_PHY_EN

I don't think we need these definitions.

> diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
> index 220de1c..2e43e98 100644
> --- a/arch/arm/mach-exynos/mach-universal_c210.c
> +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> @@ -28,6 +28,7 @@
>  #include <asm/mach-types.h>
>  
>  #include <plat/regs-serial.h>
> +#include <plat/clock.h>
>  #include <plat/cpu.h>
>  #include <plat/devs.h>
>  #include <plat/iic.h>
> @@ -41,6 +42,7 @@
>  #include <plat/s5p-time.h>
>  #include <plat/camport.h>
>  #include <plat/mipi_csis.h>
> +#include <plat/udc-hs.h>
>  
>  #include <mach/map.h>
>  
> @@ -200,6 +202,7 @@ static struct regulator_init_data lp3974_ldo2_data = {
>  };
>  
>  static struct regulator_consumer_supply lp3974_ldo3_consumer[] = {
> +	REGULATOR_SUPPLY("vusb_a", "s3c-hsotg"),
>  	REGULATOR_SUPPLY("vdd", "exynos4-hdmi"),
>  	REGULATOR_SUPPLY("vdd_pll", "exynos4-hdmi"),
>  	REGULATOR_SUPPLY("vdd11", "s5p-mipi-csis.0"),
> @@ -285,6 +288,7 @@ static struct regulator_init_data lp3974_ldo7_data = {
>  };
>  
>  static struct regulator_consumer_supply lp3974_ldo8_consumer[] = {
> +	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"),
>  	REGULATOR_SUPPLY("vdd33a_dac", "s5p-sdo"),
>  };
>  
> @@ -475,7 +479,10 @@ static struct regulator_init_data lp3974_vichg_data = {
>  static struct regulator_init_data lp3974_esafeout1_data = {
>  	.constraints	= {
>  		.name		= "SAFEOUT1",
> +		.min_uV		= 4800000,
> +		.max_uV		= 4800000,
>  		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
> +		.always_on	= 1,
>  		.state_mem	= {
>  			.enabled	= 1,
>  		},
> @@ -928,6 +935,9 @@ static struct gpio universal_camera_gpios[] = {
>  	{ GPIO_CAM_MEGA_nRST,	GPIOF_OUT_INIT_LOW,  "CAM_8M_NRST" },
>  };
>  
> +/* USB OTG */
> +static struct s3c_hsotg_plat universal_hsotg_pdata;
> +
>  static void universal_camera_init(void)
>  {
>  	s3c_set_platdata(&mipi_csis_platdata, sizeof(mipi_csis_platdata),
> @@ -981,6 +991,7 @@ static struct platform_device *universal_devices[] __initdata = {
>  	&universal_gpio_keys,
>  	&s5p_device_onenand,
>  	&s5p_device_fimd0,
> +	&s3c_device_usb_hsotg,
>  	&s5p_device_mfc,
>  	&s5p_device_mfc_l,
>  	&s5p_device_mfc_r,
> @@ -1039,6 +1050,7 @@ static void __init universal_machine_init(void)
>  	i2c_register_board_info(I2C_GPIO_BUS_12, i2c_gpio12_devs,
>  			ARRAY_SIZE(i2c_gpio12_devs));
>  
> +	s3c_hsotg_set_platdata(&universal_hsotg_pdata);
>  	universal_camera_init();
>  
>  	/* Last */
> @@ -1052,6 +1064,8 @@ static void __init universal_machine_init(void)
>  	s5p_device_fimc2.dev.parent = &exynos4_device_pd[PD_CAM].dev;
>  	s5p_device_fimc3.dev.parent = &exynos4_device_pd[PD_CAM].dev;
>  	s5p_device_mipi_csis0.dev.parent = &exynos4_device_pd[PD_CAM].dev;
> +
> +	clk_xusbxti.rate = 24000000;
>  }
>  
>  MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210")
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index 2d4d500..2e6558e 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -1439,7 +1439,7 @@ void __init s5p_ehci_set_platdata(struct s5p_ehci_platdata *pd)
>  #ifdef CONFIG_S3C_DEV_USB_HSOTG
>  static struct resource s3c_usb_hsotg_resources[] = {
>  	[0] = DEFINE_RES_MEM(S3C_PA_USB_HSOTG, SZ_128K),
> -	[1] = DEFINE_RES_IRQ(IRQ_OTG),
> +	[1] = DEFINE_RES_IRQ(IRQ_USB_HSOTG),
>  };
>  
>  struct platform_device s3c_device_usb_hsotg = {


-- 
Tushar Behera
