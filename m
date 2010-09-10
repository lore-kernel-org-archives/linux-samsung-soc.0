From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 6/6] ARM: S5PC110: add support for MMC regulators on Goni
 board
Date: Fri, 10 Sep 2010 18:55:50 +0900
Message-ID: <000501cb50ce$5c606f60$15214e20$%kim@samsung.com>
References: <1284103403-10696-1-git-send-email-m.szyprowski@samsung.com>
 <1284103403-10696-7-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26547 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583Ab0IJJzi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 05:55:38 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8I0093SZKPPX00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 18:55:37 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8I00EO0ZKPH1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 18:55:37 +0900 (KST)
In-reply-to: <1284103403-10696-7-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>

Marek Szyprowski wrote:
> 
> Add required platform definitions for MMC power regulators on Samsung
> Goni board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> CC: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s5pv210/mach-goni.c |   44
> ++++++++++++++++++++++++++++++++++--
>  1 files changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
b/arch/arm/mach-s5pv210/mach-
> goni.c
> index b28a42b..595afc37 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -16,6 +16,7 @@
>  #include <linux/i2c.h>
>  #include <linux/i2c-gpio.h>
>  #include <linux/mfd/max8998.h>
> +#include <linux/regulator/fixed.h>
>  #include <linux/spi/spi.h>
>  #include <linux/spi/spi_gpio.h>
>  #include <linux/lcd.h>
> @@ -227,6 +228,10 @@ static void __init goni_radio_init(void)
>  /* MAX8998 regulators */
>  #if defined(CONFIG_REGULATOR_MAX8998) ||
> defined(CONFIG_REGULATOR_MAX8998_MODULE)
> 
> +static struct regulator_consumer_supply goni_ldo5_consumers[] = {
> +	{ .supply = "vmmc",	.dev = &s3c_device_hsmmc0.dev },
> +};
> +
>  static struct regulator_init_data goni_ldo2_data = {
>  	.constraints	= {
>  		.name		= "VALIVE_1.1V",
> @@ -266,6 +271,8 @@ static struct regulator_init_data goni_ldo5_data = {
>  		.max_uV		= 2800000,
>  		.apply_uV	= 1,
>  	},
> +	.num_consumer_supplies = ARRAY_SIZE(goni_ldo5_consumers),
> +	.consumer_supplies = goni_ldo5_consumers,
>  };
> 
>  static struct regulator_init_data goni_ldo6_data = {
> @@ -471,6 +478,39 @@ static struct max8998_platform_data
> goni_max8998_pdata = {
>  	.num_regulators	= ARRAY_SIZE(goni_regulators),
>  	.regulators	= goni_regulators,
>  };
> +
> +static struct regulator_consumer_supply mmc2_supplies[] = {
> +	{
> +		.dev		= &s3c_device_hsmmc2.dev,
> +		.supply		= "vmmc",
> +	},
> +};
> +
> +static struct regulator_init_data mmc2_fixed_voltage_init_data = {
> +	.constraints		= {
> +		.name		= "V_TF_2.8V",
> +		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies	= ARRAY_SIZE(mmc2_supplies),
> +	.consumer_supplies	= mmc2_supplies,
> +};
> +
> +static struct fixed_voltage_config mmc2_fixed_voltage_config = {
> +	.supply_name		= "T_FLASH_EN",
> +	.microvolts		= 2800000,
> +	.gpio			= S5PV210_MP05(4),	/* XM0ADDR_12 */
> +	.enable_high		= true,
> +	.init_data		= &mmc2_fixed_voltage_init_data,
> +};
> +
> +static struct platform_device mmc2_fixed_voltage = {
> +	.name		= "reg-fixed-voltage",
> +	.id		= 2,
> +	.dev		= {
> +		.platform_data	= &mmc2_fixed_voltage_config,
> +	},
> +};
> +
>  #endif
> 
>  /* GPIO I2C PMIC */
> @@ -559,9 +599,6 @@ static struct s3c_sdhci_platdata goni_hsmmc2_data
> __initdata = {
> 
>  static void goni_setup_sdhci(void)
>  {
> -	gpio_request(GONI_EXT_FLASH_EN, "FLASH_EN");
> -	gpio_direction_output(GONI_EXT_FLASH_EN, 1);
> -

Why need above changes in this patch?
Others, looks ok.


>  	s3c_sdhci0_set_platdata(&goni_hsmmc0_data);
>  	s3c_sdhci1_set_platdata(&goni_hsmmc1_data);
>  	s3c_sdhci2_set_platdata(&goni_hsmmc2_data);
> @@ -573,6 +610,7 @@ static struct platform_device *goni_devices[]
__initdata = {
>  	&goni_spi_gpio,
>  	&s3c_device_usb_hsotg,
>  	&goni_i2c_gpio_pmic,
> +	&mmc2_fixed_voltage,
>  	&goni_device_gpiokeys,
>  	&s5p_device_fimc0,
>  	&s5p_device_fimc1,
> --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
