From: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: Samsung SoCs: preparation for single kernel
Date: Wed, 23 Jun 2010 09:54:49 +0800
Message-ID: <AANLkTikDml6gQAsiRrCjIt4bUD3hnpAATr1erqCGOJMd@mail.gmail.com>
References: <AANLkTinGwWzIAOe2tj6V2kCrMiPT7PHlYs1kFS-IsiN4@mail.gmail.com>
	<AANLkTil-AOEqhMOXydaiA1X_v0rjoNQxALrO0UY638AS@mail.gmail.com>
	<AANLkTil1i_ZGI8bY14HhjrAk9RooVreAJsTteqqrMgqJ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:44625 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750728Ab0FWBzL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jun 2010 21:55:11 -0400
Received: by vws9 with SMTP id 9so208212vws.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2010 18:55:10 -0700 (PDT)
In-Reply-To: <AANLkTil1i_ZGI8bY14HhjrAk9RooVreAJsTteqqrMgqJ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Ben Dooks <ben-linux@fluff.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>

On Wed, Jun 23, 2010 at 9:47 AM, Kyungmin Park <kmpark@infradead.org> w=
rote:
> On Wed, Jun 23, 2010 at 9:50 AM, Eric Miao <eric.y.miao@gmail.com> wr=
ote:
>> On Wed, Jun 23, 2010 at 7:27 AM, Kyungmin Park <kmpark@infradead.org=
> wrote:
>>> To Ben,
>>>
>>> I really need single kernel for s5pc110 (cortex A8) and s5pc210
>>> (cortex A9) at least.
>>> Fortunately arm move to these approaches recently. but current Sams=
ung
>>> SoCs not prepare these one.
>>>
>>> So I wonder do you have a plan or how to address these issues?
>>> How to assign the address at resources and use it at runtime?
>>>
>>> Personally I want to use cpu_is_*. but you reject it to use.
>>> Other way is that we can create the base address variables and assi=
gn
>>> it at init time.
>>>
>>> Please give your opinions.
>>>
>>> Thank you,
>>> Kyungmin Park
>>>
>>> e.g., cpu_is_* usage at OMAP tree
>>>
>>> static void omap_init_mcspi(void)
>>> {
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap44xx())
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap4_mcspi_=
fixup();
>>>
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_register(&omap2_mcspi1);
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_register(&omap2_mcspi2);
>>>
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap2430() || cpu_is_omap343x=
() || cpu_is_omap44xx())
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap2_mcspi3=
_init();
>>>
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap343x() || cpu_is_omap44xx=
())
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap2_mcspi4=
_init();
>>> }
>>
>> Just my two cents: cpu_is_*() can be used, but only when absolutely =
necessary.
>> The s3c does a CPU detection at startup, so I guess the usage of cpu=
_is_*()
>> can be even reduced.
>
> My concern is that most device resources use the S3C_* or S5P_* prefi=
x
> and defined at each arch differently.
>
> E.G., mmc resource drivers use the S3C_PA_HSMMC0. but each mach has
> different base address.
> then how to handle this or make it possible?
>

Now you have

s5pv210_device_hsmmc0
s5pc100_device_hsmmc0
s3c64xx_device_hsmmc0
=2E...

each with a different base.

> #define S5PV210_PA_HSMMC(x) =C2=A0 =C2=A0 (0xEB000000 + ((x) * 0x1000=
00))
> #define S3C_PA_HSMMC0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5PV210_PA_H=
SMMC(0)
> #define S3C_PA_HSMMC1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5PV210_PA_H=
SMMC(1)
> #define S3C_PA_HSMMC2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5PV210_PA_H=
SMMC(2)
>
> #define S5PC100_PA_HSMMC(x) =C2=A0 =C2=A0 (0xED800000 + ((x) * 0x1000=
00))
> #define S3C_PA_HSMMC0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5PC100_PA_H=
SMMC(0)
> #define S3C_PA_HSMMC1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5PC100_PA_H=
SMMC(1)
> #define S3C_PA_HSMMC2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5PC100_PA_H=
SMMC(2)
>
> #define S3C64XX_PA_HSMMC(x) =C2=A0 =C2=A0 (0x7C200000 + ((x) * 0x1000=
00))
> #define S3C64XX_PA_HSMMC0 =C2=A0 =C2=A0 =C2=A0 S3C64XX_PA_HSMMC(0)
> #define S3C64XX_PA_HSMMC1 =C2=A0 =C2=A0 =C2=A0 S3C64XX_PA_HSMMC(1)
> #define S3C64XX_PA_HSMMC2 =C2=A0 =C2=A0 =C2=A0 S3C64XX_PA_HSMMC(2)
> #define S3C_PA_HSMMC0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S3C64XX_PA_H=
SMMC0
> #define S3C_PA_HSMMC1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S3C64XX_PA_H=
SMMC1
> #define S3C_PA_HSMMC2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S3C64XX_PA_H=
SMMC2
>
>>
>> I'm not sure if the above case is a good reference or not. The omap_=
init_mcspi
>> is called from omap2_init_devices(), while the registration can actu=
ally be
>> made into the board init code when that device is used (some of the =
McSPIs are
>> not used, and it's not necessary to register them), and the differen=
ces be
>> handled in the driver.
>
> that's just example how to use cpu_is_* in others. the current schme
> in samsung SoCs. we passed the different platform name for each arch.
> e.g., s3c2410_i2c or s3c2440_i2c then i2c driver detect it and handle
> properly. of course it assume base address is set correctly as above.

=46or the device driver, when you register two different i2c devices:

struct platform_device s3c2410_device_i2c {
	.name	=3D "s3c2410-i2c",
	...
};

struct platform_device s3c2440_device_i2c {
	.name	=3D "s3c2440-i2c",
	...
};

And register the corresponding one in your board code (your board code
knows exactly which one to register, no? )

And then in your i2c driver, you declare:

const static struct platform_device_id s3c_i2c_ids[] =3D {
	{ "s3c2410-i2c", S3C2410_SPECIFIC_FLAGS },
	{ "s3c2440-i2c", S3C2440_SPECIFIC_FLAGS },
	.....
};

Now you have S3C2410_SPECIFIC_FLAGS and S3C2440_SPECIFIC_FLAGS for your
device driver to distinguish between the differences. Normally, the
differences won't be much, and make sure you have good abstraction of
those _SPECIFIC_FLAGS.
>
> Thank you,
> Kyungmin Park
>>
>>>
>>> _______________________________________________
>>> linux-arm-kernel mailing list
>>> linux-arm-kernel@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
>>
>
