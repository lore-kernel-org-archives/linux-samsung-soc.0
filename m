From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] ARM: S5PV210: Add audio support to Aquila
Date: Thu, 29 Jul 2010 10:38:26 -0700
Message-ID: <20100729173825.GE24781@opensource.wolfsonmicro.com>
References: <4C4F9E4C.7000001@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:41638 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750999Ab0G2RiO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jul 2010 13:38:14 -0400
Content-Disposition: inline
In-Reply-To: <4C4F9E4C.7000001@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben@simtec.co.uk>, Liam Girdwood <lrg@slimlogic.co.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

On Wed, Jul 28, 2010 at 12:04:44PM +0900, Chanwoo Choi wrote:

> +static struct regulator_consumer_supply wm8994_fixed_voltage0_supplies[] = {
> +	{
> +		.dev_name	= "5-001a",
> +		.supply		= "DBVDD",
> +	}, {
> +		.dev_name	= "5-001a",
> +		.supply		= "AVDD2",
> +	}, {
> +		.dev_name	= "5-001a",
> +		.supply		= "CPVDD",
> +	},
> +
> +};
> +
> +static struct regulator_consumer_supply wm8994_fixed_voltage1_supplies[] = {

All these fixed voltage regulators seem a bit suspicous for a mobile
phone - I'd have expected that the supplies would all be being provided
by your PMIC except for things taken directly from the battery supply
(like the speakers tend to be, for example)?  There's no problem with
the code itself, it just looks a bit odd.

> +static struct i2c_board_info i2c_gpio5_devs[] __initdata = {
> +	{
> +		/* CS/ADDR = low 0x34 (FYI: high = 0x36) */
> +		I2C_BOARD_INFO("wm8994", 0x34 >> 1),
> +		.platform_data	= &wm8994_platform_data,
> +	},
> +};

Probably clearer for generic Linux use to specify the address as 0x1a
directly.

> +static void __init aquila_sound_init(void)
> +{
> +	unsigned int gpio;
> +
> +	/* CODEC_XTAL_EN */
> +	gpio = S5PV210_GPH3(2);		/* XEINT_26 */
> +	gpio_request(gpio, "CODEC_XTAL_EN");
> +	s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
> +	s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
> +	gpio_direction_output(gpio, 1);

Might be as well to provide some or all this stuff in your audio machine
driver?

> +	/* MICBIAS_EN */
> +	gpio = S5PV210_GPJ4(2);			/* XMSMRN */
> +	gpio_request(gpio, "MICBIAS_EN");
> +	s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
> +	gpio_direction_output(gpio, 1);

This in particular would benefit from keeping the request of the GPIO
joined up with the driver that uses it.

> +	/* ADC_EN */
> +	gpio = S5PV210_GPJ3(2);
> +	gpio_request(gpio, "ADC_EN");
> +	s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
> +	gpio_direction_output(gpio, 1);

I'm not sure what this does?
