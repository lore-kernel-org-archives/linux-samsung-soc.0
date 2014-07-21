From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: dts: add CPU nodes for Exynos4 SoCs
Date: Mon, 21 Jul 2014 15:10:54 +0200
Message-ID: <10657588.befqTi5XsZ@amdc1032>
References: <1863399.9O2S91ZvEO@amdc1032>
 <CAD8Lp46eB3cDqD+1YMnWOG-V8CG7fCG1s2KH7znL0OrHSazRcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35662 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932104AbaGUNLP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jul 2014 09:11:15 -0400
In-reply-to: <CAD8Lp46eB3cDqD+1YMnWOG-V8CG7fCG1s2KH7znL0OrHSazRcQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Tomasz Figa <t.figa@samsung.com>, thomas.ab@samsung.com


Hi,

On Monday, July 21, 2014 01:43:53 PM Daniel Drake wrote:
> On Fri, Jul 18, 2014 at 5:00 PM, Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
> > Recent patch by Tomasz Figa ("irqchip: gic: Fix core ID calculation
> > when topology is read from DT") fixed GIC driver to filter cluster ID
> > from values returned by cpu_logical_map() for SoCs having registers
> > mapped without per-CPU banking making it is possible to add CPU nodes
> > for Exynos4 SoCs.  In case of Exynos SoCs these CPU nodes are also
> > required by future changes adding initialization of cpuidle states in
> > Exynos cpuidle driver through DT.
> 
> This conflicts with work in the thread "cpufreq: use generic cpufreq
> drivers for exynos platforms" which is already in its 7th iteration.
> Perhaps best to work directly with Thomas to help him finish that series?

Patch "[PATCH v7 4/6] ARM: dts: Exynos: add cpu nodes, opp and cpu clock
configuration data" from Thomas needs another revision anyway since it lacks
cluster ID in Exynos4210 CPU node.  It also mixes addition of CPU nodes
with cpufreq specific changes and IMHO addition of CPU nodes should be in
separate patch to ease bisection if any later problems turn up.  Therefore
I think that it would be the best if Thomas would rebase his work on top of
"irqchip: gic: Fix core ID calculation when topology is read from DT" patch
and this one.  Thomas, are you okay with this?

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
