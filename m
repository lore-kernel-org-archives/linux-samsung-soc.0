From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Make RTC driver dependency SoC specific
	instead of machine specific
Date: Wed, 21 Jul 2010 21:29:51 +0900
Message-ID: <009301cb28d0$6db6b470$49241d50$%kim@samsung.com>
References: <1279702831-14968-1-git-send-email-kgene.kim@samsung.com>
 <AANLkTikIAuRD1mRpPpeHd-WqvHSG9S_nPYyE279J76zb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54630 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752469Ab0GUM3z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 08:29:55 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5W00BQWQPM3640@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Jul 2010 21:29:46 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5W00D94QPLH9@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Jul 2010 21:29:46 +0900 (KST)
In-reply-to: <AANLkTikIAuRD1mRpPpeHd-WqvHSG9S_nPYyE279J76zb@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Atul Dahiya' <atul.dahiya@samsung.com>

Kyungmin Park wrote:
>=20
> I don't see the Samsung SoCs don't have RTC feature.
>=20
Yes, you're right...
But it doesn't mean the RTC driver can support every Samsung SoCs now.

> I think S3C_RTC only depends on PLAT_SAMSUNG so PLAT_SAMSUNG select
> HAVE_S3C_RTC is enough.

So I think, this is not bad.

>=20
> Thank you,
> Kyungmin Park
>=20
> On Wed, Jul 21, 2010 at 6:00 PM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > From: Atul Dahiya <atul.dahiya@samsung.com>
> >
> > This patch moves the dependency of RTC driver from MACH_XXX(board) =
to
> > ARCH_XXX(SoC). This will enable all machines using Samsung S5P6440,
> S5PC100
> > and S5PV210 SoCs to use RTC driver by default.
> >
> > Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A03 +++
> > =A0arch/arm/mach-s5p6440/Kconfig | =A0 =A01 -
> > =A0arch/arm/mach-s5pc100/Kconfig | =A0 =A01 -
> > =A0arch/arm/mach-s5pv210/Kconfig | =A0 =A02 --
> > =A04 files changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index 98922f7..ea668a4 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -672,6 +672,7 @@ config ARCH_S5P6440
> > =A0 =A0 =A0 =A0select GENERIC_GPIO
> > =A0 =A0 =A0 =A0select HAVE_CLK
> > =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
> > + =A0 =A0 =A0 select HAVE_S3C_RTC
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Samsung S5P6440 CPU based systems
> >
> > @@ -691,6 +692,7 @@ config ARCH_S5PC100
> > =A0 =A0 =A0 =A0select CPU_V7
> > =A0 =A0 =A0 =A0select ARM_L1_CACHE_SHIFT_6
> > =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
> > + =A0 =A0 =A0 select HAVE_S3C_RTC
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Samsung S5PC100 series based systems
> >
> > @@ -701,6 +703,7 @@ config ARCH_S5PV210
> > =A0 =A0 =A0 =A0select HAVE_CLK
> > =A0 =A0 =A0 =A0select ARM_L1_CACHE_SHIFT_6
> > =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
> > + =A0 =A0 =A0 select HAVE_S3C_RTC
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Samsung S5PV210/S5PC110 series based systems
> >
> > diff --git a/arch/arm/mach-s5p6440/Kconfig
b/arch/arm/mach-s5p6440/Kconfig
> > index b2d4716..de8f08d 100644
> > --- a/arch/arm/mach-s5p6440/Kconfig
> > +++ b/arch/arm/mach-s5p6440/Kconfig
> > @@ -20,7 +20,6 @@ config MACH_SMDK6440
> > =A0 =A0 =A0 =A0select SAMSUNG_DEV_ADC
> > =A0 =A0 =A0 =A0select S3C_DEV_RTC
> > =A0 =A0 =A0 =A0select S3C_DEV_WDT
> > - =A0 =A0 =A0 select HAVE_S3C_RTC
> > =A0 =A0 =A0 =A0select HAVE_S3C2410_WATCHDOG
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Machine support for the Samsung SMDK6440
> > diff --git a/arch/arm/mach-s5pc100/Kconfig
b/arch/arm/mach-s5pc100/Kconfig
> > index 2602895..e9c3d98 100644
> > --- a/arch/arm/mach-s5pc100/Kconfig
> > +++ b/arch/arm/mach-s5pc100/Kconfig
> > @@ -48,7 +48,6 @@ config MACH_SMDKC100
> > =A0 =A0 =A0 =A0select S5PC100_SETUP_FB_24BPP
> > =A0 =A0 =A0 =A0select S5PC100_SETUP_I2C1
> > =A0 =A0 =A0 =A0select S5PC100_SETUP_SDHCI
> > - =A0 =A0 =A0 select HAVE_S3C_RTC
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Machine support for the Samsung SMDKC100
> >
> > diff --git a/arch/arm/mach-s5pv210/Kconfig
b/arch/arm/mach-s5pv210/Kconfig
> > index 04597cc..7f029d1 100644
> > --- a/arch/arm/mach-s5pv210/Kconfig
> > +++ b/arch/arm/mach-s5pv210/Kconfig
> > @@ -75,7 +75,6 @@ config MACH_SMDKV210
> > =A0 =A0 =A0 =A0select SAMSUNG_DEV_TS
> > =A0 =A0 =A0 =A0select S3C_DEV_RTC
> > =A0 =A0 =A0 =A0select S3C_DEV_WDT
> > - =A0 =A0 =A0 select HAVE_S3C_RTC
> > =A0 =A0 =A0 =A0select HAVE_S3C2410_WATCHDOG
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Machine support for Samsung SMDKV210
> > @@ -86,7 +85,6 @@ config MACH_SMDKC110
> > =A0 =A0 =A0 =A0select ARCH_SPARSEMEM_ENABLE
> > =A0 =A0 =A0 =A0select S3C_DEV_RTC
> > =A0 =A0 =A0 =A0select S3C_DEV_WDT
> > - =A0 =A0 =A0 select HAVE_S3C_RTC
> > =A0 =A0 =A0 =A0select HAVE_S3C2410_WATCHDOG
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Machine support for Samsung SMDKC110
> > --

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
