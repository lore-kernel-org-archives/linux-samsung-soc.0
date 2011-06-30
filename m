From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH 2/2] ARM: EXYNOS4: Enable Internal RTC's Wakeup from
 Suspend-to-Ram
Date: Thu, 30 Jun 2011 10:52:30 +0900
Message-ID: <1309398750-25859-2-git-send-email-myungjoo.ham@samsung.com>
References: <1309398750-25859-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:24468 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757863Ab1F3Bwe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2011 21:52:34 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNK00F9ZYJAUV30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 10:52:31 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNK007J3YJJDY@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 10:52:31 +0900 (KST)
In-reply-to: <1309398750-25859-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Kyungmin Park <kyungmin.park@samsung.com>, myungjoo.ham@gmail.com

Allow Exynos4 to setup WAKEUP-MASK bits based on IRQ numbers. Currently,
Exynos4's cpu.c supports RTC ALARM/TICK based IRQs only.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/cpu.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
index 9babe44..fbb6f30 100644
--- a/arch/arm/mach-exynos4/cpu.c
+++ b/arch/arm/mach-exynos4/cpu.c
@@ -10,6 +10,7 @@
 
 #include <linux/sched.h>
 #include <linux/sysdev.h>
+#include <linux/irq.h>
 
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
@@ -23,6 +24,7 @@
 #include <plat/sdhci.h>
 #include <plat/devs.h>
 #include <plat/fimc-core.h>
+#include <plat/pm.h>
 
 #include <mach/regs-irq.h>
 
@@ -170,6 +172,8 @@ void __init exynos4_init_irq(void)
 	 * uses GIC instead of VIC.
 	 */
 	s5p_init_irq(NULL, 0);
+
+	irq_get_chip(IRQ_RTC_ALARM)->irq_set_wake = s3c_irq_wake;
 }
 
 struct sysdev_class exynos4_sysclass = {
-- 
1.7.4.1
