From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH] ARM: S5PV310: Update MAX_COMBINER_NR
Date: Tue, 12 Oct 2010 16:16:03 +0900
Message-ID: <1286867763-21515-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:47063 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754413Ab0JLHZw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Oct 2010 03:25:52 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Jongpill Lee <boyko.lee@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Jongpill Lee <boyko.lee@samsung.com>

This patch updates MAX_COMBINER_NR from 39 to 40 because
S5PV310 need 39th combiner for including EINT16_31.

Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5pv310/include/mach/irqs.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/mach-s5pv310/include/mach/irqs.h
index b2acc62..f301af7 100644
--- a/arch/arm/mach-s5pv310/include/mach/irqs.h
+++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
@@ -89,6 +89,6 @@
 
 #define NR_IRQS			COMBINER_IRQ(MAX_COMBINER_NR, 0)
 
-#define MAX_COMBINER_NR		39
+#define MAX_COMBINER_NR		40
 
 #endif /* __ASM_ARCH_IRQS_H */
-- 
1.6.2.5
