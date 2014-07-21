From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH] ARM: dts: add CPU nodes for Exynos4 SoCs
Date: Mon, 21 Jul 2014 13:43:53 +0100
Message-ID: <CAD8Lp46eB3cDqD+1YMnWOG-V8CG7fCG1s2KH7znL0OrHSazRcQ@mail.gmail.com>
References: <1863399.9O2S91ZvEO@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:46199 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753118AbaGUMnz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jul 2014 08:43:55 -0400
Received: by mail-wg0-f51.google.com with SMTP id b13so6434583wgh.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2014 05:43:54 -0700 (PDT)
In-Reply-To: <1863399.9O2S91ZvEO@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Tomasz Figa <t.figa@samsung.com>, thomas.ab@samsung.com

On Fri, Jul 18, 2014 at 5:00 PM, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> Recent patch by Tomasz Figa ("irqchip: gic: Fix core ID calculation
> when topology is read from DT") fixed GIC driver to filter cluster ID
> from values returned by cpu_logical_map() for SoCs having registers
> mapped without per-CPU banking making it is possible to add CPU nodes
> for Exynos4 SoCs.  In case of Exynos SoCs these CPU nodes are also
> required by future changes adding initialization of cpuidle states in
> Exynos cpuidle driver through DT.

This conflicts with work in the thread "cpufreq: use generic cpufreq
drivers for exynos platforms" which is already in its 7th iteration.
Perhaps best to work directly with Thomas to help him finish that series?

Daniel
