From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] ARM: Exynos: Remove unused regs-mem.h file
Date: Mon, 26 Nov 2012 13:21:53 +0530
Message-ID: <1353916313-14343-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:11578 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751622Ab2KZHWG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 02:22:06 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME3007DR34SMDQ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Nov 2012 16:22:04 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME3003AU34NPYB0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Nov 2012 16:22:04 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com

Remove the unused regs-mem.h file

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/include/mach/regs-mem.h |   23 -----------------------
 1 files changed, 0 insertions(+), 23 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/include/mach/regs-mem.h

diff --git a/arch/arm/mach-exynos/include/mach/regs-mem.h b/arch/arm/mach-exynos/include/mach/regs-mem.h
deleted file mode 100644
index 0368b5a..0000000
--- a/arch/arm/mach-exynos/include/mach/regs-mem.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* linux/arch/arm/mach-exynos4/include/mach/regs-mem.h
- *
- * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com
- *
- * EXYNOS4 - SROMC and DMC register definitions
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef __ASM_ARCH_REGS_MEM_H
-#define __ASM_ARCH_REGS_MEM_H __FILE__
-
-#include <mach/map.h>
-
-#define S5P_DMC0_MEMCON_OFFSET		0x04
-
-#define S5P_DMC0_MEMTYPE_SHIFT		8
-#define S5P_DMC0_MEMTYPE_MASK		0xF
-
-#endif /* __ASM_ARCH_REGS_MEM_H */
-- 
1.6.6.rc2
