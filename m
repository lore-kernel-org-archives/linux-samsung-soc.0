From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Remove the L2 cache latency setting for
 EXYNOS5
Date: Wed, 27 Jun 2012 08:57:13 +0900
Message-ID: <006d01cd53f7$6877ed90$3967c8b0$%kim@samsung.com>
References: <038301cd4f47$8202b420$86081c60$%kim@samsung.com>
 <CAPLVkLsgi3ST622ZhRusJz5OHV6MJYP7SNkj2Mh-QPos1AWyhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47188 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754382Ab2FZX5Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jun 2012 19:57:16 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M69006MY1723OH0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jun 2012 08:57:14 +0900 (KST)
Received: from DOBOOJINKIM03 ([12.23.119.77])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6900GVH17D8L60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jun 2012 08:57:13 +0900 (KST)
In-reply-to: <CAPLVkLsgi3ST622ZhRusJz5OHV6MJYP7SNkj2Mh-QPos1AWyhQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Joonyoung Shim' <dofmind@gmail.com>, 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: 'Russell King' <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Joonyoung Shim wrote:

> I don't understand this. Do you mean that BL1 codes do it?
> I also wonder how enable L2 cache at the exynos5.
Yes, the latency configuration of L2 cache is located on IROM or BL1 co=
de.
It can remove the overhead about cache reset and cache flush.
And, Kernel enables L2 cache.
Thanks.
>
> > no longer need that in the kernel. It helps to reduce
> > booting time (no need cache disable and cache enable).
> >
> > Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0arch/arm/mach-exynos/common.c | =A0 25 -------------------------
> > =A01 files changed, 0 insertions(+), 25 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/c=
ommon.c
> > index 742edd3..0ec1a91 100644
> > --- a/arch/arm/mach-exynos/common.c
> > +++ b/arch/arm/mach-exynos/common.c
> > @@ -712,31 +712,6 @@ static int __init exynos4_l2x0_cache_init(void=
)
> > =A0early_initcall(exynos4_l2x0_cache_init);
> > =A0#endif
> >
> > -static int __init exynos5_l2_cache_init(void)
> > -{
> > - =A0 =A0 =A0 unsigned int val;
> > -
> > - =A0 =A0 =A0 if (!soc_is_exynos5250())
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> > -
> > - =A0 =A0 =A0 asm volatile("mrc p15, 0, %0, c1, c0, 0\n"
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"bic %0, %0, #(1 << 2)\n" =
=A0/* cache disable */
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mcr p15, 0, %0, c1, c0, 0=
\n"
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mrc p15, 1, %0, c9, c0, 2=
\n"
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "=3Dr"(val));
> > -
> > - =A0 =A0 =A0 val |=3D (1 << 9) | (1 << 5) | (2 << 6) | (2 << 0);
> > -
> > - =A0 =A0 =A0 asm volatile("mcr p15, 1, %0, c9, c0, 2\n" : : "r"(va=
l));
> > - =A0 =A0 =A0 asm volatile("mrc p15, 0, %0, c1, c0, 0\n"
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"orr %0, %0, #(1 << 2)\n" =
=A0/* cache enable */
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mcr p15, 0, %0, c1, c0, 0=
\n"
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: : "r"(val));
> > -
> > - =A0 =A0 =A0 return 0;
> > -}
> > -early_initcall(exynos5_l2_cache_init);
> > -
> > =A0static int __init exynos_init(void)
> > =A0{
> > =A0 =A0 =A0 =A0printk(KERN_INFO "EXYNOS: Initializing architecture\=
n");
> > --
> > 1.7.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
>
> --
> - Joonyoung Shim
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
