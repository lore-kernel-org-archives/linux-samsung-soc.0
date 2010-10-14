From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P: Fix missed IRQ_EINT_BIT()
Date: Thu, 14 Oct 2010 15:43:29 +0900
Message-ID: <1287038609-28291-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:34731 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753528Ab0JNGvS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Oct 2010 02:51:18 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

When merged patches, missed IRQ_EINT_BIT() definition from commit f7942788
(ARM: S5PV210: Add Power Management Support). The IRQ_EINT_BIT() is used
in the Power Management operation (plat-samsung/pm.c).

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/include/plat/irqs.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/include/plat/irqs.h b/arch/arm/plat-s5p/include/plat/irqs.h
index 7f653bc..ba9121c 100644
--- a/arch/arm/plat-s5p/include/plat/irqs.h
+++ b/arch/arm/plat-s5p/include/plat/irqs.h
@@ -94,6 +94,8 @@
 						((irq) - S5P_EINT_BASE1) : \
 						((irq) + 16 - S5P_EINT_BASE2))
 
+#define IRQ_EINT_BIT(x)		EINT_OFFSET(x)
+
 /* Typically only a few gpio chips require gpio interrupt support.
    To avoid memory waste irq descriptors are allocated only for
    S5P_GPIOINT_GROUP_COUNT chips, each with total number of
-- 
1.6.2.5
