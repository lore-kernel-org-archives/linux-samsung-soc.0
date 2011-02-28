From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Adds Samsung NURI board support
Date: Mon, 28 Feb 2011 20:20:29 +0900
Message-ID: <003701cbd739$85fc8e20$91f5aa60$%kim@samsung.com>
References: <4D676BB8.9040803@samsung.com>
 <002301cbd71b$1969bd00$4c3d3700$%kim@samsung.com>
 <4D6B5949.8020606@samsung.com>
 <002801cbd721$42e4bad0$c8ae3070$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:61845 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753344Ab1B1LUi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Feb 2011 06:20:38 -0500
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHB00CLIRID8OE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Feb 2011 20:20:37 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHB006KERID5F@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Feb 2011 20:20:37 +0900 (KST)
In-reply-to: <002801cbd721$42e4bad0$c8ae3070$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Minkyu Kang' <mk7.kang@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, kyungmin.park@samsung.com

Kukjin Kim wrote:
>=20
> Minkyu Kang wrote:
> >
> > Dear Kukjin Kim,
> >
> > 2011-02-28 =EC=98=A4=ED=9B=84 4:42, Kukjin Kim =EC=93=B4 =EA=B8=80:
> > > Minkyu Kang wrote:
> > >>
> > >> This patch adds Samsung NURI board support.
> > >>
> > >> Signed-off-by: Minkyu Kang <mk7.kang@samsung.com>
> > >> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > >> ---
> > >> This patch is base on next-exynos4 branch at kgene tree.
> > >>
> > >>  arch/arm/configs/exynos4_defconfig |    1 +
> > >>  arch/arm/mach-exynos4/Kconfig      |   15 +++
> > >>  arch/arm/mach-exynos4/Makefile     |    1 +
> > >>  arch/arm/mach-exynos4/mach-nuri.c  |  233
> > >> ++++++++++++++++++++++++++++++++++++
> > >>  4 files changed, 250 insertions(+), 0 deletions(-)
> > >>  create mode 100644 arch/arm/mach-exynos4/mach-nuri.c
> > >>
> > >
> > >> +enum fixed_regulator_id {
> > >> +	FIXED_REG_ID_MMC =3D 0,
> > >
> > > 	FIXED_REG_ID_MMC,
> > >
> > > (snip)
> > >
> > >> +static struct platform_device emmc_fixed_voltage =3D {
> > >> +	.name			=3D "reg-fixed-voltage",
> > >> +	.id			=3D FIXED_REG_ID_MMC,
> > >
> > > Is there any reason to use FIXED_REG_ID_MMC instead directly id 0=
?
> > >
> >
> > I'm going to add more IDs of fixed regulator that are LCD and Backl=
ight,
> and
> > so on.
> > So use enum values for avoid the hard coding.
> >
>=20
> Ok, applied this after removing "ifdef WATCHDOG".

Oops, NURI board is not registered yet :(
So can't merge this before updating it now.
Or should drop update defconfig from this...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
