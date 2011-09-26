From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 1/2] ARM: EXYNOS4: Add TVOUT support for SMDKV310
Date: Tue, 27 Sep 2011 08:22:18 +0900
Message-ID: <003201cc7ca3$2280ed90$6782c8b0$%kim@samsung.com>
References: <1316670876-1636-1-git-send-email-hatim.rv@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18134 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755Ab1IZXWU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Sep 2011 19:22:20 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS500J5YKWVEWB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Sep 2011 08:22:19 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LS5007PZKX6R3A0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 27 Sep 2011 08:22:18 +0900 (KST)
In-reply-to: <1316670876-1636-1-git-send-email-hatim.rv@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Hatim Ali' <hatim.rv@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, t.stanislaws@samsung.com, mchehab@infradead.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, banajit.g@samsung.com

Hatim Ali wrote:
> 
> Add support for TVOUT on SMDKV310 board.
> 
> Signed-off-by: Hatim Ali <hatim.rv@samsung.com>
> ---
> Changes since v2:
> Incorporated review comments by Tomasz Stanislawski & Sylwester Nawrocki.
> - Used gpio_request_one to request for gpio line.
> - Added WARN_ON to check gpio_request is successful.
> 
> Changes since v1:
> Incorporated changes as suggested by Tomasz Stanislawski
> - Added  GPIO settings for hot-plug detection.
> - Added setting hdmi and mixer's parent for TV power domain.
> 
>  arch/arm/mach-exynos4/Kconfig         |    2 ++
>  arch/arm/mach-exynos4/mach-smdkv310.c |   18 ++++++++++++++++++
>  2 files changed, 20 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index 690bf6f..2857ab0 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -139,7 +139,9 @@ config MACH_SMDKV310
>  	select S3C_DEV_RTC
>  	select S3C_DEV_WDT
>  	select S3C_DEV_I2C1
> +	select S5P_DEV_I2C_HDMIPHY
>  	select S5P_DEV_MFC
> +	select S5P_DEV_TV
>  	select S3C_DEV_HSMMC
>  	select S3C_DEV_HSMMC1
>  	select S3C_DEV_HSMMC2
> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-
> exynos4/mach-smdkv310.c
> index 5f62b2b..fa3f9d7 100644
> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> @@ -173,6 +173,7 @@ static struct platform_device *smdkv310_devices[]
> __initdata = {
>  	&s3c_device_hsmmc2,
>  	&s3c_device_hsmmc3,
>  	&s3c_device_i2c1,
> +	&s5p_device_i2c_hdmiphy,
>  	&s3c_device_rtc,
>  	&s3c_device_wdt,
>  	&exynos4_device_ac97,
> @@ -194,6 +195,8 @@ static struct platform_device *smdkv310_devices[]
> __initdata = {
>  	&samsung_asoc_idma,
>  	&smdkv310_smsc911x,
>  	&exynos4_device_ahci,
> +	&s5p_device_hdmi,
> +	&s5p_device_mixer,
>  };
> 
>  static void __init smdkv310_smsc911x_init(void)
> @@ -230,6 +233,18 @@ static struct platform_pwm_backlight_data
> smdkv310_bl_data = {
>  	.pwm_period_ns  = 1000,
>  };
> 
> +static void s5p_tv_setup(void)
> +{
> +	/* direct HPD to HDMI chip */
> +	WARN_ON(gpio_request_one(EXYNOS4_GPX3(7),GPIOF_IN, "hpd-
> plug"));

ERROR: space required after that ',' (ctx:VxV)
#64: FILE: arch/arm/mach-exynos4/mach-smdkv310.c:239:
+       WARN_ON(gpio_request_one(EXYNOS4_GPX3(7),GPIOF_IN, "hpd-plug"));

Hmm...

OK, applied even though I don't think we really need to add WARN_ON here
because the board manager already knows the gpio pin is used for it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> +	s3c_gpio_cfgpin(EXYNOS4_GPX3(7), S3C_GPIO_SFN(0x3));
> +	s3c_gpio_setpull(EXYNOS4_GPX3(7), S3C_GPIO_PULL_NONE);
> +
> +	/* setup dependencies between TV devices */
> +	s5p_device_hdmi.dev.parent = &exynos4_device_pd[PD_TV].dev;
> +	s5p_device_mixer.dev.parent = &exynos4_device_pd[PD_TV].dev;
> +}
> +
>  static void __init smdkv310_map_io(void)
>  {
>  	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> @@ -254,6 +269,9 @@ static void __init smdkv310_machine_init(void)
>  	s3c_sdhci2_set_platdata(&smdkv310_hsmmc2_pdata);
>  	s3c_sdhci3_set_platdata(&smdkv310_hsmmc3_pdata);
> 
> +	s5p_tv_setup();
> +	s5p_i2c_hdmiphy_set_platdata(NULL);
> +
>  	samsung_keypad_set_platdata(&smdkv310_keypad_data);
> 
>  	samsung_bl_set(&smdkv310_bl_gpio_info, &smdkv310_bl_data);
> --
> 1.7.2.3
