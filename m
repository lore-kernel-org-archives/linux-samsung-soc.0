From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 5/6] ARM: EXYNOS: Increase maximum possible memory bank size to
 512MiB
Date: Thu, 30 Aug 2012 09:31:42 +0200
Message-ID: <1346311903-15920-6-git-send-email-t.figa@samsung.com>
References: <1346311903-15920-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37356 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751194Ab2H3Hcj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Aug 2012 03:32:39 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9K00DL24X4I4B0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Aug 2012 16:32:23 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9K00G074XCNR40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Aug 2012 16:32:23 +0900 (KST)
In-reply-to: <1346311903-15920-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>

Some boards have larger memory banks than 256MiB. This patch increses
maximum bank size for Exynos-based boards to 512MiB.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/include/mach/memory.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/memory.h b/arch/arm/mach-exynos/include/mach/memory.h
index 374ef2c..d4db508 100644
--- a/arch/arm/mach-exynos/include/mach/memory.h
+++ b/arch/arm/mach-exynos/include/mach/memory.h
@@ -15,8 +15,8 @@
 
 #define PLAT_PHYS_OFFSET		UL(0x40000000)
 
-/* Maximum of 256MiB in one bank */
+/* Maximum of 512MiB in one bank */
 #define MAX_PHYSMEM_BITS	32
-#define SECTION_SIZE_BITS	28
+#define SECTION_SIZE_BITS	29
 
 #endif /* __ASM_ARCH_MEMORY_H */
-- 
1.7.12
