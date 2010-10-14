From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/3] ARM: S5PV210: Add init code of audio to Goni and
 Aquila board
Date: Thu, 14 Oct 2010 09:32:32 +0900
Message-ID: <003701cb6b37$4c106fb0$e4314f10$%kim@samsung.com>
References: <4CA5623B.5030405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32365 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751524Ab0JNAcc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Oct 2010 20:32:32 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LA9001L285P6R20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Oct 2010 09:32:13 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LA900FFF85OSO@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Oct 2010 09:32:13 +0900 (KST)
In-reply-to: <4CA5623B.5030405@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Myungjoo Ham' <myungjoo.ham@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Liam Girdwood' <lrg@slimlogic.co.uk>

Chanwoo Choi wrote:
> 
> This patch add initializtion code of audio and I2S platform drivers
> to Goni and Aquila board.
> 
> Signed-off-by : Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by : Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by : Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-aquila.c |   24 ++++++++++++++++++++++++
>  arch/arm/mach-s5pv210/mach-goni.c   |   11 +++++++++++
>  2 files changed, 35 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-
> aquila.c
> index 0663ec4..92dad41 100644
> --- a/arch/arm/mach-s5pv210/mach-aquila.c
> +++ b/arch/arm/mach-s5pv210/mach-aquila.c
> @@ -507,8 +507,31 @@ static struct platform_device *aquila_devices[] __initdata
> = {
>  	&s5p_device_fimc0,
>  	&s5p_device_fimc1,
>  	&s5p_device_fimc2,
> +	&s5pv210_device_iis0,
>  };
> 
> +static void __init aquila_sound_init(void)
> +{
> +	unsigned int gpio;
> +
> +	/* CODEC_XTAL_EN
> +	 *
> +	 * The Aquila board have a oscillator which provide main clock
> +	 * to WM8994 codec. The oscillator provide 24MHz clock to WM8994
> +	 * clock. Set gpio setting of "CODEC_XTAL_EN" to enable a oscillator.
> +	 * */
> +	gpio = S5PV210_GPH3(2);		/* XEINT_26 */
> +	gpio_request(gpio, "CODEC_XTAL_EN");
> +	s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
> +	s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
> +
> +	/* Ths main clock of WM8994 codec uses the output of CLKOUT pin.
> +	 * The CLKOUT[9:8] set to 0x3(XUSBXTI) of 0xE010E000(OTHERS)
> +	 * because it needs 24MHz clock to operate WM8994 codec.
> +	 */
> +	writel(readl(S5P_OTHERS) | (0x3 << 8), S5P_OTHERS);
> +}
> +
>  static void __init aquila_map_io(void)
>  {
>  	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> @@ -530,6 +553,7 @@ static void __init aquila_machine_init(void)
>  	s3c_fimc_setname(2, "s5p-fimc");
> 
>  	/* SOUND */
> +	aquila_sound_init();
>  	i2c_register_board_info(AP_I2C_GPIO_BUS_5, i2c_gpio5_devs,
>  			ARRAY_SIZE(i2c_gpio5_devs));
> 
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-
> goni.c
> index df5c2d1..d3bab85 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -488,8 +488,18 @@ static struct platform_device *goni_devices[] __initdata =
> {
>  	&s3c_device_hsmmc0,
>  	&s3c_device_hsmmc1,
>  	&s3c_device_hsmmc2,
> +	&s5pv210_device_iis0,
>  };
> 
> +static void __init goni_sound_init(void)
> +{
> +	/* Ths main clock of WM8994 codec uses the output of CLKOUT pin.
> +	 * The CLKOUT[9:8] set to 0x3(XUSBXTI) of 0xE010E000(OTHERS)
> +	 * because it needs 24MHz clock to operate WM8994 codec.
> +	 */
> +	writel(readl(S5P_OTHERS) | (0x3 << 8), S5P_OTHERS);
> +}
> +
>  static void __init goni_map_io(void)
>  {
>  	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> @@ -507,6 +517,7 @@ static void __init goni_machine_init(void)
>  	goni_setup_sdhci();
> 
>  	/* SOUND */
> +	goni_sound_init();
>  	i2c_register_board_info(AP_I2C_GPIO_BUS_5, i2c_gpio5_devs,
>  			ARRAY_SIZE(i2c_gpio5_devs));
> 
> --

Hi Chanwoo,

I missed your first patch "[PATCH 1/3] ARM: S5P210: Add i2c information to Goni and Aquila board" in my mailbox. Could you please re-send it?

And I prefer __raw_writel() than writel() here, because according to page table setting, the memory type of the area you want to access is shared device. No need memory barrier when you are accessing shared device type of memory.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
