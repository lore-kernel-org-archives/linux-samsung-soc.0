From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P: Change S5P_TIMER_IRQ based to 11 for SAMSUNG S5P series.
Date: Fri, 29 Jan 2010 09:08:28 +0900
Message-ID: <1264723708-5306-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39478 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753680Ab0A2ARZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jan 2010 19:17:25 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Atul Dahiya <atul.dahiya@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Atul Dahiya <atul.dahiya@samsung.com>

Currently, S5P_TIMER_IRQ is based at the end of VICs. This patch changes
the S5P_TIMER_IRQ base from end of VICs to 11 in ISA IRQ space.
No of VICs varies between SOCs. This causes an exception on S5P6442.

Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/include/plat/irqs.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-s5p/include/plat/irqs.h b/arch/arm/plat-s5p/include/plat/irqs.h
index 878acfe..101038d 100644
--- a/arch/arm/plat-s5p/include/plat/irqs.h
+++ b/arch/arm/plat-s5p/include/plat/irqs.h
@@ -74,7 +74,7 @@
 #define S5P_IRQ_VIC0(x)		(S5P_VIC0_BASE + (x))
 #define S5P_IRQ_VIC1(x)		(S5P_VIC1_BASE + (x))
 
-#define S5P_TIMER_IRQ(x)	S5P_IRQ(64 + (x))
+#define S5P_TIMER_IRQ(x)	S5P_IRQ(11 + (x))
 
 #define IRQ_TIMER0		S5P_TIMER_IRQ(0)
 #define IRQ_TIMER1		S5P_TIMER_IRQ(1)
-- 
1.6.2.5
