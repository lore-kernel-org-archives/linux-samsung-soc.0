From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] SAMSUNG: S5PV310: Add I2S playback support
Date: Thu, 10 Mar 2011 18:41:36 +0900
Message-ID: <008901cbdf07$5c1d4ba0$1457e2e0$%kim@samsung.com>
References: <1299580852-20959-1-git-send-email-giridhar.maruthy@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24614 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751858Ab1CJJlm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Mar 2011 04:41:42 -0500
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHU00M2N5LHON50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 18:41:41 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHU00E6F5LHC6@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 18:41:41 +0900 (KST)
In-reply-to: <1299580852-20959-1-git-send-email-giridhar.maruthy@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Giridhar Maruthy' <giridhar.maruthy@linaro.org>, linux-samsung-soc@vger.kernel.org

Giridhar Maruthy wrote:
> 
> This commit adds the platform device and data of
> wm8994 regulator to enable the I2S playback on
> S5PV310 board on linux-linaro-2.6.38.
> 
> Signed-off-by: Giridhar Maruthy <giridhar.maruthy@linaro.org>
> ---

(snip)

> +#if defined(CONFIG_SND_SOC_WM8994) ||
defined(CONFIG_SND_SOC_WM8994_MODULE)
> +
> +#ifdef CONFIG_REGULATOR_WM8994
> +static struct regulator_consumer_supply wm8994_fixed_voltage0_supplies[]
= {
> +	{

(snip)

> +};
> +#endif

If required above, please use like following.

+#endif /* CONFIG_REGULATOR_WM8994 */

> +
> +static struct wm8994_pdata wm8994_platform_data = {
> +	/* configure gpio1 function: 0x0001(Logic level input/output) */
> +	.gpio_defaults[0] = 0x0001,
> +	/* configure gpio3/4/5/7 function for AIF2 voice */
> +	.gpio_defaults[2] = 0x8100,/*BCLK2 in*/
> +	.gpio_defaults[3] = 0x8100,/*LRCLK2 in*/
> +	.gpio_defaults[4] = 0x8100,/*DACDAT2 in*/
> +	/* configure gpio6 function: 0x0001(Logic level input/output) */
> +	.gpio_defaults[5] = 0x0001,
> +	.gpio_defaults[6] = 0x0100,/*ADCDAT2 out*/
> +#ifdef CONFIG_REGULATOR_WM8994
> +	.ldo[0]	= { 0, NULL, &wm8994_ldo1_data },
> +	.ldo[1] = { 0, NULL, &wm8994_ldo2_data },
> +#endif
> +};
> +#endif

Same as above.

> +
> +#ifdef CONFIG_I2C_S3C2410
> +#ifdef CONFIG_S3C_DEV_I2C1

Do we _really_ S3C_DEV_I2C1?
Basically, already selected above in mach-exynos4/Kconfig.

Of course, no need I2C_S3C2410 also here.

>  static struct i2c_board_info i2c_devs1[] __initdata = {
> -	{I2C_BOARD_INFO("wm8994", 0x1a),},
> +#if defined(CONFIG_SND_SOC_WM8994) ||
defined(CONFIG_SND_SOC_WM8994_MODULE)
> +	{
> +		I2C_BOARD_INFO("wm8994", 0x1a),
> +		.platform_data	= &wm8994_platform_data,
> +	},
> +#endif
>  };
> +#endif
> +#endif
> 
>  static struct platform_device *smdkv310_devices[] __initdata = {
>  	&s3c_device_hsmmc0,
> @@ -158,6 +316,13 @@ static struct platform_device *smdkv310_devices[]
> __initdata = {
>  	&exynos4_device_i2s0,
>  	&exynos4_device_pd[PD_MFC],
>  	&exynos4_device_pd[PD_G3D],
> +#if (defined(CONFIG_SND_SOC_WM8994) || \
> +		defined(CONFIG_SND_SOC_WM8994_MODULE)) && \
> +		defined(CONFIG_REGULATOR_WM8994)
> +	&wm8994_fixed_voltage0,
> +	&wm8994_fixed_voltage1,
> +	&wm8994_fixed_voltage2,
> +#endif
>  	&exynos4_device_pd[PD_LCD0],
>  	&exynos4_device_pd[PD_LCD1],
>  	&exynos4_device_pd[PD_CAM],
> --

Please make sure that ifdefs has no dependencies and no problem before
re-submitting.
I think, as Mark said, have to check whether need or not.


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
