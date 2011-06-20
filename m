From: Changhwan Youn <chaos.youn@samsung.com>
Subject: [PATCH 3/7] ARM: EXYNOS4: set the affinity of mct1 interrupt using IRQ_MCT_L1
Date: Mon, 20 Jun 2011 16:34:14 +0900
Message-ID: <1308555258-4322-4-git-send-email-chaos.youn@samsung.com>
References: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58688 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753409Ab1FTHlZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 03:41:25 -0400
In-Reply-To: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, Changhwan Youn <chaos.youn@samsung.com>

IRQ_MCT_L1 is connected directly to GIC in external GIC mapping,
while in internal GIC mapping, it is connected to GIC through
interrupt combiner. Therfore the affinity for mct1 event timer
interrupt should be changed through IRQ_MCT_L1.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
---
 arch/arm/mach-exynos4/mct.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/mct.c b/arch/arm/mach-exynos4/mct.c
index 14ac10b..1ae059b 100644
--- a/arch/arm/mach-exynos4/mct.c
+++ b/arch/arm/mach-exynos4/mct.c
@@ -383,8 +383,8 @@ static void exynos4_mct_tick_init(struct clock_event_device *evt)
 		setup_irq(IRQ_MCT_L0, &mct_tick0_event_irq);
 	} else {
 		mct_tick1_event_irq.dev_id = &mct_tick[cpu];
-		irq_set_affinity(IRQ_MCT1, cpumask_of(1));
 		setup_irq(IRQ_MCT_L1, &mct_tick1_event_irq);
+		irq_set_affinity(IRQ_MCT_L1, cpumask_of(1));
 	}
 }
 
-- 
1.7.1
