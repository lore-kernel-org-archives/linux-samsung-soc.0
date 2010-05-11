From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 4/6] ARM: S3C64XX: Adds Touch Screen Driver Support for
	S3C6410
Date: Tue, 11 May 2010 09:26:32 +0100
Message-ID: <20100511082632.GA8473@trinity.fluff.org>
References: <1273213885-6498-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:53836 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755918Ab0EKI0i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 May 2010 04:26:38 -0400
Content-Disposition: inline
In-Reply-To: <1273213885-6498-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Naveen Krishna <ch.naveen@samsung.com>

On Fri, May 07, 2010 at 03:31:25PM +0900, Kukjin Kim wrote:
> From: Naveen Krishna <ch.naveen@samsung.com>
> 
> Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s3c64xx/Kconfig          |    1 +
>  arch/arm/mach-s3c64xx/mach-smdk6410.c  |   12 +++++++
>  arch/arm/mach-s3c64xx/s3c6410.c        |    1 +
>  arch/arm/plat-samsung/Kconfig          |    5 +++
>  arch/arm/plat-samsung/Makefile         |    1 +
>  arch/arm/plat-samsung/dev-ts.c         |   54 ++++++++++++++++++++++++++++++++
>  drivers/input/touchscreen/Kconfig      |    3 +-
>  drivers/input/touchscreen/s3c2410_ts.c |   19 +++++++++--
>  8 files changed, 92 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm/plat-samsung/dev-ts.c
> 
> diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
> index 69e9fbf..1f2f412 100644
> --- a/arch/arm/mach-s3c64xx/Kconfig
> +++ b/arch/arm/mach-s3c64xx/Kconfig
> @@ -90,6 +90,7 @@ config MACH_SMDK6410
>  	select S3C_DEV_HSMMC1
>  	select S3C_DEV_I2C1
>  	select S3C_DEV_FB
> +	select SAMSUNG_DEV_TS
>  	select S3C_DEV_USB_HOST
>  	select S3C_DEV_USB_HSOTG
>  	select S3C64XX_SETUP_SDHCI
> diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
> index 2d5afd2..fb186c9 100644
> --- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
> +++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
> @@ -64,6 +64,8 @@
>  #include <plat/clock.h>
>  #include <plat/devs.h>
>  #include <plat/cpu.h>
> +#include <plat/adc.h>
> +#include <plat/ts.h>
>  
>  #define UCON S3C2410_UCON_DEFAULT | S3C2410_UCON_UCLK
>  #define ULCON S3C2410_LCON_CS8 | S3C2410_LCON_PNONE | S3C2410_LCON_STOPB
> @@ -262,6 +264,8 @@ static struct platform_device *smdk6410_devices[] __initdata = {
>  	&smdk6410_lcd_powerdev,
>  
>  	&smdk6410_smsc911x,
> +	&s3c_device_adc,
> +	&s3c_device_ts,
>  };
>  
>  #ifdef CONFIG_REGULATOR
> @@ -596,6 +600,12 @@ static struct i2c_board_info i2c_devs1[] __initdata = {
>  	{ I2C_BOARD_INFO("24c128", 0x57), },	/* Samsung S524AD0XD1 */
>  };
>  
> +static struct s3c2410_ts_mach_info s3c_ts_platform __initdata = {
> +	.delay			= 10000,
> +	.presc			= 49,
> +	.oversampling_shift	= 2,
> +};
> +
>  static void __init smdk6410_map_io(void)
>  {
>  	u32 tmp;
> @@ -625,6 +635,8 @@ static void __init smdk6410_machine_init(void)
>  	s3c_i2c1_set_platdata(NULL);
>  	s3c_fb_set_platdata(&smdk6410_lcd_pdata);
>  
> +	s3c24xx_ts_set_platdata(&s3c_ts_platform);
> +
>  	/* configure nCS1 width to 16 bits */
>  
>  	cs1 = __raw_readl(S3C64XX_SROM_BW) &
> diff --git a/arch/arm/mach-s3c64xx/s3c6410.c b/arch/arm/mach-s3c64xx/s3c6410.c
> index 31e53fa..4390ecb 100644
> --- a/arch/arm/mach-s3c64xx/s3c6410.c
> +++ b/arch/arm/mach-s3c64xx/s3c6410.c
> @@ -55,6 +55,7 @@ void __init s3c6410_map_io(void)
>  
>  	s3c_device_adc.name      = "s3c64xx-adc";
>  	s3c_device_nand.name = "s3c6400-nand";
> +	s3c_device_ts.name	= "s3c64xx-ts";
>  }
>  
>  void __init s3c6410_init_clocks(int xtal)
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 641649f..b466da8 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -196,6 +196,11 @@ config S3C64XX_DEV_SPI
>  	  Compile in platform device definitions for S3C64XX's type
>  	  SPI controllers.
>  
> +config SAMSUNG_DEV_TS
> +	bool
> +	help
> +	  Compile in platform device definition for Samsung Touch Screen.
> +
>  # DMA
>  
>  config S3C_DMA
> diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
> index 3cf30a4..695ed99 100644
> --- a/arch/arm/plat-samsung/Makefile
> +++ b/arch/arm/plat-samsung/Makefile
> @@ -41,6 +41,7 @@ obj-$(CONFIG_S3C_DEV_USB_HOST)	+= dev-usb.o
>  obj-$(CONFIG_S3C_DEV_USB_HSOTG)	+= dev-usb-hsotg.o
>  obj-$(CONFIG_S3C_DEV_NAND)	+= dev-nand.o
>  obj-$(CONFIG_SAMSUNG_DEV_ADC)	+= dev-adc.o
> +obj-$(CONFIG_SAMSUNG_DEV_TS)	+= dev-ts.o
>  
>  # DMA support
>  
> diff --git a/arch/arm/plat-samsung/dev-ts.c b/arch/arm/plat-samsung/dev-ts.c
> new file mode 100644
> index 0000000..f4a2bbd
> --- /dev/null
> +++ b/arch/arm/plat-samsung/dev-ts.c
> @@ -0,0 +1,54 @@
> +/* linux/arch/arm/plat-samsung/dev-ts.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * TouchScreen Device definition for Samsung S3C, S5P serie SoCs.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +
> +#include <mach/map.h>
> +#include <mach/irqs.h>
> +#include <plat/devs.h>
> +#include <plat/cpu.h>
> +#include <plat/ts.h>
> +
> +static struct resource s3c_ts_resource[] = {
> +[0] = {
> +		.start	= SAMSUNG_PA_ADC,
> +		.end	= SAMSUNG_PA_ADC + SZ_4K - 1,
> +		.flags	= IORESOURCE_MEM,
> +	},
> +	[1] = {
> +		.start	= IRQ_PENDN,
> +		.end	= IRQ_PENDN,
> +		.flags	= IORESOURCE_IRQ,
> +	},
> +};
> +
> +struct platform_device s3c_device_ts = {
> +	.name		= "samsung-ts",
> +	.id		= -1,
> +	.num_resources	= ARRAY_SIZE(s3c_ts_resource),
> +	.resource	= s3c_ts_resource,
> +};
> +EXPORT_SYMBOL(s3c_device_ts);
> +
> +void __init s3c24xx_ts_set_platdata(struct s3c2410_ts_mach_info *pd)
> +{
> +	struct s3c2410_ts_mach_info *npd;
> +
> +	npd = kmalloc(sizeof(*npd), GFP_KERNEL);
> +	if (npd) {
> +		memcpy(npd, pd, sizeof(*npd));
> +		s3c_device_ts.dev.platform_data = npd;
> +	} else {
> +		printk(KERN_ERR "no memory for Touchscreen platform data\n");
> +	}
> +}

could you split the driver changes from the core changes please.

> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index a5dcdac..dc20279 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -159,7 +159,8 @@ config TOUCHSCREEN_FUJITSU
>  
>  config TOUCHSCREEN_S3C2410
>  	tristate "Samsung S3C2410 touchscreen input driver"
> -	depends on ARCH_S3C2410
> +	depends on ARCH_S3C2410 || ARCH_S3C64XX
> +	select S3C_ADC
>  	help
>  	  Say Y here if you have the s3c2410 touchscreen.
>  
> diff --git a/drivers/input/touchscreen/s3c2410_ts.c b/drivers/input/touchscreen/s3c2410_ts.c
> index 1a70f9c..3964964 100644
> --- a/drivers/input/touchscreen/s3c2410_ts.c
> +++ b/drivers/input/touchscreen/s3c2410_ts.c
> @@ -87,6 +87,12 @@ struct s3c2410ts {
>  
>  static struct s3c2410ts ts;
>  
> +enum s3c_cpu_type {
> +	TYPE_S3C2410,
> +	TYPE_S3C2440,
> +	TYPE_S3C64XX,	/* S3C64XX, S5P64XX Series */
> +};

actually, having looked at this, we don't really 2410 and 2440 as
a seperate type if we've gotten rid of the gpio configuration as
this was the only change that it was being used for.

I also think we could add a set of flags with the features of the
SoC instead of using the type name, so we could do:

#define FEAT_PEN_IRQ	(1 << 0)	/* HAS ADCCLRINTPNDNUP */


>  /**
>   * get_down - return the down state of the pen
>   * @data0: The data read from ADCDAT0 register.
> @@ -155,6 +161,7 @@ static DEFINE_TIMER(touch_timer, touch_timer_fire, 0, 0);
>   */
>  static irqreturn_t stylus_irq(int irq, void *dev_id)
>  {
> +	struct platform_device *pdev = to_platform_device(ts.dev);
>  	unsigned long data0;
>  	unsigned long data1;
>  	bool down;
> @@ -173,6 +180,11 @@ static irqreturn_t stylus_irq(int irq, void *dev_id)
>  	else
>  		dev_info(ts.dev, "%s: count=%d\n", __func__, ts.count);
>  
> +	if (platform_get_device_id(pdev)->driver_data == TYPE_S3C64XX) {
> +		/* Clear pen down/up interrupt */
> +		writel(0x0, ts.io + S3C64XX_ADCCLRINTPNDNUP);
> +	}

	if (ts.feat & FEAT_PEN_IRQ) {
		/* Clear pen down/up interrupt */
....

you'll also need to copy ts.feat from platform_get_device_id(pdev)->driver_data
at startup.

ts.feat is optional, however if you don't want to use it i'd
suggest a wrapper call to take ts and return the features as
thus:

ts_get_features(ts)
{
	struct platform_device *pdev = to_platform_device(ts.dev);
	return platform_get_device_id(pdev)->driver_data;
}

> +
>  	return IRQ_HANDLED;
>  }
>  
> @@ -405,15 +417,16 @@ static struct dev_pm_ops s3c_ts_pmops = {
>  #endif
>  
>  static struct platform_device_id s3cts_driver_ids[] = {
> -	{ "s3c2410-ts", 0 },
> -	{ "s3c2440-ts", 1 },
> +	{ "s3c2410-ts", TYPE_S3C2410 },
> +	{ "s3c2440-ts", TYPE_S3C2440 },
> +	{ "s3c64xx-ts", TYPE_S3C64XX },

	{ "s3c2410-ts", 0 },
	{ "s3c2440-ts", 0 }
	{ "s3c64xx-ts", FEAT_PEN_IRQ }, 

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, s3cts_driver_ids);
>  
>  static struct platform_driver s3c_ts_driver = {
>  	.driver         = {
> -		.name   = "s3c24xx-ts",
> +		.name   = "samsung-ts",
>  		.owner  = THIS_MODULE,
>  #ifdef CONFIG_PM
>  		.pm	= &s3c_ts_pmops,
> -- 
> 1.6.6.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
