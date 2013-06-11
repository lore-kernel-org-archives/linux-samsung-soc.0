From: Subash Patel <subash.rp@samsung.com>
Subject: [PATCH] ARM: exynos: change the PHYSMEM_BITS and SECTION_SIZE
Date: Tue, 11 Jun 2013 18:51:01 +0530
Message-ID: <1370956861-18710-1-git-send-email-subash.rp@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33162 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755193Ab3FKNTF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 09:19:05 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO800BM6CZSXVC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Jun 2013 22:19:04 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, catalin.marinas@arm.com, subash.rp@samsung.com

On exynos5440 there is DRAM on the 36-bit address range. Hence
this patch converts the MAX_PHYSMEM_BITS macro to 36 if LPAE is
enabled for the ARM architecture.

The conventional section size on exynos is 256M due to sparsemem.
Since exynos5440 has memory in multiples of 1G in 32-bit and 36-bit
range, this has now been modified to 31.

Signed-off-by: Subash Patel <subash.rp@samsung.com>
---
 arch/arm/mach-exynos/include/mach/memory.h |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mach-exynos/include/mach/memory.h b/arch/arm/mach-exynos/include/mach/memory.h
index 374ef2c..2a4cdb7 100644
--- a/arch/arm/mach-exynos/include/mach/memory.h
+++ b/arch/arm/mach-exynos/include/mach/memory.h
@@ -15,8 +15,13 @@
 
 #define PLAT_PHYS_OFFSET		UL(0x40000000)
 
+#ifndef CONFIG_ARM_LPAE
 /* Maximum of 256MiB in one bank */
 #define MAX_PHYSMEM_BITS	32
 #define SECTION_SIZE_BITS	28
+#else
+#define MAX_PHYSMEM_BITS	36
+#define SECTION_SIZE_BITS	31
+#endif
 
 #endif /* __ASM_ARCH_MEMORY_H */
-- 
1.7.10.4
