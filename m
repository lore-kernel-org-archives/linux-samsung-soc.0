From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 02/13] ARM: S5P64X0: Update Kconfig and Makefile
Date: Thu, 02 Sep 2010 17:25:38 +0900
Message-ID: <004b01cb4a78$74552860$5cff7920$%kim@samsung.com>
References: <1283324960-21629-1-git-send-email-kgene.kim@samsung.com>
 <1283324960-21629-3-git-send-email-kgene.kim@samsung.com>
 <AANLkTin_aQvv_U9z7VxGM-3VWMj-iWdS928aB30sETWp@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:61536 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751205Ab0IBIZg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Sep 2010 04:25:36 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L84002WQ22MUD70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Sep 2010 17:25:34 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L84009NM22M4A@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Sep 2010 17:25:35 +0900 (KST)
In-reply-to: <AANLkTin_aQvv_U9z7VxGM-3VWMj-iWdS928aB30sETWp@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Kyungmin Park wrote:
>=20
> On Wed, Sep 1, 2010 at 4:09 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> > This patch updates the Kconfig and Makefile for the S5P6440 and S5P=
6450
> > machines. It also updates arch/arm/ Kconfig and Makefile to include=
 for
> > support ARCH_S5P64X0 with one kernel image.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 | =A0 16 +++---
> > =A0arch/arm/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> > =A0arch/arm/mach-s5p6440/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 33 ------------
> > =A0arch/arm/mach-s5p6440/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 25 ---------
> > =A0arch/arm/mach-s5p64x0/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 55
> ++++++++++++++++++++
> > =A0arch/arm/mach-s5p64x0/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 30 +++++++++++
> > =A0.../{mach-s5p6440 =3D> mach-s5p64x0}/Makefile.boot =A0 | =A0 =A0=
0
> > =A0arch/arm/plat-s5p/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A04 +-
> > =A08 files changed, 95 insertions(+), 70 deletions(-)
> > =A0delete mode 100644 arch/arm/mach-s5p6440/Kconfig
> > =A0delete mode 100644 arch/arm/mach-s5p6440/Makefile
> > =A0create mode 100644 arch/arm/mach-s5p64x0/Kconfig
> > =A0create mode 100644 arch/arm/mach-s5p64x0/Makefile
> > =A0rename arch/arm/{mach-s5p6440 =3D> mach-s5p64x0}/Makefile.boot (=
100%)
> >
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index a7ed21f..40e75b3 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -679,17 +679,15 @@ config ARCH_S3C64XX
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Samsung S3C64XX series based systems
> >
> > -config ARCH_S5P6440
> > - =A0 =A0 =A0 bool "Samsung S5P6440"
> > +config ARCH_S5P64X0
> > + =A0 =A0 =A0 bool "Samsung S5P6440 S5P6450"
> > =A0 =A0 =A0 =A0select CPU_V6
> > =A0 =A0 =A0 =A0select GENERIC_GPIO
> > =A0 =A0 =A0 =A0select HAVE_CLK
> > - =A0 =A0 =A0 select HAVE_S3C2410_WATCHDOG
> > =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
> > - =A0 =A0 =A0 select HAVE_S3C2410_I2C
> > - =A0 =A0 =A0 select HAVE_S3C_RTC
>=20
> Why HAVE_* is deleted?
>=20
Ok...will add it.

> > =A0 =A0 =A0 =A0help
> > - =A0 =A0 =A0 =A0 Samsung S5P6440 CPU based systems
> > + =A0 =A0 =A0 =A0 Samsung S5P64X0 CPU based systems, such as the Sa=
msung
> SMDK6440,
> > + =A0 =A0 =A0 =A0 SMDK6450.
> >

(snip)

> > +
> > +config MACH_SMDK6440
> > + =A0 =A0 =A0 bool "SMDK6440"
> > + =A0 =A0 =A0 select CPU_S5P6440
> > + =A0 =A0 =A0 select S3C_DEV_I2C1
> > + =A0 =A0 =A0 select S3C_DEV_RTC
> > + =A0 =A0 =A0 select S3C_DEV_WDT
> > + =A0 =A0 =A0 select SAMSUNG_DEV_ADC
> > + =A0 =A0 =A0 select SAMSUNG_DEV_TS
> > + =A0 =A0 =A0 select S5P64X0_SETUP_I2C1
> > + =A0 =A0 =A0 help
> > + =A0 =A0 =A0 =A0 Machine support for the Samsung SMDK6440
> > +
> > +config MACH_SMDK6450
> > + =A0 =A0 =A0 bool "SMDK6450"
> > + =A0 =A0 =A0 select CPU_S5P6450
> > + =A0 =A0 =A0 select S3C_DEV_I2C1
> > + =A0 =A0 =A0 select S3C_DEV_RTC
> > + =A0 =A0 =A0 select S3C_DEV_WDT
> > + =A0 =A0 =A0 select SAMSUNG_DEV_ADC
> > + =A0 =A0 =A0 select SAMSUNG_DEV_TS
> > + =A0 =A0 =A0 select S5P64X0_SETUP_I2C1
> > + =A0 =A0 =A0 help
> > + =A0 =A0 =A0 =A0 Machine support for the Samsung SMDK6450
>=20
> In most case SMDK has almost same functionality. make a common select
> e.g., SMDK_COMMON and each board just select it.

If required, will sort out next time with other architectures.

(snip)

> > +
> > +obj-$(CONFIG_MACH_SMDK6440) =A0 =A0+=3D mach-smdk6440.o
> > +obj-$(CONFIG_MACH_SMDK6450) =A0 =A0+=3D mach-smdk6450.o
> Are there difference between smdk6440 and smdk6450 except the SOC?
> If no, how about to make a single file as pxa or omap does?
>=20
Because each components on the board are different,
SMDK6440 and SMDK6450 need each machine file...

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
