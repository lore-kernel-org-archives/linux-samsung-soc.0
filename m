From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH v4 05/12] ARM: EXYNOS: add support uart for EXYNOS4 and
 EXYNOS5
Date: Wed, 21 Mar 2012 11:45:41 +0100
Message-ID: <074401cd074f$c2946b90$47bd42b0$%szyprowski@samsung.com>
References: <1331736138-28964-1-git-send-email-kgene.kim@samsung.com>
 <1331736138-28964-6-git-send-email-kgene.kim@samsung.com>
 <CAJuYYwTJsA1M1Qj2P1-1K=pWzi0BPo8YJNDSx4NqGC7NX0030g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34652 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758278Ab2CUKpr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Mar 2012 06:45:47 -0400
Received: from euspt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M1800FC7DVP5Q@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Mar 2012 10:45:25 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M1800AWLDW61T@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Mar 2012 10:45:43 +0000 (GMT)
In-reply-to: <CAJuYYwTJsA1M1Qj2P1-1K=pWzi0BPo8YJNDSx4NqGC7NX0030g@mail.gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: olof@lixom.net, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org

Hello,

On Wednesday, March 21, 2012 10:14 AM Thomas Abraham wrote:

> On 14 March 2012 20:12, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Actually, the base address of uart is different between EXYNOS4
> > and EXYNOS5 and this patch enables to support uart for EXYNOS4
> > and EXYNOS5 SoCs at runtime.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
>=20
> [...]
>=20
> > diff --git a/arch/arm/mach-exynos/include/mach/debug-macro.S b/arch=
/arm/mach-
> exynos/include/mach/debug-macro.S
> > index 6cacf16..6c857ff 100644
> > --- a/arch/arm/mach-exynos/include/mach/debug-macro.S
> > +++ b/arch/arm/mach-exynos/include/mach/debug-macro.S
> > @@ -21,8 +21,13 @@
> > =A0 =A0 =A0 =A0 */
> >
> > =A0 =A0 =A0 =A0.macro addruart, rp, rv, tmp
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldr =A0 =A0 \rp, =3D S3C_PA_UART
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldr =A0 =A0 \rv, =3D S3C_VA_UART
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 \rp, #0x10000000
>=20
> This is physical address of Exynos4/5 CPUID register which cannot be
> used here. And virtual address S5P_VA_CPUID also cannot be used here
> since this will be called before paging_init when earlyprintk boot
> param is used. So, with this change, earlyprintk does not work for
> both Exynos4 and Exynos5.

I confirm, printascii freeze the system on EXYNOS4 after that patch,
tested on Exynos4210 Nuri board.

Best regards
--=20
Marek Szyprowski
Samsung Poland R&D Center
