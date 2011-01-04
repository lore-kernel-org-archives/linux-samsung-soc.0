From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/3] ARM: S5PV310: Add irq definition for kernel global timer
Date: Tue,  4 Jan 2011 14:45:25 +0900
Message-ID: <1294119926-23189-3-git-send-email-kgene.kim@samsung.com>
References: <1294119926-23189-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39982 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751061Ab1ADGKd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jan 2011 01:10:33 -0500
In-Reply-To: <1294119926-23189-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

This patch adds IRQ_MCT_G0 to irq map. IRQ_MCT_G0 is an interrupt of MCT
comparator and used for kernel global timer.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/include/mach/irqs.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/mach-s5pv310/include/mach/irqs.h
index f9a2830..edb2445 100644
--- a/arch/arm/mach-s5pv310/include/mach/irqs.h
+++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
@@ -107,6 +107,7 @@
 #define IRQ_MCT_L0		COMBINER_IRQ(51, 0)
 
 #define IRQ_WDT			COMBINER_IRQ(53, 0)
+#define IRQ_MCT_G0		COMBINER_IRQ(53, 4)
 
 #define MAX_COMBINER_NR		54
 
-- 
1.6.2.5
