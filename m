From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Configure MAX8997 PMIC for Origen
Date: Sun, 14 Aug 2011 16:01:48 +0100
Message-ID: <20110814150148.GB25504@sirena.org.uk>
References: <1313034965-21286-1-git-send-email-inderpal.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:57361 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752655Ab1HNPBv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 14 Aug 2011 11:01:51 -0400
Content-Disposition: inline
In-Reply-To: <1313034965-21286-1-git-send-email-inderpal.singh@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inderpal Singh <inderpal.singh@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, myungjoo.ham@samsung.com, Inderpal Singh <inderpal.s@samsung.com>

On Thu, Aug 11, 2011 at 09:26:05AM +0530, Inderpal Singh wrote:

> +static struct regulator_consumer_supply __initdata ldo7_consumer[] = {
> +	REGULATOR_SUPPLY("avdd", "soc-audio"), /* Reatek ALC5625*/
> +};

Ick, no.  The soc-audio device is a virtual device within Linux and is
being phased out, any driver adding new soc-audio devices will be
rejected.  The CODEC driver should deal with its own power.

> +static struct regulator_init_data __initdata max8997_ldo3_data = {
> +	.constraints	= {
> +		.name		= "VMIPI_1.1V",
> +		.min_uV		= 1100000,
> +		.max_uV		= 1100000,
> +		.apply_uV	= 1,
> +		.always_on	= 1,
> +		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,

The regulator is always enabled but the consumers can change its status?

> +		.name		= "DVDD_SWB_2.8V",
> +		.min_uV		= 2800000,
> +		.max_uV		= 2800000,
> +		.apply_uV	= 1,
> +		.always_on	= 1,
> +		.valid_ops_mask	= REGULATOR_CHANGE_VOLTAGE,

The regulator has a fixed voltage but the consumers can change it?

> +static struct i2c_board_info i2c0_devs[] __initdata = {
> +[I2C0_MAX8997] = {
> +	I2C_BOARD_INFO("max8997", (0xCC >> 1)),
> +	.platform_data = &origen_max8997_pdata,
> +	},
> +};

Why are you assigning the array index?  That's very unusual.

> +static void __init origen_power_init(void)
> +{
> +	int gpio;
> +	int irq_base = IRQ_GPIO_END + 1;
> +
> +	origen_max8997_pdata.irq_base = irq_base;

Why is this not just set statically in the pdata?

> +	gpio = EXYNOS4_GPX0(4);
> +	s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(0xf));
> +	s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);

A define for the GPIO would be a bit more common.

> +	s3c_i2c0_set_platdata(NULL);
> +	i2c0_devs[I2C0_MAX8997].irq = gpio_to_irq(EXYNOS4_GPX0(4));

There should be defines to do this statically.
