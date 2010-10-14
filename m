From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 1/2] ARM: S5PV210: Add i2c information to Goni and
 Aquila board
Date: Thu, 14 Oct 2010 14:28:56 +0900
Message-ID: <006701cb6b60$b3cead50$1b6c07f0$%kim@samsung.com>
References: <4CB66396.8010004@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:15568 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754513Ab0JNF3L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Oct 2010 01:29:11 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LA9006WYLVONG20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Oct 2010 14:28:36 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LA9008DMLVODE@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Oct 2010 14:28:36 +0900 (KST)
In-reply-to: <4CB66396.8010004@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Ben Dooks' <ben-linux@fluff.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>

Chanwoo Choi wrote:
> 
> This patch the I2C board information for the WM8994 used in the Goni/Aquila
> as audio codec and adds the I2C platform drivers.
> 
> Signed-off-by : Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by : Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by : Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-aquila.c |   27
> +++++++++++++++++++++++++++
>  arch/arm/mach-s5pv210/mach-goni.c   |   27
> +++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-
> aquila.c
> index 0dda801..0663ec4 100644
> --- a/arch/arm/mach-s5pv210/mach-aquila.c
> +++ b/arch/arm/mach-s5pv210/mach-aquila.c
> @@ -404,6 +404,28 @@ static struct i2c_board_info i2c_gpio_pmic_devs[]
> __initdata = {
>  #endif
>  };
> 
> +/* GPIO I2C AP 1.8V */
> +#define AP_I2C_GPIO_BUS_5	5
> +static struct i2c_gpio_platform_data aquila_i2c_gpio5_data = {
> +	.sda_pin	= S5PV210_MP05(3),	/* XM0ADDR_11 */
> +	.scl_pin	= S5PV210_MP05(2),	/* XM0ADDR_10 */
> +};
> +
> +static struct platform_device aquila_i2c_gpio5 = {
> +	.name		= "i2c-gpio",
> +	.id		= AP_I2C_GPIO_BUS_5,
> +	.dev		= {
> +		.platform_data	= &aquila_i2c_gpio5_data,
> +	},
> +};
> +
> +static struct i2c_board_info i2c_gpio5_devs[] __initdata = {
> +	{
> +		/* CS/ADDR = low 0x34 (FYI: high = 0x36) */
> +		I2C_BOARD_INFO("wm8994", 0x1a),
> +	},
> +};
> +
>  /* PMIC Power button */
>  static struct gpio_keys_button aquila_gpio_keys_table[] = {
>  	{
> @@ -475,6 +497,7 @@ static void aquila_setup_sdhci(void)
> 
>  static struct platform_device *aquila_devices[] __initdata = {
>  	&aquila_i2c_gpio_pmic,
> +	&aquila_i2c_gpio5,
>  	&aquila_device_gpiokeys,
>  	&s3c_device_fb,
>  	&s5pc110_device_onenand,
> @@ -506,6 +529,10 @@ static void __init aquila_machine_init(void)
>  	s3c_fimc_setname(1, "s5p-fimc");
>  	s3c_fimc_setname(2, "s5p-fimc");
> 
> +	/* SOUND */
> +	i2c_register_board_info(AP_I2C_GPIO_BUS_5, i2c_gpio5_devs,
> +			ARRAY_SIZE(i2c_gpio5_devs));
> +
>  	/* FB */
>  	s3c_fb_set_platdata(&aquila_lcd_pdata);
> 
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-
> goni.c
> index 53754d7..df5c2d1 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -385,6 +385,28 @@ static struct i2c_board_info i2c_gpio_pmic_devs[]
> __initdata = {
>  #endif
>  };
> 
> +/* GPIO I2C AP 1.8V */
> +#define AP_I2C_GPIO_BUS_5	5
> +static struct i2c_gpio_platform_data goni_i2c_gpio5_data = {
> +	.sda_pin	= S5PV210_MP05(3),	/* XM0ADDR_11 */
> +	.scl_pin	= S5PV210_MP05(2),	/* XM0ADDR_10 */
> +};
> +
> +static struct platform_device goni_i2c_gpio5 = {
> +	.name		= "i2c-gpio",
> +	.id		= AP_I2C_GPIO_BUS_5,
> +	.dev		= {
> +		.platform_data	= &goni_i2c_gpio5_data,
> +	},
> +};
> +
> +static struct i2c_board_info i2c_gpio5_devs[] __initdata = {
> +	{
> +		/* CS/ADDR = low 0x34 (FYI: high = 0x36) */
> +		I2C_BOARD_INFO("wm8994", 0x1a),
> +	},
> +};
> +
>  /* PMIC Power button */
>  static struct gpio_keys_button goni_gpio_keys_table[] = {
>  	{
> @@ -458,6 +480,7 @@ static struct platform_device *goni_devices[] __initdata = {
>  	&s3c_device_fb,
>  	&s5pc110_device_onenand,
>  	&goni_i2c_gpio_pmic,
> +	&goni_i2c_gpio5,
>  	&goni_device_gpiokeys,
>  	&s5p_device_fimc0,
>  	&s5p_device_fimc1,
> @@ -483,6 +506,10 @@ static void __init goni_machine_init(void)
>  	/* SDHCI */
>  	goni_setup_sdhci();
> 
> +	/* SOUND */
> +	i2c_register_board_info(AP_I2C_GPIO_BUS_5, i2c_gpio5_devs,
> +			ARRAY_SIZE(i2c_gpio5_devs));
> +
>  	/* FB */
>  	s3c_fb_set_platdata(&goni_lcd_pdata);
> 
> --

Ok...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
