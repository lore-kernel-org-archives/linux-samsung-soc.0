From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: Samsung SoCs: preparation for single kernel
Date: Wed, 23 Jun 2010 11:01:03 +0900
Message-ID: <AANLkTinKsmc1IZDFqZIUutvxFQzYeAWwiR9TOEHBsbOe@mail.gmail.com>
References: <AANLkTinGwWzIAOe2tj6V2kCrMiPT7PHlYs1kFS-IsiN4@mail.gmail.com>
	<AANLkTil-AOEqhMOXydaiA1X_v0rjoNQxALrO0UY638AS@mail.gmail.com>
	<AANLkTil1i_ZGI8bY14HhjrAk9RooVreAJsTteqqrMgqJ@mail.gmail.com>
	<AANLkTikDml6gQAsiRrCjIt4bUD3hnpAATr1erqCGOJMd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:35413 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750945Ab0FWCBE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jun 2010 22:01:04 -0400
Received: by vws9 with SMTP id 9so214738vws.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2010 19:01:04 -0700 (PDT)
In-Reply-To: <AANLkTikDml6gQAsiRrCjIt4bUD3hnpAATr1erqCGOJMd@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Eric Miao <eric.y.miao@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>

On Wed, Jun 23, 2010 at 10:54 AM, Eric Miao <eric.y.miao@gmail.com> wro=
te:
> On Wed, Jun 23, 2010 at 9:47 AM, Kyungmin Park <kmpark@infradead.org>=
 wrote:
>> On Wed, Jun 23, 2010 at 9:50 AM, Eric Miao <eric.y.miao@gmail.com> w=
rote:
>>> On Wed, Jun 23, 2010 at 7:27 AM, Kyungmin Park <kmpark@infradead.or=
g> wrote:
>>>> To Ben,
>>>>
>>>> I really need single kernel for s5pc110 (cortex A8) and s5pc210
>>>> (cortex A9) at least.
>>>> Fortunately arm move to these approaches recently. but current Sam=
sung
>>>> SoCs not prepare these one.
>>>>
>>>> So I wonder do you have a plan or how to address these issues?
>>>> How to assign the address at resources and use it at runtime?
>>>>
>>>> Personally I want to use cpu_is_*. but you reject it to use.
>>>> Other way is that we can create the base address variables and ass=
ign
>>>> it at init time.
>>>>
>>>> Please give your opinions.
>>>>
>>>> Thank you,
>>>> Kyungmin Park
>>>>
>>>> e.g., cpu_is_* usage at OMAP tree
>>>>
>>>> static void omap_init_mcspi(void)
>>>> {
>>>> =A0 =A0 =A0 =A0if (cpu_is_omap44xx())
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0omap4_mcspi_fixup();
>>>>
>>>> =A0 =A0 =A0 =A0platform_device_register(&omap2_mcspi1);
>>>> =A0 =A0 =A0 =A0platform_device_register(&omap2_mcspi2);
>>>>
>>>> =A0 =A0 =A0 =A0if (cpu_is_omap2430() || cpu_is_omap343x() || cpu_i=
s_omap44xx())
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0omap2_mcspi3_init();
>>>>
>>>> =A0 =A0 =A0 =A0if (cpu_is_omap343x() || cpu_is_omap44xx())
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0omap2_mcspi4_init();
>>>> }
>>>
>>> Just my two cents: cpu_is_*() can be used, but only when absolutely=
 necessary.
>>> The s3c does a CPU detection at startup, so I guess the usage of cp=
u_is_*()
>>> can be even reduced.
>>
>> My concern is that most device resources use the S3C_* or S5P_* pref=
ix
>> and defined at each arch differently.
>>
>> E.G., mmc resource drivers use the S3C_PA_HSMMC0. but each mach has
>> different base address.
>> then how to handle this or make it possible?
>>
>
> Now you have
>
> s5pv210_device_hsmmc0
> s5pc100_device_hsmmc0
> s3c64xx_device_hsmmc0
> ....
>
> each with a different base.

Good, then wait Ben's opinions.

>
>> #define S5PV210_PA_HSMMC(x) =A0 =A0 (0xEB000000 + ((x) * 0x100000))
>> #define S3C_PA_HSMMC0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_HSMMC(0)
>> #define S3C_PA_HSMMC1 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_HSMMC(1)
>> #define S3C_PA_HSMMC2 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_HSMMC(2)
>>
>> #define S5PC100_PA_HSMMC(x) =A0 =A0 (0xED800000 + ((x) * 0x100000))
>> #define S3C_PA_HSMMC0 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_HSMMC(0)
>> #define S3C_PA_HSMMC1 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_HSMMC(1)
>> #define S3C_PA_HSMMC2 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_HSMMC(2)
>>
>> #define S3C64XX_PA_HSMMC(x) =A0 =A0 (0x7C200000 + ((x) * 0x100000))
>> #define S3C64XX_PA_HSMMC0 =A0 =A0 =A0 S3C64XX_PA_HSMMC(0)
>> #define S3C64XX_PA_HSMMC1 =A0 =A0 =A0 S3C64XX_PA_HSMMC(1)
>> #define S3C64XX_PA_HSMMC2 =A0 =A0 =A0 S3C64XX_PA_HSMMC(2)
>> #define S3C_PA_HSMMC0 =A0 =A0 =A0 =A0 =A0 S3C64XX_PA_HSMMC0
>> #define S3C_PA_HSMMC1 =A0 =A0 =A0 =A0 =A0 S3C64XX_PA_HSMMC1
>> #define S3C_PA_HSMMC2 =A0 =A0 =A0 =A0 =A0 S3C64XX_PA_HSMMC2
>>
>>>
>>> I'm not sure if the above case is a good reference or not. The omap=
_init_mcspi
>>> is called from omap2_init_devices(), while the registration can act=
ually be
>>> made into the board init code when that device is used (some of the=
 McSPIs are
>>> not used, and it's not necessary to register them), and the differe=
nces be
>>> handled in the driver.
>>
>> that's just example how to use cpu_is_* in others. the current schme
>> in samsung SoCs. we passed the different platform name for each arch=
=2E
>> e.g., s3c2410_i2c or s3c2440_i2c then i2c driver detect it and handl=
e
>> properly. of course it assume base address is set correctly as above=
=2E
>
> For the device driver, when you register two different i2c devices:
>
> struct platform_device s3c2410_device_i2c {
> =A0 =A0 =A0 =A0.name =A0 =3D "s3c2410-i2c",
> =A0 =A0 =A0 =A0...
> };
>
> struct platform_device s3c2440_device_i2c {
> =A0 =A0 =A0 =A0.name =A0 =3D "s3c2440-i2c",
> =A0 =A0 =A0 =A0...
> };
>
> And register the corresponding one in your board code (your board cod=
e
> knows exactly which one to register, no? )
>
> And then in your i2c driver, you declare:
>
> const static struct platform_device_id s3c_i2c_ids[] =3D {
> =A0 =A0 =A0 =A0{ "s3c2410-i2c", S3C2410_SPECIFIC_FLAGS },
> =A0 =A0 =A0 =A0{ "s3c2440-i2c", S3C2440_SPECIFIC_FLAGS },
> =A0 =A0 =A0 =A0.....
> };
>
> Now you have S3C2410_SPECIFIC_FLAGS and S3C2440_SPECIFIC_FLAGS for yo=
ur
> device driver to distinguish between the differences. Normally, the
> differences won't be much, and make sure you have good abstraction of
> those _SPECIFIC_FLAGS.

It's already done.
>>
>> Thank you,
>> Kyungmin Park
>>>
>>>>
>>>> _______________________________________________
>>>> linux-arm-kernel mailing list
>>>> linux-arm-kernel@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
>>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
