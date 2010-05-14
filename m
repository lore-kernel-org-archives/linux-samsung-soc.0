From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 01/15] ARM: Samsung: fix broken timer irq base
Date: Fri, 14 May 2010 08:18:52 +0200
Message-ID: <1273817946-29404-2-git-send-email-m.szyprowski@samsung.com>
References: <1273817946-29404-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56106 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753480Ab0ENGTO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 May 2010 02:19:14 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L2E005HFC80QS90@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 07:19:12 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L2E0025UC7ZLU@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 07:19:12 +0100 (BST)
In-reply-to: <1273817946-29404-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

Timer interrupts range was defined as 43-47, what overlaps with VIC0 range
(32-64). This was caused probably by a typo while the common interrupts
definition was refactored. This patch moves timer interrupt range to safe
area of 11-15 (just before uart range).

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-s5p/include/plat/irqs.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-s5p/include/plat/irqs.h b/arch/arm/plat-s5p/include/plat/irqs.h
index 42e757f..9ff3d71 100644
--- a/arch/arm/plat-s5p/include/plat/irqs.h
+++ b/arch/arm/plat-s5p/include/plat/irqs.h
@@ -79,7 +79,7 @@
 #define S5P_IRQ_VIC2(x)		(S5P_VIC2_BASE + (x))
 #define S5P_IRQ_VIC3(x)		(S5P_VIC3_BASE + (x))
 
-#define S5P_TIMER_IRQ(x)	S5P_IRQ(11 + (x))
+#define S5P_TIMER_IRQ(x)	(11 + (x))
 
 #define IRQ_TIMER0		S5P_TIMER_IRQ(0)
 #define IRQ_TIMER1		S5P_TIMER_IRQ(1)
-- 
1.6.4
