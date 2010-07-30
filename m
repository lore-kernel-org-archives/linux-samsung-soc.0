From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v3 3/3] ARM: SAMSUNG: i2c/busses: Add HAVE_S3C2410_I2C
	option to include I2C for Samsung SoCs
Date: Fri, 30 Jul 2010 11:42:41 +0900
Message-ID: <AANLkTimcZeZXoQ=i1rsbXiaU_FfSZSRi5NxMd7oYekj9@mail.gmail.com>
References: <1280396565-21014-1-git-send-email-kgene.kim@samsung.com>
	<AANLkTikyOUyz+sNPgBvWU8FvYa8HvgRY4P2udhMY=eOw@mail.gmail.com>
	<015601cb2f83$0225bd00$06713700$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:40594 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758366Ab0G3Cmn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jul 2010 22:42:43 -0400
In-Reply-To: <015601cb2f83$0225bd00$06713700$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, Naveen Krishna Ch <ch.naveen@samsung.com>

On Fri, Jul 30, 2010 at 10:03 AM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> Kyungmin Park wrote:
>>
>> On Thu, Jul 29, 2010 at 6:42 PM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>> > From: Naveen Krishna Ch <ch.naveen@samsung.com>
>> >
>> > This patch adds HAVE_S3C2410_I2C to control inclusion of I2C bus d=
river
>> > on Samsung SoCs and makes I2C bus driver dependency SoC specific i=
nstead
>> > of machine specific. This will enalbe all machines using Samsung
>> ARCH_S3C2410,
>> > _S3C64XX, _S5P6440, _S5PC100, and _S5PV210 to select the I2C drive=
r by
>> default
>>
>> What's the different from use PLAT_SAMSUNG?
>>
> Hi,
>
> Hmm..the difference?
>
> I remember, already said to you...
> Anyway actually, there was a stuff in here about that.
> Please refer to following...it may answer on your question.
>
> --- From Ben Dooks
>
>> =A0config RTC_DRV_S3C
>> =A0 =A0 =A0 tristate "Samsung S3C series SoC RTC"
>> - =A0 =A0 depends on ARCH_S3C2410
>> + =A0 =A0 depends on ARCH_S3C2410 || ARCH_S3C64XX
>
> I wonder whether just making this depend on either S3C_DEV_RTC, or si=
mply
> PLAT_SAMSUNG would just be a better choice.
>
> The S3C_DEV_RTC would mean that the drivers the core of the kernel
> would be built, but means that we can't speculatively build drivers
> if the kernel hasn't any machines using them.
>
> Making it depend on PLAT_SAMSUNG would mean it is available to all,
> but would be selectable even if there isn't a machine supporting it
> being built.
>
> The current situation would mean that we have to update driver Kconfi=
g
> entries each time a new SoC turns up...

In other word, It can make it workable when new SoCs arrives, even
though depends on PLAT_SAMSUNG.

If new chip has improved i2C IP then define new I2C drivers and modify
it as 'depends on PLAT_SAMUSNG if !NEW_IP_I2C'
and use another i2c drivers. of course it's depends on PLAT_SAMSUNG or
PLAT_S5P if NEW_IP_I2C.

>
> We could also have a HAVE_RTC_DRV_S3C so that all SoCs supporting thi=
s
> coudl select it independant of whether there is machine support.
>
> ---
>
> It doesn't mean that we should use HAVE_XXX in this case...
> But this way is better _now_ and they used same method in several dri=
vers.
> And if driver IP changes, we can use with HAVE_XXXV2...
>
>> config I2C_S3C2410
>> =A0 =A0 =A0 =A0 tristate "S3C2410 I2C Driver"
>> =A0 =A0 =A0 =A0 depends on PLAT_SAMSUNG
>>
>> Please don't populate the Kconfigs.
>>
>
> I hope you stop talking same issue without alternative...
>
>> Thank you,
>> Kyungmin Park
>>
>> >
>> > Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
>> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> > Cc: Ben Dooks <ben-linux@fluff.org>
>> > ---
>> > Changes since v2:
>> > - Added HAVE_S3C2410_I2C in drivers Kconfig
>> > - Made I2C bus driver dependency SoC specific
>> > - Selected additional support I2C bus driver for S5P6440, S5PC100,
>> > =A0and S5PV210
>> >
>> > Changes since v1:
>> > - Modifed the Kconfig help comments.
>> >
>> > =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 =A05 +++++
>> > =A0drivers/i2c/busses/Kconfig | =A0 11 +++++++++--
>> > =A02 files changed, 14 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> > index 98922f7..e922994 100644
>> > --- a/arch/arm/Kconfig
>> > +++ b/arch/arm/Kconfig
>> > @@ -634,6 +634,7 @@ config ARCH_S3C2410
>> > =A0 =A0 =A0 =A0select ARCH_HAS_CPUFREQ
>> > =A0 =A0 =A0 =A0select HAVE_CLK
>> > =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
>> > + =A0 =A0 =A0 select HAVE_S3C2410_I2C
>> > =A0 =A0 =A0 =A0help
>> > =A0 =A0 =A0 =A0 =A0Samsung S3C2410X CPU based systems, such as the=
 Simtec
>> Electronics
>> > =A0 =A0 =A0 =A0 =A0BAST (<http://www.simtec.co.uk/products/EB110IT=
X/>), the IPAQ 1940
>> or
>> > @@ -663,6 +664,7 @@ config ARCH_S3C64XX
>> > =A0 =A0 =A0 =A0select S3C_DEV_NAND
>> > =A0 =A0 =A0 =A0select USB_ARCH_HAS_OHCI
>> > =A0 =A0 =A0 =A0select SAMSUNG_GPIOLIB_4BIT
>> > + =A0 =A0 =A0 select HAVE_S3C2410_I2C
>> > =A0 =A0 =A0 =A0help
>> > =A0 =A0 =A0 =A0 =A0Samsung S3C64XX series based systems
>> >
>> > @@ -672,6 +674,7 @@ config ARCH_S5P6440
>> > =A0 =A0 =A0 =A0select GENERIC_GPIO
>> > =A0 =A0 =A0 =A0select HAVE_CLK
>> > =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
>> > + =A0 =A0 =A0 select HAVE_S3C2410_I2C
>> > =A0 =A0 =A0 =A0help
>> > =A0 =A0 =A0 =A0 =A0Samsung S5P6440 CPU based systems
>> >
>> > @@ -691,6 +694,7 @@ config ARCH_S5PC100
>> > =A0 =A0 =A0 =A0select CPU_V7
>> > =A0 =A0 =A0 =A0select ARM_L1_CACHE_SHIFT_6
>> > =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
>> > + =A0 =A0 =A0 select HAVE_S3C2410_I2C
>> > =A0 =A0 =A0 =A0help
>> > =A0 =A0 =A0 =A0 =A0Samsung S5PC100 series based systems
>> >
>> > @@ -701,6 +705,7 @@ config ARCH_S5PV210
>> > =A0 =A0 =A0 =A0select HAVE_CLK
>> > =A0 =A0 =A0 =A0select ARM_L1_CACHE_SHIFT_6
>> > =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
>> > + =A0 =A0 =A0 select HAVE_S3C2410_I2C
>> > =A0 =A0 =A0 =A0help
>> > =A0 =A0 =A0 =A0 =A0Samsung S5PV210/S5PC110 series based systems
>> >
>> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconf=
ig
>> > index bceafbf..f1751da 100644
>> > --- a/drivers/i2c/busses/Kconfig
>> > +++ b/drivers/i2c/busses/Kconfig
>> > @@ -521,12 +521,19 @@ config I2C_PXA_SLAVE
>> > =A0 =A0 =A0 =A0 =A0is necessary for systems where the PXA may be a=
 target on the
>> > =A0 =A0 =A0 =A0 =A0I2C bus.
>> >
>> > +config HAVE_S3C2410_I2C
>> > + =A0 =A0 =A0 bool
>> > + =A0 =A0 =A0 help
>> > + =A0 =A0 =A0 =A0 This will include I2C support for Samsung SoCs. =
If you want to
>> > + =A0 =A0 =A0 =A0 include I2C support for any machine, kindly sele=
ct this in the
>> > + =A0 =A0 =A0 =A0 respective Kconfig file.
>> > +
>> > =A0config I2C_S3C2410
>> > =A0 =A0 =A0 =A0tristate "S3C2410 I2C Driver"
>> > - =A0 =A0 =A0 depends on ARCH_S3C2410 || ARCH_S3C64XX
>> > + =A0 =A0 =A0 depends on HAVE_S3C2410_I2C
>> > =A0 =A0 =A0 =A0help
>> > =A0 =A0 =A0 =A0 =A0Say Y here to include support for I2C controlle=
r in the
>> > - =A0 =A0 =A0 =A0 Samsung S3C2410 based System-on-Chip devices.
>> > + =A0 =A0 =A0 =A0 Samsung SoCs.
>> >
>> > =A0config I2C_S6000
>> > =A0 =A0 =A0 =A0tristate "S6000 I2C support"
>> > --
>
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
