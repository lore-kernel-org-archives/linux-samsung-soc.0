From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Fix support of Exynos4210 rev0 SoC
Date: Tue, 21 May 2013 10:27:27 +0900
Message-ID: <0f8101ce55c2$5b084c90$1118e5b0$%kim@samsung.com>
References: <1368630484-29939-1-git-send-email-t.figa@samsung.com>
 <1623377.nVo7nUcid2@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62160 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755853Ab3EUB1a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 May 2013 21:27:30 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MN4009JAK0TNB80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 May 2013 10:27:28 +0900 (KST)
In-reply-to: <1623377.nVo7nUcid2@flatron>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, 'Kyungmin Park' <kyungmin.park@samsung.com>, olof@lixom.net

Tomasz Figa wrote:
> 
> Hi Kukjin,
> 
Hi,

> On Wednesday 15 of May 2013 17:08:04 Tomasz Figa wrote:
> > This patch extends exynos_init_time() function to handle Exynos4210 rev0
> > SoC, which differs in availability of system timers and needs different
> > clocksource initialization.
> >
> > This makes it possible to use exynos_init_time() function as init_time
> > callback for all Exynos-based boards, including Universal_C210, which
> > originally had to use samsung_timer_init().
> >
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  arch/arm/mach-exynos/Kconfig               |  3 ++-
> >  arch/arm/mach-exynos/common.c              | 30
> > +++++++++++++++++++++++++++++- arch/arm/mach-exynos/common.h
> >   |  2 ++
> >  arch/arm/mach-exynos/mach-universal_c210.c |  5 ++---
> >  4 files changed, 35 insertions(+), 5 deletions(-)
> 
> Could you pick this patch to your fixes branch?
> 
Yeah, I will after looking at.

> This is a fix of a regression in handling Exynos4210 rev0 SoC (e.g.
> Universal C210 board) introduced by patches merged to 3.10.
> 
OK, I see but I didn't review yet and I  will within a couple of days ;-)

- Kukjin
