From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH] irqchip: gic: Allow setting affinity to offline CPUs
Date: Tue, 20 Aug 2013 18:11:10 +0200
Message-ID: <1377015070-26320-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:39871 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751391Ab3HTQLZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 12:11:25 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MRU00F5Z7MZB1C0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Aug 2013 17:11:23 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Sometimes it is necessary to fix interrupt affinity to an offline CPU,
for example in initialization of local timers. This patch modifies
.set_affinity() operation of irq-gic driver to fall back to any possible
CPU if no online CPU can be found in requested CPU mask.

This fixes broken Exynos4210 support since commit
	ee98d27df6 ARM: EXYNOS4: Divorce mct from local timer API
caused by timer initialization code unable to set affinity for local
timer interrupts.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/irqchip/irq-gic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index ee7c503..5f0797e 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -250,6 +250,15 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *mask_val,
 	unsigned int cpu = cpumask_any_and(mask_val, cpu_online_mask);
 	u32 val, mask, bit;
 
+	/*
+	 * If no online CPU could be found, fall back to any possible CPU.
+	 *
+	 * This is to allow setting affinity of some interrupts to a CPU
+	 * before it is marked as online, i.e. local timer initialization.
+	 */
+	if (cpu >= nr_cpu_ids)
+		cpu = cpumask_any_and(mask_val, cpu_possible_mask);
+
 	if (cpu >= NR_GIC_CPU_IF || cpu >= nr_cpu_ids)
 		return -EINVAL;
 
-- 
1.8.3.2
