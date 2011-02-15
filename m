From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [PATCH 0/11] ARM: EXYNOS4: Change ARCH name,
 ARCH_EXYNOS4 from ARCH_S5PV310
Date: Tue, 15 Feb 2011 10:52:09 +0900
Message-ID: <003301cbccb2$f8511720$e8f34560$@com>
References: <1297671787-10571-1-git-send-email-kgene.kim@samsung.com>
 <AANLkTim49dpC_r4BcK7tqo9wmu8W=qMDZE5szDUja6Wo@mail.gmail.com>
 <002d01cbcca2$5900e430$0b02ac90$@com>
 <AANLkTimOqg4XGMv+Gsarpa9U56MB3hxewhZxznHpx4-u@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40718 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751769Ab1BOBwR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Feb 2011 20:52:17 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LGM00L4PYJ3V5E0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 10:52:15 +0900 (KST)
Received: from DOSBKIM7301 ([12.23.103.65])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LGM000TEYJ3R1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 10:52:15 +0900 (KST)
In-reply-to: <AANLkTimOqg4XGMv+Gsarpa9U56MB3hxewhZxznHpx4-u@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Hi,

On Monday, February 14, 2011 8:16 PM, Kyungmin Park wrote:
> > Hi,
> > I answer your questions in detail.
> >
> >> On Monday, February 14, 2011 8:16 PM, Kyungmin Park wrote:
> >>
> >> Hi,
> >>
> >> Wow, fast move, but need to more explanation.
> >> what's the exact meaning of exynos4210?
> >> Exynos4 is prefix and remaining are variants?
> >
> > Exynos4210 means below.
> >
> > 1st digit means ARM core version. In this case, 4 means Cortex A9.
> > (If we release cortex A15, it will be Exynos5xxx)
> > 2nd digit means number of core. =A02 mean dual core.
> > 3rd digit means application category(LSI internal category).
> > 4th digit means design rule (generation or shrink version)
>=20
> Nice, I want these rules.
> >
> >> Now you changed all s5pv310 to exynos4. if new exynos4xxx chip are
> >> comes then how to handle this one?
> >> e.g., exynos4220 or later.
> >> it's also conflict with mach-exynos4. do you handle all exynos4 se=
ries
> >> at this mach directory?
> >> historically there's no rules of the base RAM address at least sam=
sung
> >> chips.
> >
> > Yes, we will handle all exynos4 series at mach-exynos4 directory.
> > In the past, there is no rule.
> > But now, we are making consistent rules with AP design team.
> > So, new version of exynos4 series will have same base RAM address.
>=20
> Okay, no problem with base ram address,
>=20
> Another one is how do you handle the GPIOs?
> Now it's also changed as EXYNOS4_GPXX, I think it's difficult to use
> the same banks as exynos4210 has if new chips are introduced.
> maybe IRQ also has similar issue.

We already had reviewed your concern before.
S5P6450 and S5P6440 is basically same processor.=20
But GPIO, IRQ and some peripheral is little different.
We can handle that by checking each processors chipid.

Please check the below patch.
http://www.spinics.net/lists/linux-samsung-soc/msg03530.html

Thanks and regards,
Sangbeom Kim
>=20
> Now these patches assumes all exynos4 has same gpios, irqs and so on.
>=20
> How do you think about it?
>=20
> Thank you,
> Kyungmin Park
> >
> > Thanks and regards,
> > Sangbeom Kim
> >
> >>
> >> Thank you,
> >> Kyungmin Park
> >>
> >> On Mon, Feb 14, 2011 at 5:22 PM, Kukjin Kim <kgene.kim@samsung.com=
>
> wrote:
> >> > This patch set changes to ARCH_EXYNOS4 from ARCH_S5PV310 for
> supporting
> >> Samsung's
> >> > new brand name EXYNOS. Samsung officially announced about the br=
and
> name
> >> of EXYNOS
> >> > at MWC 2011 and The EXYNOS4 integrates a ARM Cortex A9 microporc=
essor
> >> with several
> >> > other peripherals to support features such as multimedai, storag=
e,
> >> graphics and gaming.
> >> > Especially, the EXYNOS4210 CPU which is one of EXYNOS4 SoC serie=
s can
> be
> >> used in
> >> > products such as Mobile devices.
> >> >
> >> > This patch set consists of the following patches.
> >> >
> >> > [PATCH 01/11] ARM: EXYNOS4: Add EXYNOS4 CPU initialization suppo=
rt
> >> > [PATCH 02/11] ARM: EXYNOS4: Update Clock part
> >> > [PATCH 03/11] ARM: EXYNOS4: Update IRQ part
> >> > [PATCH 04/11] ARM: EXYNOS4: Update Timer part
> >> > [PATCH 05/11] ARM: EXYNOS4: Update device support
> >> > [PATCH 06/11] ARM: EXYNOS4: Moved board support files
> >> > [PATCH 07/11] ARM: EXYNOS4: Update Kconfig and Makefile for the =
new
> >> ARCH_EXYNOS4
> >> > [PATCH 08/11] ARM: exynos4_defconfig: Add defconfig for EXYNOS4
> >> > [PATCH 09/11] mtd: OneNAND: Change dependency of ARCH_EXYNOS4
> >> > [PATCH 10/11] ASoC: Change dependency of ARCH_EXYNOS4
> >> > [PATCH 11/11] tty: Change dependency of ARCH_EXYNOS4
> >> >
> >> > _______________________________________________
> >> > linux-arm-kernel mailing list
> >> > linux-arm-kernel@lists.infradead.org
> >> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >> >
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe linux-
> samsung-
> >> soc" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at =A0http://vger.kernel.org/majordomo-info.ht=
ml
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-
> soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
> >
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-
> soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
