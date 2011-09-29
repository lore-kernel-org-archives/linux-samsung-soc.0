From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 4/5] ARM: EXYNOS4: Add MCT support for EXYNOS4412
Date: Thu, 29 Sep 2011 17:13:03 +0900
Message-ID: <009701cc7e7f$9c3a8910$d4af9b30$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39697 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754853Ab1I2INS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Sep 2011 04:13:18 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS9000XMYTIX170@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Sep 2011 17:13:03 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LS900DVXYTQCW30@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 29 Sep 2011 17:13:03 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'LAK' <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org
Cc: chaos.youn@samsung.com, 'Kukjin Kim' <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

Current MCT implementation only provide 2 event timers,
thus cannot support EXYNOS4412 which has 4 CPU cores.
This patch fixes MCT implementation to support SoCs
with 4 cores.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/regs-mct.h |    5 +-
 arch/arm/mach-exynos4/mct.c                   |  113 ++++++++++++-------------
 2 files changed, 56 insertions(+), 62 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/regs-mct.h b/arch/arm/mach-exynos4/include/mach/regs-mct.h
index ca9c843..80dd02a 100644
--- a/arch/arm/mach-exynos4/include/mach/regs-mct.h
+++ b/arch/arm/mach-exynos4/include/mach/regs-mct.h
@@ -31,8 +31,9 @@
 #define EXYNOS4_MCT_G_INT_ENB		EXYNOS4_MCTREG(0x248)
 #define EXYNOS4_MCT_G_WSTAT		EXYNOS4_MCTREG(0x24C)
 
-#define EXYNOS4_MCT_L0_BASE		EXYNOS4_MCTREG(0x300)
-#define EXYNOS4_MCT_L1_BASE		EXYNOS4_MCTREG(0x400)
+#define _EXYNOS4_MCT_L_BASE		EXYNOS4_MCTREG(0x300)
+#define EXYNOS4_MCT_L_BASE(x)		(_EXYNOS4_MCT_L_BASE + (0x100 * x))
+#define EXYNOS4_MCT_L_MASK		(0xffffff00)
 
 #define MCT_L_TCNTB_OFFSET		(0x00)
 #define MCT_L_ICNTB_OFFSET		(0x08)
diff --git a/arch/arm/mach-exynos4/mct.c b/arch/arm/mach-exynos4/mct.c
index f43f3fa..3fdcf7d 100644
--- a/arch/arm/mach-exynos4/mct.c
+++ b/arch/arm/mach-exynos4/mct.c
@@ -41,9 +41,10 @@ static unsigned int mct_int_type;
 struct mct_clock_event_device {
 	struct clock_event_device *evt;
 	void __iomem *base;
+	char name[10];
 };
 
-struct mct_clock_event_device mct_tick[2];
+struct mct_clock_event_device mct_tick[NR_CPUS];
 
 static void exynos4_mct_write(unsigned int value, void *addr)
 {
@@ -53,57 +54,53 @@ static void exynos4_mct_write(unsigned int value, void *addr)
 
 	__raw_writel(value, addr);
 
-	switch ((u32) addr) {
-	case (u32) EXYNOS4_MCT_G_TCON:
-		stat_addr = EXYNOS4_MCT_G_WSTAT;
-		mask = 1 << 16;		/* G_TCON write status */
-		break;
-	case (u32) EXYNOS4_MCT_G_COMP0_L:
-		stat_addr = EXYNOS4_MCT_G_WSTAT;
-		mask = 1 << 0;		/* G_COMP0_L write status */
-		break;
-	case (u32) EXYNOS4_MCT_G_COMP0_U:
-		stat_addr = EXYNOS4_MCT_G_WSTAT;
-		mask = 1 << 1;		/* G_COMP0_U write status */
-		break;
-	case (u32) EXYNOS4_MCT_G_COMP0_ADD_INCR:
-		stat_addr = EXYNOS4_MCT_G_WSTAT;
-		mask = 1 << 2;		/* G_COMP0_ADD_INCR write status */
-		break;
-	case (u32) EXYNOS4_MCT_G_CNT_L:
-		stat_addr = EXYNOS4_MCT_G_CNT_WSTAT;
-		mask = 1 << 0;		/* G_CNT_L write status */
-		break;
-	case (u32) EXYNOS4_MCT_G_CNT_U:
-		stat_addr = EXYNOS4_MCT_G_CNT_WSTAT;
-		mask = 1 << 1;		/* G_CNT_U write status */
-		break;
-	case (u32)(EXYNOS4_MCT_L0_BASE + MCT_L_TCON_OFFSET):
-		stat_addr = EXYNOS4_MCT_L0_BASE + MCT_L_WSTAT_OFFSET;
-		mask = 1 << 3;		/* L0_TCON write status */
-		break;
-	case (u32)(EXYNOS4_MCT_L1_BASE + MCT_L_TCON_OFFSET):
-		stat_addr = EXYNOS4_MCT_L1_BASE + MCT_L_WSTAT_OFFSET;
-		mask = 1 << 3;		/* L1_TCON write status */
-		break;
-	case (u32)(EXYNOS4_MCT_L0_BASE + MCT_L_TCNTB_OFFSET):
-		stat_addr = EXYNOS4_MCT_L0_BASE + MCT_L_WSTAT_OFFSET;
-		mask = 1 << 0;		/* L0_TCNTB write status */
-		break;
-	case (u32)(EXYNOS4_MCT_L1_BASE + MCT_L_TCNTB_OFFSET):
-		stat_addr = EXYNOS4_MCT_L1_BASE + MCT_L_WSTAT_OFFSET;
-		mask = 1 << 0;		/* L1_TCNTB write status */
-		break;
-	case (u32)(EXYNOS4_MCT_L0_BASE + MCT_L_ICNTB_OFFSET):
-		stat_addr = EXYNOS4_MCT_L0_BASE + MCT_L_WSTAT_OFFSET;
-		mask = 1 << 1;		/* L0_ICNTB write status */
-		break;
-	case (u32)(EXYNOS4_MCT_L1_BASE + MCT_L_ICNTB_OFFSET):
-		stat_addr = EXYNOS4_MCT_L1_BASE + MCT_L_WSTAT_OFFSET;
-		mask = 1 << 1;		/* L1_ICNTB write status */
-		break;
-	default:
-		return;
+	if (likely(addr >= EXYNOS4_MCT_L_BASE(0))) {
+		u32 base = (u32) addr & EXYNOS4_MCT_L_MASK;
+		switch ((u32) addr & ~EXYNOS4_MCT_L_MASK) {
+		case (u32) MCT_L_TCON_OFFSET:
+			stat_addr = (void __iomem *) base + MCT_L_WSTAT_OFFSET;
+			mask = 1 << 3;		/* L_TCON write status */
+			break;
+		case (u32) MCT_L_ICNTB_OFFSET:
+			stat_addr = (void __iomem *) base + MCT_L_WSTAT_OFFSET;
+			mask = 1 << 1;		/* L_ICNTB write status */
+			break;
+		case (u32) MCT_L_TCNTB_OFFSET:
+			stat_addr = (void __iomem *) base + MCT_L_WSTAT_OFFSET;
+			mask = 1 << 0;		/* L_TCNTB write status */
+			break;
+		default:
+			return;
+		}
+	} else {
+		switch ((u32) addr) {
+		case (u32) EXYNOS4_MCT_G_TCON:
+			stat_addr = EXYNOS4_MCT_G_WSTAT;
+			mask = 1 << 16;		/* G_TCON write status */
+			break;
+		case (u32) EXYNOS4_MCT_G_COMP0_L:
+			stat_addr = EXYNOS4_MCT_G_WSTAT;
+			mask = 1 << 0;		/* G_COMP0_L write status */
+			break;
+		case (u32) EXYNOS4_MCT_G_COMP0_U:
+			stat_addr = EXYNOS4_MCT_G_WSTAT;
+			mask = 1 << 1;		/* G_COMP0_U write status */
+			break;
+		case (u32) EXYNOS4_MCT_G_COMP0_ADD_INCR:
+			stat_addr = EXYNOS4_MCT_G_WSTAT;
+			mask = 1 << 2;		/* G_COMP0_ADD_INCR write status */
+			break;
+		case (u32) EXYNOS4_MCT_G_CNT_L:
+			stat_addr = EXYNOS4_MCT_G_CNT_WSTAT;
+			mask = 1 << 0;		/* G_CNT_L write status */
+			break;
+		case (u32) EXYNOS4_MCT_G_CNT_U:
+			stat_addr = EXYNOS4_MCT_G_CNT_WSTAT;
+			mask = 1 << 1;		/* G_CNT_U write status */
+			break;
+		default:
+			return;
+		}
 	}
 
 	/* Wait maximum 1 ms until written values are applied */
@@ -332,7 +329,7 @@ static inline void exynos4_tick_set_mode(enum clock_event_mode mode,
 	}
 }
 
-static inline int exynos4_mct_tick_clear(struct mct_clock_event_device *mevt)
+static int exynos4_mct_tick_clear(struct mct_clock_event_device *mevt)
 {
 	struct clock_event_device *evt = mevt->evt;
 
@@ -383,14 +380,10 @@ static void exynos4_mct_tick_init(struct clock_event_device *evt)
 
 	mct_tick[cpu].evt = evt;
 
-	if (cpu == 0) {
-		mct_tick[cpu].base = EXYNOS4_MCT_L0_BASE;
-		evt->name = "mct_tick0";
-	} else {
-		mct_tick[cpu].base = EXYNOS4_MCT_L1_BASE;
-		evt->name = "mct_tick1";
-	}
+	mct_tick[cpu].base = EXYNOS4_MCT_L_BASE(cpu);
+	sprintf(mct_tick[cpu].name, "mct_tick%d", cpu);
 
+	evt->name = mct_tick[cpu].name;
 	evt->cpumask = cpumask_of(cpu);
 	evt->set_next_event = exynos4_tick_set_next_event;
 	evt->set_mode = exynos4_tick_set_mode;
-- 
1.7.1
