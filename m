From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH 1/2] Samsung SoC: Allow to enable wakeup with IRQs.
Date: Thu, 30 Jun 2011 10:52:29 +0900
Message-ID: <1309398750-25859-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:24468 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757529Ab1F3Bwd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2011 21:52:33 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNK00F9ZYJAUV30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 10:52:31 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNK007J3YJJDY@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 10:52:31 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Kyungmin Park <kyungmin.park@samsung.com>, myungjoo.ham@gmail.com

s3c_irq_wake is required by some external .c files to setup WAKEUP-MASK
bits based on IRQ numbers.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/include/plat/pm.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/pm.h b/arch/arm/plat-samsung/include/plat/pm.h
index 7fb6f6b..1279bc7 100644
--- a/arch/arm/plat-samsung/include/plat/pm.h
+++ b/arch/arm/plat-samsung/include/plat/pm.h
@@ -105,10 +105,12 @@ extern void s3c_pm_do_restore_core(struct sleep_save *ptr, int count);
 extern int s3c_irqext_wake(struct irq_data *data, unsigned int state);
 extern int s3c24xx_irq_suspend(void);
 extern void s3c24xx_irq_resume(void);
+extern int s3c_irq_wake(struct irq_data *data, unsigned int state);
 #else
 #define s3c_irqext_wake NULL
 #define s3c24xx_irq_suspend NULL
 #define s3c24xx_irq_resume  NULL
+#define s3c_irq_wake NULL
 #endif
 
 extern struct syscore_ops s3c24xx_irq_syscore_ops;
-- 
1.7.4.1
