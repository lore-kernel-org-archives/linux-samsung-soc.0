From: "Hatim R.V." <hatim.rv@gmail.com>
Subject: Re: [PATCH V2 1/3] ARM: EXYNOS4: Add TVOUT support for SMDKV310
Date: Wed, 21 Sep 2011 19:18:05 +0530
Message-ID: <CAAYb1rh1_e88RWtXTByiMFZ2jeX_6C6nzZz+MJsZ6j+Pwwb8fA@mail.gmail.com>
References: <1316583860-32510-1-git-send-email-hatim.rv@samsung.com>
	<1316583860-32510-2-git-send-email-hatim.rv@samsung.com>
	<4E79E122.2000600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:36172 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750844Ab1IUNsG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 09:48:06 -0400
Received: by iaqq3 with SMTP id q3so1708417iaq.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Sep 2011 06:48:05 -0700 (PDT)
In-Reply-To: <4E79E122.2000600@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Hatim Ali <hatim.rv@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.stanislaws@samsung.com, mchehab@infradead.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, banajit.g@samsung.com

Hi Sylwester,

On Wed, Sep 21, 2011 at 6:35 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> Hi Hatim,
>
> On 09/21/2011 07:44 AM, Hatim Ali wrote:
>> Add support for TVOUT on SMDKV310 board.
>>
>> Signed-off-by: Hatim Ali <hatim.rv@samsung.com>
>> ---
> ...
>> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-e=
xynos4/mach-smdkv310.c
>> index 7ce4d8b..50de270 100644
>> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
>> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
>> @@ -239,6 +239,7 @@ static struct platform_device *smdkv310_devices[=
] __initdata =3D {
>> =A0 =A0 =A0 &s3c_device_hsmmc2,
>> =A0 =A0 =A0 &s3c_device_hsmmc3,
>> =A0 =A0 =A0 &s3c_device_i2c1,
>> + =A0 =A0 &s5p_device_i2c_hdmiphy,
>> =A0 =A0 =A0 &s3c_device_rtc,
>> =A0 =A0 =A0 &s3c_device_wdt,
>> =A0 =A0 =A0 &exynos4_device_ac97,
>> @@ -262,6 +263,8 @@ static struct platform_device *smdkv310_devices[=
] __initdata =3D {
>> =A0 =A0 =A0 &smdkv310_lcd_lte480wv,
>> =A0 =A0 =A0 &smdkv310_smsc911x,
>> =A0 =A0 =A0 &exynos4_device_ahci,
>> + =A0 =A0 &s5p_device_hdmi,
>> + =A0 =A0 &s5p_device_mixer,
>> =A0};
>>
>> =A0static void __init smdkv310_smsc911x_init(void)
>> @@ -298,6 +301,25 @@ static struct platform_pwm_backlight_data smdkv=
310_bl_data =3D {
>> =A0 =A0 =A0 .pwm_period_ns =A0=3D 1000,
>> =A0};
>>
>> +static void s5p_tv_setup(void)
>> +{
>> + =A0 =A0 int ret;
>> +
>> + =A0 =A0 /* direct HPD to HDMI chip */
>> + =A0 =A0 ret =3D gpio_request(EXYNOS4_GPX3(7), "hpd-plug");
>> +
>> + =A0 =A0 if (!ret) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 gpio_direction_input(EXYNOS4_GPX3(7));
>
> Since you're probably going to be reworking this anyway, I think gpio=
_request_one
> could be used here for simplicity.

Thanks for your suggestion. Will change accordingly.


>
> --
> Regards,
> Sylwester
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
