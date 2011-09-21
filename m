From: "Hatim R.V." <hatim.rv@gmail.com>
Subject: Re: [PATCH V2 1/3] ARM: EXYNOS4: Add TVOUT support for SMDKV310
Date: Wed, 21 Sep 2011 19:16:41 +0530
Message-ID: <CAAYb1rj9skwyJEEEV+Syn0Fk6DOEpxUPtDe1tFEnBy5Z6dBANw@mail.gmail.com>
References: <1316583860-32510-1-git-send-email-hatim.rv@samsung.com>
	<1316583860-32510-2-git-send-email-hatim.rv@samsung.com>
	<004901cc7856$d7ee21d0$87ca6570$%kim@samsung.com>
	<4E79DC49.1050407@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:43487 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750711Ab1IUNql convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 09:46:41 -0400
Received: by iaqq3 with SMTP id q3so1707295iaq.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Sep 2011 06:46:41 -0700 (PDT)
In-Reply-To: <4E79DC49.1050407@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Stanislawski <t.stanislaws@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Hatim Ali <hatim.rv@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, mchehab@infradead.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, banajit.g@samsung.com

Hello Tomasz Stanislawski,

On Wed, Sep 21, 2011 at 6:14 PM, Tomasz Stanislawski
<t.stanislaws@samsung.com> wrote:
> On 09/21/2011 02:06 PM, Kukjin Kim wrote:
>>
>> Hatim Ali wrote:
>>>
>>> Add support for TVOUT on SMDKV310 board.
>>>
>>> Signed-off-by: Hatim Ali<hatim.rv@samsung.com>
>>> ---
>>> Changes since V1:
>>> Incorporated changes as suggested by Tomasz Stanislawski
>>> - Added =A0GPIO settings for hot-plug detection.
>>> - Added setting hdmi and mixer's parent for TV power domain.
>>>
>>> =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 | =A0 =A02 ++
>>> =A0arch/arm/mach-exynos4/mach-smdkv310.c | =A0 25
>>> +++++++++++++++++++++++++
>>> =A02 files changed, 27 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos4/Kconfig
>>> b/arch/arm/mach-exynos4/Kconfig
>>> index 3b594fe..0bf0fe04 100644
>>> --- a/arch/arm/mach-exynos4/Kconfig
>>> +++ b/arch/arm/mach-exynos4/Kconfig
>>> @@ -131,6 +131,7 @@ config MACH_SMDKV310
>>> =A0 =A0 =A0 =A0select S3C_DEV_RTC
>>> =A0 =A0 =A0 =A0select S3C_DEV_WDT
>>> =A0 =A0 =A0 =A0select S3C_DEV_I2C1
>>> + =A0 =A0 =A0 select S5P_DEV_I2C_HDMIPHY
>>> =A0 =A0 =A0 =A0select S5P_DEV_MFC
>>> =A0 =A0 =A0 =A0select S3C_DEV_HSMMC
>>> =A0 =A0 =A0 =A0select S3C_DEV_HSMMC1
>>> @@ -140,6 +141,7 @@ config MACH_SMDKV310
>>> =A0 =A0 =A0 =A0select EXYNOS4_DEV_AHCI
>>> =A0 =A0 =A0 =A0select SAMSUNG_DEV_KEYPAD
>>> =A0 =A0 =A0 =A0select EXYNOS4_DEV_PD
>>> + =A0 =A0 =A0 select S5P_DEV_TV
>>> =A0 =A0 =A0 =A0select SAMSUNG_DEV_PWM
>>> =A0 =A0 =A0 =A0select EXYNOS4_DEV_SYSMMU
>>> =A0 =A0 =A0 =A0select EXYNOS4_SETUP_FIMD0
>>> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-
>>> exynos4/mach-smdkv310.c
>>> index 7ce4d8b..50de270 100644
>>> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
>>> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
>>> @@ -239,6 +239,7 @@ static struct platform_device *smdkv310_devices=
[]
>>> __initdata =3D {
>>> =A0 =A0 =A0 =A0&s3c_device_hsmmc2,
>>> =A0 =A0 =A0 =A0&s3c_device_hsmmc3,
>>> =A0 =A0 =A0 =A0&s3c_device_i2c1,
>>> + =A0 =A0 =A0 &s5p_device_i2c_hdmiphy,
>>> =A0 =A0 =A0 =A0&s3c_device_rtc,
>>> =A0 =A0 =A0 =A0&s3c_device_wdt,
>>> =A0 =A0 =A0 =A0&exynos4_device_ac97,
>>> @@ -262,6 +263,8 @@ static struct platform_device *smdkv310_devices=
[]
>>> __initdata =3D {
>>> =A0 =A0 =A0 =A0&smdkv310_lcd_lte480wv,
>>> =A0 =A0 =A0 =A0&smdkv310_smsc911x,
>>> =A0 =A0 =A0 =A0&exynos4_device_ahci,
>>> + =A0 =A0 =A0 &s5p_device_hdmi,
>>> + =A0 =A0 =A0 &s5p_device_mixer,
>>> =A0};
>>>
>>> =A0static void __init smdkv310_smsc911x_init(void)
>>> @@ -298,6 +301,25 @@ static struct platform_pwm_backlight_data
>>> smdkv310_bl_data =3D {
>>> =A0 =A0 =A0 =A0.pwm_period_ns =A0=3D 1000,
>>> =A0};
>>>
>>> +static void s5p_tv_setup(void)
>>> +{
>>> + =A0 =A0 =A0 int ret;
>>> +
>>> + =A0 =A0 =A0 /* direct HPD to HDMI chip */
>>> + =A0 =A0 =A0 ret =3D gpio_request(EXYNOS4_GPX3(7), "hpd-plug");
>>> +
>>> + =A0 =A0 =A0 if (!ret) {
>
> Maybe we should generate WARN_ON(1) here. Failure of gpio request ind=
icate
> that
> board was configued not correctly.

Ok. will add this in my next patch.
>>>
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_direction_input(EXYNOS4_GPX3(7))=
;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin_range(EXYNOS4_GPX3(7)=
,
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 1, S3C_GPIO_SFN(3));
>>
>> Why do you use 's3c_gpio_cfgpin_range()' for just one gpio pin not
>> range...?
>>
>>> + =A0 =A0 =A0 } else
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("Failed to request gpio for hp=
d: %d\n", ret);
>>
>> According to coding style, should be added { and } around above.
>>
>>> +
>>> + =A0 =A0 =A0 /* setup dependencies between TV devices */
>>> + =A0 =A0 =A0 s5p_device_hdmi.dev.parent =3D&exynos4_device_pd[PD_T=
V].dev;
>>> + =A0 =A0 =A0 s5p_device_mixer.dev.parent =3D&exynos4_device_pd[PD_=
TV].dev;
>>> +}
>>> +
>>> =A0static void __init smdkv310_map_io(void)
>>> =A0{
>>> =A0 =A0 =A0 =A0s5p_init_io(NULL, 0, S5P_VA_CHIPID);
>>> @@ -327,6 +349,9 @@ static void __init smdkv310_machine_init(void)
>>> =A0 =A0 =A0 =A0samsung_bl_set(&smdkv310_bl_gpio_info,&smdkv310_bl_d=
ata);
>>> =A0 =A0 =A0 =A0s5p_fimd0_set_platdata(&smdkv310_lcd0_pdata);
>>>
>>> + =A0 =A0 =A0 s5p_tv_setup();
>>> + =A0 =A0 =A0 s5p_i2c_hdmiphy_set_platdata(NULL);
>>> +
>>> =A0 =A0 =A0 =A0platform_add_devices(smdkv310_devices,
>>> ARRAY_SIZE(smdkv310_devices));
>>> =A0 =A0 =A0 =A0s5p_device_mfc.dev.parent =3D&exynos4_device_pd[PD_M=
=46C].dev;
>>> =A0}
>>> --
>>> 1.7.2.3
>>
>> Thanks.
>>
>> Best regards,
>> Kgene.
>> --
>> Kukjin Kim<kgene.kim@samsung.com>, Senior Engineer,
>> SW Solution Development Team, Samsung Electronics Co., Ltd.
>>
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
