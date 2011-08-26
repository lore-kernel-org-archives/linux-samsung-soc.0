From: Hatim Ali <hatim.rv@samsung.com>
Subject: [PATCH 2/2] ARM: EXYNOS4: Update consistent DMA size to 8MB
Date: Fri, 26 Aug 2011 12:09:07 +0530
Message-ID: <1314340747-13816-3-git-send-email-hatim.rv@samsung.com>
References: <1314340747-13816-1-git-send-email-hatim.rv@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35950 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751846Ab1HZGjz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Aug 2011 02:39:55 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQI0088IVSW9JO0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Aug 2011 15:39:53 +0900 (KST)
Received: from hatim-linux.sisodomain.com ([107.108.73.95])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQI000VMVTXBB@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Aug 2011 15:39:53 +0900 (KST)
In-reply-to: <1314340747-13816-1-git-send-email-hatim.rv@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, t.stanislaws@samsung.com, banajit.g@samsung.com

Change the consistent DMA allocation to 8MB to support the
TVOUT driver.

NOTE: Once CMA support is merged into mainline, we will use it for memory
allocation.

Signed-off-by: Hatim Ali <hatim.rv@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/memory.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/memory.h b/arch/arm/mach-exynos4/include/mach/memory.h
index 374ef2c..33da4bb 100644
--- a/arch/arm/mach-exynos4/include/mach/memory.h
+++ b/arch/arm/mach-exynos4/include/mach/memory.h
@@ -14,6 +14,7 @@
 #define __ASM_ARCH_MEMORY_H __FILE__
 
 #define PLAT_PHYS_OFFSET		UL(0x40000000)
+#define CONSISTENT_DMA_SIZE		SZ_8M
 
 /* Maximum of 256MiB in one bank */
 #define MAX_PHYSMEM_BITS	32
-- 
1.7.2.3
