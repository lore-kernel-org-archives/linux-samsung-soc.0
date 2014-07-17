From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] irqchip: gic: Fix core ID calculation when topology is
 read from DT
Date: Thu, 17 Jul 2014 11:32:36 -0400
Message-ID: <20140717153236.GS13108@titan.lakedaemon.net>
References: <1405610624-18722-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mho-03-ewr.mailhop.org ([204.13.248.66]:61014 "EHLO
	mho-01-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S933006AbaGQPcu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 11:32:50 -0400
Content-Disposition: inline
In-Reply-To: <1405610624-18722-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

On Thu, Jul 17, 2014 at 05:23:44PM +0200, Tomasz Figa wrote:
> Certain GIC implementation, namely those found on earlier, single
> cluster, Exynos SoCs, have registers mapped without per-CPU banking,
> which means that the driver needs to use different offset for each CPU.
> 
> Currently the driver calculates the offset by multiplying value returned
> by cpu_logical_map() by CPU offset parsed from DT. This is correct when
> CPU topology is not specified in DT and aforementioned function returns
> core ID alone. However when DT contains CPU topology, the function
> changes to return cluster ID as well, which is non-zero on mentioned
> SoCs and so breaks the calculation in GIC driver.
> 
> This patch fixes this by masking out cluster ID in CPU offset
> calculation so that only core ID is considered. Multi-cluster Exynos
> SoCs already have banked GIC implementations, so this simple fix should
> be enough.
> 
> Reported-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Reported-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  drivers/irqchip/irq-gic.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

iiuc, this was introduced by:

  db0d4db22a78d ARM: gic: allow GIC to support non-banked setups

and so should be for v3.3 and up, correct?

thx,

Jason.
