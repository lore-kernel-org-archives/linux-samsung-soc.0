From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 4/5] ARM: EXYNOS: Increase maximum possible memory bank size
 to 512MiB
Date: Tue, 04 Sep 2012 10:50:08 +0200
Message-ID: <1346748609-11115-5-git-send-email-t.figa@samsung.com>
References: <1346748609-11115-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57829 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754739Ab2IDIum (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 04:50:42 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9T0086XHVDINR0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Sep 2012 17:50:41 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9T00APCHVV47N0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Sep 2012 17:50:41 +0900 (KST)
In-reply-to: <1346748609-11115-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>

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
