From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: add initial dts file for ORIGEN4QUAD
Date: Tue, 27 Nov 2012 12:32:24 +0100
Message-ID: <3266033.etMBVlqbyR@amdc1227>
References: <1353929538-24173-1-git-send-email-kh.choi@insignal.co.kr>
 <1361143.TuLvfqvMr1@amdc1227> <50B495B9.4060005@insignal.co.kr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:19683 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755442Ab2K0Lc3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 06:32:29 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME500JBC9DWLIK0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 20:32:28 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME500C049E2YLA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 20:32:27 +0900 (KST)
In-reply-to: <50B495B9.4060005@insignal.co.kr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "kh.choi" <kh.choi@insignal.co.kr>
Cc: Kyungmin Park <kmpark@infradead.org>, chlrbgh0@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Kyuho,

On Tuesday 27 of November 2012 19:28:09 kh.choi wrote:
> Hi Tomasz,
>=20
> 2012-11-26 =EC=98=A4=ED=9B=84 8:57, Tomasz Figa =EC=93=B4 =EA=B8=80:
> > Hi Kyungmin, Kyuho,
> >=20
> > On Monday 26 of November 2012 20:52:12 Kyungmin Park wrote:
> >> Hi,
> >>=20
> >> On 11/26/12, chlrbgh0@gmail.com <chlrbgh0@gmail.com> wrote:
> >>> From: Kyuho Choi <kh.choi@insignal.co.kr>
> >>>=20
> >>> This patch adds initial dts file for ORIGEN4QUAD board.
> >>> ORIGEN4QUAD board based on Samsung EXYNOS4412 SoC.
> >>> More properties will be added later.
> >>>=20
> >>> Signed-off-by: Kyuho Choi <kh.choi@insignal.co.kr>
> >>> ---
> >>>=20
> >>>   arch/arm/boot/dts/exynos4412-origen4quad.dts |   45
> >>>=20
> >>> ++++++++++++++++++++++++++
> >>>=20
> >>>   1 files changed, 45 insertions(+), 0 deletions(-)
> >>>   create mode 100644 arch/arm/boot/dts/exynos4412-origen4quad.dts
> >>>=20
> >>> diff --git a/arch/arm/boot/dts/exynos4412-origen4quad.dts
> >>> b/arch/arm/boot/dts/exynos4412-origen4quad.dts
> >>> new file mode 100644
> >>> index 0000000..390a2ab
> >>> --- /dev/null
> >>> +++ b/arch/arm/boot/dts/exynos4412-origen4quad.dts
> >>> @@ -0,0 +1,45 @@
> >>> +/*
> >>> + * Samsung's Exynos4412 based Origen4Quad board device tree sour=
ce
> >>> + *
> >>> + * Copyright (c) 2012-2013 Isnignal Co., Ltd.
> >>> + *		http://www.insignal.co.kr
> >>> + *
> >>> + * Device tree source file for Insignal's Origen4Quad board whic=
h
> >>> is
> >>> based on
> >>> + * Samsung's Exynos4412 SoC.
> >>> + *
> >>> + * This program is free software; you can redistribute it and/or
> >>> modify + * it under the terms of the GNU General Public License
> >>> version 2 as + * published by the Free Software Foundation.
> >>> +*/
> >>> +
> >>> +/dts-v1/;
> >>> +/include/ "exynos4412.dtsi"
> >>> +
> >>> +/ {
> >>> +	model =3D "Insignal Origen4Quad board based on Exynos4412";
> >>> +	compatible =3D "insignal,origen4quad", "samsung,exynos4412";
> >>> +
> >>> +	memory {
> >>> +		reg =3D <0x40000000 0x40000000>;
> >>> +	};
> >>=20
> >> does it test to boot with this dts file?
> >> does it support 1GiB memory section?
> >=20
> > It will most likely fail to boot with u-boot versions that do not
> > support replacing memory configuration in device tree and without
> > CONFIG_ARM_ATAG_DTB_COMPAT enabled.
> >=20
> > In other words, the memory setup from dts is used only if both of t=
he
> >=20
> > following are true:
> >   - CONFIG_ARM_ATAG_DTB_COMPAT is disabled
> >   - u-boot does not modify memory setup in device tree passed to th=
e
> >   kernel
> I'd working based on `exynos4_defconfig` for ORIGEN4QUAD board.
> `exynos4_defconfig`s default disabled CONFIG_ARM_ATAG_DTB_COMPAT.
> And ORIGEN4QUAD working on u-boot v2012.10.

This means that u-boot version you use modifies memory setup in device=20
tree before passing it to the kernel.

You can try to boot with empty memory node or no memory node at all and=
=20
check what memory configuration the kernel gets in /proc/device-tree, f=
or=20
example using

xxd -c8 -g4 /proc/device-tree/memory/reg

Still, the maximum section size for mach-exynos is set in kernel to 256=
MiB=20
and so the memory in reg property such be defined in chunks less or equ=
al=20
256 MiB.

Best regards,
--=20
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
