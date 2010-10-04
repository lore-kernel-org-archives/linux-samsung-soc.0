From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH RESEND] ARM: S5PC110: GONI: Add support for QT602240 TS
 driver
Date: Mon, 04 Oct 2010 18:40:23 +0900
Message-ID: <01ce01cb63a8$2cfe9b10$86fbd130$%kim@samsung.com>
References: <1283764347-460-7-git-send-email-m.szyprowski@samsung.com>
 <1286184125-14319-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:12235 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754333Ab0JDJkH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 05:40:07 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9R001ZVEUUKP30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Oct 2010 18:40:06 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9R00GQHEUUNE@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Oct 2010 18:40:06 +0900 (KST)
In-reply-to: <1286184125-14319-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> Add required platform definitions for QT602240 touchscreen on I2C2 bus.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> 
> Hello,
> 
> This is just a resend of the previous version rebased onto the latest
> kgene/for-next branch.
> 
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
> 
> ---
>  arch/arm/mach-s5pv210/Kconfig     |    3 ++
>  arch/arm/mach-s5pv210/mach-goni.c |   54
> +++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> index af2a813..0509fd5 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -73,6 +73,7 @@ config MACH_AQUILA
>  config MACH_GONI
>  	bool "GONI"
>  	select CPU_S5PV210
> +	select S5P_GPIO_INT
>  	select S3C_DEV_FB
>  	select S5P_DEV_FIMC0
>  	select S5P_DEV_FIMC1
> @@ -80,10 +81,12 @@ config MACH_GONI
>  	select S3C_DEV_HSMMC
>  	select S3C_DEV_HSMMC1
>  	select S3C_DEV_HSMMC2
> +	select S3C_DEV_I2C2
>  	select S3C_DEV_USB_HSOTG
>  	select S5P_DEV_ONENAND
>  	select SAMSUNG_DEV_KEYPAD
>  	select S5PV210_SETUP_FB_24BPP
> +	select S5PV210_SETUP_I2C2
>  	select S5PV210_SETUP_KEYPAD
>  	select S5PV210_SETUP_SDHCI
>  	help
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
b/arch/arm/mach-s5pv210/mach-
> goni.c
> index 30ad59f..aa20875 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -15,6 +15,7 @@
>  #include <linux/fb.h>
>  #include <linux/i2c.h>
>  #include <linux/i2c-gpio.h>
> +#include <linux/i2c/qt602240_ts.h>
>  #include <linux/mfd/max8998.h>
>  #include <linux/regulator/fixed.h>
>  #include <linux/gpio_keys.h>
> @@ -135,6 +136,51 @@ static struct samsung_keypad_platdata keypad_data
> __initdata = {
>  	.cols		= 3,
>  };
> 
> +/* TSP */
> +static struct qt602240_platform_data qt602240_platform_data = {
> +	.x_line		= 17,
> +	.y_line		= 11,
> +	.x_size		= 800,
> +	.y_size		= 480,
> +	.blen		= 0x21,
> +	.threshold	= 0x28,
> +	.voltage	= 2800000,              /* 2.8V */
> +	.orient		= QT602240_DIAGONAL,
> +};
> +
> +static struct s3c2410_platform_i2c i2c2_data __initdata = {
> +	.flags		= 0,
> +	.bus_num	= 2,
> +	.slave_addr	= 0x10,
> +	.frequency	= 400 * 1000,
> +	.sda_delay	= 100,
> +};
> +
> +static struct i2c_board_info i2c2_devs[] __initdata = {
> +	{
> +		I2C_BOARD_INFO("qt602240_ts", 0x4a),
> +		.platform_data = &qt602240_platform_data,
> +	},
> +};
> +
> +static void __init goni_tsp_init(void)
> +{
> +	int gpio;
> +
> +	gpio = S5PV210_GPJ1(3);		/* XMSMADDR_11 */
> +	gpio_request(gpio, "TSP_LDO_ON");
> +	gpio_direction_output(gpio, 1);
> +	gpio_export(gpio, 0);
> +
> +	gpio = S5PV210_GPJ0(5);		/* XMSMADDR_5 */
> +	gpio_request(gpio, "TSP_INT");
> +
> +	s5p_register_gpio_interrupt(gpio);
> +	s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(0xf));
> +	s3c_gpio_setpull(gpio, S3C_GPIO_PULL_UP);
> +	i2c2_devs[0].irq = gpio_to_irq(gpio);
> +}
> +
>  /* MAX8998 regulators */
>  #if defined(CONFIG_REGULATOR_MAX8998) ||
> defined(CONFIG_REGULATOR_MAX8998_MODULE)
> 
> @@ -524,6 +570,7 @@ static struct platform_device *goni_devices[]
__initdata = {
>  	&s3c_device_hsmmc2,
>  	&s3c_device_usb_hsotg,
>  	&samsung_device_keypad,
> +	&s3c_device_i2c2,
>  };
> 
>  static void __init goni_map_io(void)
> @@ -535,6 +582,13 @@ static void __init goni_map_io(void)
> 
>  static void __init goni_machine_init(void)
>  {
> +	/* TSP: call before I2C 2 registeration */
> +	goni_tsp_init();
> +
> +	/* I2C2 */
> +	s3c_i2c2_set_platdata(&i2c2_data);
> +	i2c_register_board_info(2, i2c2_devs, ARRAY_SIZE(i2c2_devs));
> +
>  	/* PMIC */
>  	goni_pmic_init();
>  	i2c_register_board_info(AP_I2C_GPIO_PMIC_BUS_4,
> i2c_gpio_pmic_devs,
> --

Looks ok...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
