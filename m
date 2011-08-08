From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Fix the IRQ definitions for MIPI CSIS device
Date: Mon, 08 Aug 2011 15:11:58 +0200
Message-ID: <1312809118-6181-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:60388 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753804Ab1HHNMH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Aug 2011 09:12:07 -0400
Received: from spt2.w1.samsung.com ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LPM00E7F204DK20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 14:12:04 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LPM00BNK203PF@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 14:12:04 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This is a regression fix after migration to the external GIC.
The breakage has been introduced in commit:
"ARM: EXYNOS4: modify interrupt mappings for external GIC"

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/irqs.h |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-exynos4/include/mach/irqs.h
index 934d2a4..f8952f8 100644
--- a/arch/arm/mach-exynos4/include/mach/irqs.h
+++ b/arch/arm/mach-exynos4/include/mach/irqs.h
@@ -80,9 +80,8 @@
 #define IRQ_HSMMC3		IRQ_SPI(76)
 #define IRQ_DWMCI		IRQ_SPI(77)
 
-#define IRQ_MIPICSI0		IRQ_SPI(78)
-
-#define IRQ_MIPICSI1		IRQ_SPI(80)
+#define IRQ_MIPI_CSIS0		IRQ_SPI(78)
+#define IRQ_MIPI_CSIS1		IRQ_SPI(80)
 
 #define IRQ_ONENAND_AUDI	IRQ_SPI(82)
 #define IRQ_ROTATOR		IRQ_SPI(83)
-- 
1.7.5.4
