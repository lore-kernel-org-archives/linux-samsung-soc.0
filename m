From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: Exynos4: fix compilation break
Date: Tue, 07 Jun 2011 09:10:10 +0200
Message-ID: <1307430610-16935-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38680 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750801Ab1FGHKR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 03:10:17 -0400
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LME00EEIRX3IK@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jun 2011 08:10:15 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LME00ADSRX2P6@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jun 2011 08:10:14 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

The patch "ARM: SAMSUNG: Add support for pre-sleep/post-restore gpio
control" broke compilation on Exynos4 platform with power management
enabled. This patch adds missing stubs that fixes this issue.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/pm-core.h |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/pm-core.h b/arch/arm/mach-exynos4/include/mach/pm-core.h
index f26e46b..1df3b81 100644
--- a/arch/arm/mach-exynos4/include/mach/pm-core.h
+++ b/arch/arm/mach-exynos4/include/mach/pm-core.h
@@ -47,3 +47,13 @@ static inline void s3c_pm_arch_update_uart(void __iomem *regs,
 {
 	/* nothing here yet */
 }
+
+static inline void s3c_pm_restored_gpios(void)
+{
+	/* nothing here yet */
+}
+
+static inline void s3c_pm_saved_gpios(void)
+{
+	/* nothing here yet */
+}
-- 
1.7.1.569.g6f426
