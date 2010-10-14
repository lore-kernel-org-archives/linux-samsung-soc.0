From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 2/2] ARM: S5PV210: Add init code of audio to Goni and
 Auqila board
Date: Thu, 14 Oct 2010 14:30:27 +0900
Message-ID: <006801cb6b60$ea61edf0$bf25c9d0$%kim@samsung.com>
References: <4CB66397.3090505@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:15948 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754513Ab0JNFaJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Oct 2010 01:30:09 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LA90058NLY8V530@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Oct 2010 14:30:08 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LA90070WLY8VQ@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Oct 2010 14:30:08 +0900 (KST)
In-reply-to: <4CB66397.3090505@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Ben Dooks' <ben-linux@fluff.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>

Chanwoo Choi wrote:
> 
> This patch add initialization code of audio and I2S platform drivers
> to Goni and Aquila board.
> 
> Signed-off-by : Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by : Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by : Kyungmin Park <kyungmin.park@samsung.com>
> Reviewed-by : Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s5pv210/mach-aquila.c |   24 ++++++++++++++++++++++++
>  arch/arm/mach-s5pv210/mach-goni.c   |   11 +++++++++++
>  2 files changed, 35 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-
> aquila.c
> index 0663ec4..a232937 100644
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
> +	__raw_writel(__raw_readl(S5P_OTHERS) | (0x3 << 8), S5P_OTHERS);
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
> index df5c2d1..63855c5 100644
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
> +	__raw_writel(__raw_readl(S5P_OTHERS) | (0x3 << 8), S5P_OTHERS);
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

Ok...will apply...
And I will think about handling of similar/same platform date later.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
