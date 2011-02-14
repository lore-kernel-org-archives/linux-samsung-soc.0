From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [PATCH 0/11] ARM: EXYNOS4: Change ARCH name,
 ARCH_EXYNOS4 from ARCH_S5PV310
Date: Tue, 15 Feb 2011 08:53:12 +0900
Message-ID: <002d01cbcca2$5900e430$0b02ac90$@com>
References: <1297671787-10571-1-git-send-email-kgene.kim@samsung.com>
 <AANLkTim49dpC_r4BcK7tqo9wmu8W=qMDZE5szDUja6Wo@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:29313 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753803Ab1BNXxS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Feb 2011 18:53:18 -0500
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LGM00JY2T0SCD30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 08:53:16 +0900 (KST)
Received: from DOSBKIM7301 ([12.23.103.65])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LGM00EGWT0RXZ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 08:53:16 +0900 (KST)
In-reply-to: <AANLkTim49dpC_r4BcK7tqo9wmu8W=qMDZE5szDUja6Wo@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Hi,
I answer your questions in detail.

> On Monday, February 14, 2011 8:16 PM, Kyungmin Park wrote:
> 
> Hi,
> 
> Wow, fast move, but need to more explanation.
> what's the exact meaning of exynos4210?
> Exynos4 is prefix and remaining are variants?

Exynos4210 means below.

1st digit means ARM core version. In this case, 4 means Cortex A9.
(If we release cortex A15, it will be Exynos5xxx)
2nd digit means number of core.  2 mean dual core.
3rd digit means application category(LSI internal category).
4th digit means design rule (generation or shrink version)

> Now you changed all s5pv310 to exynos4. if new exynos4xxx chip are
> comes then how to handle this one?
> e.g., exynos4220 or later.
> it's also conflict with mach-exynos4. do you handle all exynos4 series
> at this mach directory?
> historically there's no rules of the base RAM address at least samsung
> chips.

Yes, we will handle all exynos4 series at mach-exynos4 directory.
In the past, there is no rule. 
But now, we are making consistent rules with AP design team.
So, new version of exynos4 series will have same base RAM address.

Thanks and regards,
Sangbeom Kim

> 
> Thank you,
> Kyungmin Park
> 
> On Mon, Feb 14, 2011 at 5:22 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > This patch set changes to ARCH_EXYNOS4 from ARCH_S5PV310 for supporting
> Samsung's
> > new brand name EXYNOS. Samsung officially announced about the brand name
> of EXYNOS
> > at MWC 2011 and The EXYNOS4 integrates a ARM Cortex A9 microporcessor
> with several
> > other peripherals to support features such as multimedai, storage,
> graphics and gaming.
> > Especially, the EXYNOS4210 CPU which is one of EXYNOS4 SoC series can be
> used in
> > products such as Mobile devices.
> >
> > This patch set consists of the following patches.
> >
> > [PATCH 01/11] ARM: EXYNOS4: Add EXYNOS4 CPU initialization support
> > [PATCH 02/11] ARM: EXYNOS4: Update Clock part
> > [PATCH 03/11] ARM: EXYNOS4: Update IRQ part
> > [PATCH 04/11] ARM: EXYNOS4: Update Timer part
> > [PATCH 05/11] ARM: EXYNOS4: Update device support
> > [PATCH 06/11] ARM: EXYNOS4: Moved board support files
> > [PATCH 07/11] ARM: EXYNOS4: Update Kconfig and Makefile for the new
> ARCH_EXYNOS4
> > [PATCH 08/11] ARM: exynos4_defconfig: Add defconfig for EXYNOS4
> > [PATCH 09/11] mtd: OneNAND: Change dependency of ARCH_EXYNOS4
> > [PATCH 10/11] ASoC: Change dependency of ARCH_EXYNOS4
> > [PATCH 11/11] tty: Change dependency of ARCH_EXYNOS4
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-
> soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
