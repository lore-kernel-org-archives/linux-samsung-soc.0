From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Fix support of Exynos4210 rev0 SoC
Date: Wed, 29 May 2013 11:16:14 +0200
Message-ID: <51A5C75E.7090006@samsung.com>
References: <1368630484-29939-1-git-send-email-t.figa@samsung.com>
 <1623377.nVo7nUcid2@flatron> <120501ce5752$6daef380$490cda80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25955 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965201Ab3E2JQ1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 May 2013 05:16:27 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MNJ009YNYUGJP00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 May 2013 10:16:25 +0100 (BST)
In-reply-to: <120501ce5752$6daef380$490cda80$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, 'Kyungmin Park' <kyungmin.park@samsung.com>, olof@lixom.net

Hello,

On 5/23/2013 3:11 AM, Kukjin Kim wrote:
> Kukjin Kim wrote:
> >
> > Tomasz Figa wrote:
> > >
> > > Hi Kukjin,
> > >
> > Hi,
> >
> > > On Wednesday 15 of May 2013 17:08:04 Tomasz Figa wrote:
> > > > This patch extends exynos_init_time() function to handle Exynos4210
> > rev0
> > > > SoC, which differs in availability of system timers and needs
> > different
> > > > clocksource initialization.
> > > >
> > > > This makes it possible to use exynos_init_time() function as init_time
> > > > callback for all Exynos-based boards, including Universal_C210, which
> > > > originally had to use samsung_timer_init().
> > > >
> > > > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > > ---
> > > >  arch/arm/mach-exynos/Kconfig               |  3 ++-
> > > >  arch/arm/mach-exynos/common.c              | 30
> > > > +++++++++++++++++++++++++++++- arch/arm/mach-exynos/common.h
> > > >   |  2 ++
> > > >  arch/arm/mach-exynos/mach-universal_c210.c |  5 ++---
> > > >  4 files changed, 35 insertions(+), 5 deletions(-)
> > >
> > > Could you pick this patch to your fixes branch?
> > >
> > Yeah, I will after looking at.
> >
> > > This is a fix of a regression in handling Exynos4210 rev0 SoC (e.g.
> > > Universal C210 board) introduced by patches merged to 3.10.
> > >
> > OK, I see but I didn't review yet and I  will within a couple of days ;-)
> >
> OK, looks fine, this will be sent to upstream during -rc for v3.10.
>
> But, Tomasz, as you know, non-DT supporting files will be gone away in
> v3.11, just note.

This patch is needed to get REV0 4210 based board working both in DT and 
non-DT
modes.

Best regards
-- 
Marek Szyprowski
Samsung R&D Institute Poland
