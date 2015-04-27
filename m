From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: exynos: Fix wake-up interrupts for Exynos3250
Date: Mon, 27 Apr 2015 09:53:28 +0900
Message-ID: <0d0201d08084$93191f80$b94b5e80$@kernel.org>
References: <1429724452-26563-1-git-send-email-marc.zyngier@arm.com>
 <CAJKOXPd45=c5fybCiyExdyRUZcC9p8zdZqZPPYcjiZd5x28sHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47085 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751463AbbD0Axb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 26 Apr 2015 20:53:31 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NNF00J65X54Y760@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Apr 2015 09:53:29 +0900 (KST)
In-reply-to: <CAJKOXPd45=c5fybCiyExdyRUZcC9p8zdZqZPPYcjiZd5x28sHw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Marc Zyngier' <marc.zyngier@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>

Krzysztof Kozlowski wrote:
> 
> 2015-04-23 2:40 GMT+09:00 Marc Zyngier <marc.zyngier@arm.com>:
> > Commit 8b283c025443 (ARM: exynos4/5: convert pmu wakeup to
> > stacked domains) changed the Exynos PMU code to use stacked
> > domains. This has led to a number of interrupt numbers to be
> > fixed.
> >
> > In the meantime, support for Exynos 3250 was added, missing
> > the required change to this platform. This amounts to revert
> > ace283a04a4a (ARM: EXYNOS: Fix wrong hwirq of RTC interrupt
> > for Exynos3250 SoC), as the initial patch was right, just a
> > bit early...
> >
> > Cc: Chanwoo Choi <cw00.choi@samsung.com>
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Cc: Kukjin Kim <kgene@kernel.org>
> > Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> > ---
> >  arch/arm/mach-exynos/suspend.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
Thanks and applied.

- Kukjin
