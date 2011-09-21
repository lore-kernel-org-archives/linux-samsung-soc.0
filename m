From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH V2 1/3] ARM: EXYNOS4: Add TVOUT support for SMDKV310
Date: Wed, 21 Sep 2011 15:05:38 +0200
Message-ID: <4E79E122.2000600@samsung.com>
References: <1316583860-32510-1-git-send-email-hatim.rv@samsung.com>
 <1316583860-32510-2-git-send-email-hatim.rv@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:52026 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753629Ab1IUNFl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 09:05:41 -0400
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LRV0060DJ1FZY40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 14:05:39 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LRV00KJCJ1E0C@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 14:05:39 +0100 (BST)
In-reply-to: <1316583860-32510-2-git-send-email-hatim.rv@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hatim Ali <hatim.rv@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.stanislaws@samsung.com, mchehab@infradead.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, banajit.g@samsung.com

Hi Hatim,

On 09/21/2011 07:44 AM, Hatim Ali wrote:
> Add support for TVOUT on SMDKV310 board.
> 
> Signed-off-by: Hatim Ali <hatim.rv@samsung.com>
> ---
...
> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
> index 7ce4d8b..50de270 100644
> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> @@ -239,6 +239,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
>  	&s3c_device_hsmmc2,
>  	&s3c_device_hsmmc3,
>  	&s3c_device_i2c1,
> +	&s5p_device_i2c_hdmiphy,
>  	&s3c_device_rtc,
>  	&s3c_device_wdt,
>  	&exynos4_device_ac97,
> @@ -262,6 +263,8 @@ static struct platform_device *smdkv310_devices[] __initdata = {
>  	&smdkv310_lcd_lte480wv,
>  	&smdkv310_smsc911x,
>  	&exynos4_device_ahci,
> +	&s5p_device_hdmi,
> +	&s5p_device_mixer,
>  };
>  
>  static void __init smdkv310_smsc911x_init(void)
> @@ -298,6 +301,25 @@ static struct platform_pwm_backlight_data smdkv310_bl_data = {
>  	.pwm_period_ns  = 1000,
>  };
>  
> +static void s5p_tv_setup(void)
> +{
> +	int ret;
> +
> +	/* direct HPD to HDMI chip */
> +	ret = gpio_request(EXYNOS4_GPX3(7), "hpd-plug");
> +
> +	if (!ret) {
> +		gpio_direction_input(EXYNOS4_GPX3(7));

Since you're probably going to be reworking this anyway, I think gpio_request_one
could be used here for simplicity.  

--
Regards,
Sylwester
