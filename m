From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: SAMSUNG: Make RTC driver dependency SoC specific
	instead of machine specific
Date: Wed, 21 Jul 2010 22:31:34 +0900
Message-ID: <AANLkTilt7F6CYZfuAqPmZrksCojoScij105wicbRd8DN@mail.gmail.com>
References: <1279702831-14968-1-git-send-email-kgene.kim@samsung.com>
	<AANLkTikIAuRD1mRpPpeHd-WqvHSG9S_nPYyE279J76zb@mail.gmail.com>
	<009301cb28d0$6db6b470$49241d50$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:43584 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757969Ab0GUNbg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 09:31:36 -0400
Received: by vws14 with SMTP id 14so1603867vws.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Jul 2010 06:31:34 -0700 (PDT)
In-Reply-To: <009301cb28d0$6db6b470$49241d50$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Atul Dahiya <atul.dahiya@samsung.com>

On Wed, Jul 21, 2010 at 9:29 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Kyungmin Park wrote:
>>
>> I don't see the Samsung SoCs don't have RTC feature.
>>
> Yes, you're right...
> But it doesn't mean the RTC driver can support every Samsung SoCs now=
=2E

Vice versa, if there's problem, we can fix it easily. No need to
modify Kconfig anymore, just fix it driver itself.
>
>> I think S3C_RTC only depends on PLAT_SAMSUNG so PLAT_SAMSUNG select
>> HAVE_S3C_RTC is enough.
>
> So I think, this is not bad.
>
>>
>> Thank you,
>> Kyungmin Park
>>
>> On Wed, Jul 21, 2010 at 6:00 PM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>> > From: Atul Dahiya <atul.dahiya@samsung.com>
>> >
>> > This patch moves the dependency of RTC driver from MACH_XXX(board)=
 to
>> > ARCH_XXX(SoC). This will enable all machines using Samsung S5P6440=
,
>> S5PC100
>> > and S5PV210 SoCs to use RTC driver by default.
>> >
>> > Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
>> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> > ---
>> > =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A03 +++
>> > =A0arch/arm/mach-s5p6440/Kconfig | =A0 =A01 -
>> > =A0arch/arm/mach-s5pc100/Kconfig | =A0 =A01 -
>> > =A0arch/arm/mach-s5pv210/Kconfig | =A0 =A02 --
>> > =A04 files changed, 3 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> > index 98922f7..ea668a4 100644
>> > --- a/arch/arm/Kconfig
>> > +++ b/arch/arm/Kconfig
>> > @@ -672,6 +672,7 @@ config ARCH_S5P6440
>> > =A0 =A0 =A0 =A0select GENERIC_GPIO
>> > =A0 =A0 =A0 =A0select HAVE_CLK
>> > =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
>> > + =A0 =A0 =A0 select HAVE_S3C_RTC
>> > =A0 =A0 =A0 =A0help
>> > =A0 =A0 =A0 =A0 =A0Samsung S5P6440 CPU based systems
>> >
>> > @@ -691,6 +692,7 @@ config ARCH_S5PC100
>> > =A0 =A0 =A0 =A0select CPU_V7
>> > =A0 =A0 =A0 =A0select ARM_L1_CACHE_SHIFT_6
>> > =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
>> > + =A0 =A0 =A0 select HAVE_S3C_RTC
>> > =A0 =A0 =A0 =A0help
>> > =A0 =A0 =A0 =A0 =A0Samsung S5PC100 series based systems
>> >
>> > @@ -701,6 +703,7 @@ config ARCH_S5PV210
>> > =A0 =A0 =A0 =A0select HAVE_CLK
>> > =A0 =A0 =A0 =A0select ARM_L1_CACHE_SHIFT_6
>> > =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
>> > + =A0 =A0 =A0 select HAVE_S3C_RTC
>> > =A0 =A0 =A0 =A0help
>> > =A0 =A0 =A0 =A0 =A0Samsung S5PV210/S5PC110 series based systems
>> >
>> > diff --git a/arch/arm/mach-s5p6440/Kconfig
> b/arch/arm/mach-s5p6440/Kconfig
>> > index b2d4716..de8f08d 100644
>> > --- a/arch/arm/mach-s5p6440/Kconfig
>> > +++ b/arch/arm/mach-s5p6440/Kconfig
>> > @@ -20,7 +20,6 @@ config MACH_SMDK6440
>> > =A0 =A0 =A0 =A0select SAMSUNG_DEV_ADC
>> > =A0 =A0 =A0 =A0select S3C_DEV_RTC
>> > =A0 =A0 =A0 =A0select S3C_DEV_WDT
>> > - =A0 =A0 =A0 select HAVE_S3C_RTC
>> > =A0 =A0 =A0 =A0select HAVE_S3C2410_WATCHDOG
>> > =A0 =A0 =A0 =A0help
>> > =A0 =A0 =A0 =A0 =A0Machine support for the Samsung SMDK6440
>> > diff --git a/arch/arm/mach-s5pc100/Kconfig
> b/arch/arm/mach-s5pc100/Kconfig
>> > index 2602895..e9c3d98 100644
>> > --- a/arch/arm/mach-s5pc100/Kconfig
>> > +++ b/arch/arm/mach-s5pc100/Kconfig
>> > @@ -48,7 +48,6 @@ config MACH_SMDKC100
>> > =A0 =A0 =A0 =A0select S5PC100_SETUP_FB_24BPP
>> > =A0 =A0 =A0 =A0select S5PC100_SETUP_I2C1
>> > =A0 =A0 =A0 =A0select S5PC100_SETUP_SDHCI
>> > - =A0 =A0 =A0 select HAVE_S3C_RTC
>> > =A0 =A0 =A0 =A0help
>> > =A0 =A0 =A0 =A0 =A0Machine support for the Samsung SMDKC100
>> >
>> > diff --git a/arch/arm/mach-s5pv210/Kconfig
> b/arch/arm/mach-s5pv210/Kconfig
>> > index 04597cc..7f029d1 100644
>> > --- a/arch/arm/mach-s5pv210/Kconfig
>> > +++ b/arch/arm/mach-s5pv210/Kconfig
>> > @@ -75,7 +75,6 @@ config MACH_SMDKV210
>> > =A0 =A0 =A0 =A0select SAMSUNG_DEV_TS
>> > =A0 =A0 =A0 =A0select S3C_DEV_RTC
>> > =A0 =A0 =A0 =A0select S3C_DEV_WDT
>> > - =A0 =A0 =A0 select HAVE_S3C_RTC
>> > =A0 =A0 =A0 =A0select HAVE_S3C2410_WATCHDOG
>> > =A0 =A0 =A0 =A0help
>> > =A0 =A0 =A0 =A0 =A0Machine support for Samsung SMDKV210
>> > @@ -86,7 +85,6 @@ config MACH_SMDKC110
>> > =A0 =A0 =A0 =A0select ARCH_SPARSEMEM_ENABLE
>> > =A0 =A0 =A0 =A0select S3C_DEV_RTC
>> > =A0 =A0 =A0 =A0select S3C_DEV_WDT
>> > - =A0 =A0 =A0 select HAVE_S3C_RTC
>> > =A0 =A0 =A0 =A0select HAVE_S3C2410_WATCHDOG
>> > =A0 =A0 =A0 =A0help
>> > =A0 =A0 =A0 =A0 =A0Machine support for Samsung SMDKC110
>> > --
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
