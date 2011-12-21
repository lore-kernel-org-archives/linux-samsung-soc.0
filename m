From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Use gpio_request_one
Date: Wed, 21 Dec 2011 14:26:52 +0900
Message-ID: <009d01ccbfa1$25e4c010$71ae4030$%han@samsung.com>
References: <003d01ccb876$ccffa720$66fef560$%han@samsung.com>
 <061f01ccbf97$8a4eaac0$9eec0040$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:61523 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751747Ab1LUF05 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Dec 2011 00:26:57 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWJ00MT2GGTQQG0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2011 14:26:53 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.153])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWJ002GPGGS66K0@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2011 14:26:53 +0900 (KST)
In-reply-to: <061f01ccbf97$8a4eaac0$9eec0040$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Jingoo Han' <jg1.han@samsung.com>

Kukjin Kim wrote:
> -----Original Message-----
> Subject: RE: [PATCH] ARM: EXYNOS: Use gpio_request_one
> 
> Jingoo Han wrote:
> >
> > By using gpio_request_one it is possible to set the direction
> > and initial value in one shot. Thus, using gpio_request_one can
> > make the code simpler.
> >
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > ---
> >  arch/arm/mach-exynos/mach-nuri.c           |    4 +---
> >  arch/arm/mach-exynos/mach-smdkv310.c       |    4 +---
> >  arch/arm/mach-exynos/mach-universal_c210.c |   10 +++-------
> >  3 files changed, 5 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-
> > nuri.c
> > index 236bbe1..c96de1f 100644
> > --- a/arch/arm/mach-exynos/mach-nuri.c
> > +++ b/arch/arm/mach-exynos/mach-nuri.c
> > @@ -249,9 +249,7 @@ static int nuri_bl_init(struct device *dev)
> >  {
> >  	int ret, gpio = EXYNOS4_GPE2(3);
> >
> > -	ret = gpio_request(gpio, "LCD_LDO_EN");
> > -	if (!ret)
> > -		gpio_direction_output(gpio, 0);
> > +	ret = gpio_request_one(gpio, GPIOF_OUT_INIT_LOW, "LCD_LD0_EN");
> >
> Looks good, but following is better?
> 
>  static int nuri_bl_init(struct device *dev)
>  {
> -       int ret, gpio = EXYNOS4_GPE2(3);
> -
> -       ret = gpio_request(gpio, "LCD_LDO_EN");
> -       if (!ret)
> -               gpio_direction_output(gpio, 0);
> -
> -       return ret;
> +       return gpio_request_one(EXYNOS4_GPE2(3), GPIOF_OUT_INIT_LOW,
> "LCD_LDO_EN");
>  }
> 
> Others, ok to me.
> Could you please re-send?
OK, I will send you v2 patch.
Thank you.
> 
> Thanks.
> 
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> 
> >  	return ret;
> >  }
> > diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-
> > exynos/mach-smdkv310.c
> > index cec2afa..cbf31bd 100644
> > --- a/arch/arm/mach-exynos/mach-smdkv310.c
> > +++ b/arch/arm/mach-exynos/mach-smdkv310.c
> > @@ -129,9 +129,7 @@ static void lcd_lte480wv_set_power(struct
> > plat_lcd_data *pd,
> >  		gpio_free(EXYNOS4_GPD0(1));
> >  #endif
> >  		/* fire nRESET on power up */
> > -		gpio_request(EXYNOS4_GPX0(6), "GPX0");
> > -
> > -		gpio_direction_output(EXYNOS4_GPX0(6), 1);
> > +		gpio_request_one(EXYNOS4_GPX0(6), GPIOF_OUT_INIT_HIGH,
> > "GPX0");
> >  		mdelay(100);
> >
> >  		gpio_set_value(EXYNOS4_GPX0(6), 0);
> > diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-
> > exynos/mach-universal_c210.c
> > index a2a177f..0a04cd6 100644
> > --- a/arch/arm/mach-exynos/mach-universal_c210.c
> > +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> > @@ -608,8 +608,7 @@ static void __init universal_tsp_init(void)
> >
> >  	/* TSP_LDO_ON: XMDMADDR_11 */
> >  	gpio = EXYNOS4_GPE2(3);
> > -	gpio_request(gpio, "TSP_LDO_ON");
> > -	gpio_direction_output(gpio, 1);
> > +	gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH, "TSP_LDO_ON");
> >  	gpio_export(gpio, 0);
> >
> >  	/* TSP_INT: XMDMADDR_7 */
> > @@ -669,8 +668,7 @@ static void __init universal_touchkey_init(void)
> >  	i2c_gpio12_devs[0].irq = gpio_to_irq(gpio);
> >
> >  	gpio = EXYNOS4_GPE3(3);			/* XMDMDATA_3 */
> > -	gpio_request(gpio, "3_TOUCH_EN");
> > -	gpio_direction_output(gpio, 1);
> > +	gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH, "3_TOUCH_EN");
> >  }
> >
> >  static struct s3c2410_platform_i2c universal_i2c0_platdata __initdata = {
> > @@ -1000,9 +998,7 @@ static void __init universal_map_io(void)
> >  void s5p_tv_setup(void)
> >  {
> >  	/* direct HPD to HDMI chip */
> > -	gpio_request(EXYNOS4_GPX3(7), "hpd-plug");
> > -
> > -	gpio_direction_input(EXYNOS4_GPX3(7));
> > +	gpio_request_one(EXYNOS4_GPX3(7), GPIOF_IN, "hpd-plug");
> >  	s3c_gpio_cfgpin(EXYNOS4_GPX3(7), S3C_GPIO_SFN(0x3));
> >  	s3c_gpio_setpull(EXYNOS4_GPX3(7), S3C_GPIO_PULL_NONE);
> >
> > --
> > 1.7.1
