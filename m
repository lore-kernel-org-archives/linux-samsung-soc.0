From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 17/26] ARM: S3C2416: remove regs-s3c2416-mem.h and
 regs-s3c2416.h
Date: Wed, 02 Jan 2013 14:23:54 -0800
Message-ID: <1357165443-3716-18-git-send-email-kgene.kim@samsung.com>
References: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41066 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752764Ab3ABWY5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 17:24:57 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG000B7VRKLFV10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:24:56 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG00028PRKVD920@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:24:56 +0900 (KST)
In-reply-to: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

The headers no longer used anywhere now.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 .../mach-s3c24xx/include/mach/regs-s3c2416-mem.h   |   30 --------------------
 arch/arm/mach-s3c24xx/include/mach/regs-s3c2416.h  |   24 ----------------
 2 files changed, 54 deletions(-)
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/regs-s3c2416-mem.h
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/regs-s3c2416.h

diff --git a/arch/arm/mach-s3c24xx/include/mach/regs-s3c2416-mem.h b/arch/arm/mach-s3c24xx/include/mach/regs-s3c2416-mem.h
deleted file mode 100644
index 2f31b74..0000000
--- a/arch/arm/mach-s3c24xx/include/mach/regs-s3c2416-mem.h
+++ /dev/null
@@ -1,30 +0,0 @@
-/* arch/arm/mach-s3c2410/include/mach/regs-s3c2416-mem.h
- *
- * Copyright (c) 2009 Yauhen Kharuzhy <jekhor@gmail.com>,
- *	as part of OpenInkpot project
- * Copyright (c) 2009 Promwad Innovation Company
- *	Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * S3C2416 memory register definitions
-*/
-
-#ifndef __ASM_ARM_REGS_S3C2416_MEM
-#define __ASM_ARM_REGS_S3C2416_MEM
-
-#ifndef S3C2416_MEMREG
-#define S3C2416_MEMREG(x) (S3C24XX_VA_MEMCTRL + (x))
-#endif
-
-#define S3C2416_BANKCFG			S3C2416_MEMREG(0x00)
-#define S3C2416_BANKCON1		S3C2416_MEMREG(0x04)
-#define S3C2416_BANKCON2		S3C2416_MEMREG(0x08)
-#define S3C2416_BANKCON3		S3C2416_MEMREG(0x0C)
-
-#define S3C2416_REFRESH			S3C2416_MEMREG(0x10)
-#define S3C2416_TIMEOUT			S3C2416_MEMREG(0x14)
-
-#endif /*  __ASM_ARM_REGS_S3C2416_MEM */
diff --git a/arch/arm/mach-s3c24xx/include/mach/regs-s3c2416.h b/arch/arm/mach-s3c24xx/include/mach/regs-s3c2416.h
deleted file mode 100644
index e443167..0000000
--- a/arch/arm/mach-s3c24xx/include/mach/regs-s3c2416.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* arch/arm/mach-s3c2410/include/mach/regs-s3c2416.h
- *
- * Copyright (c) 2009 Yauhen Kharuzhy <jekhor@gmail.com>,
- *	as part of OpenInkpot project
- * Copyright (c) 2009 Promwad Innovation Company
- *	Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * S3C2416 specific register definitions
-*/
-
-#ifndef __ASM_ARCH_REGS_S3C2416_H
-#define __ASM_ARCH_REGS_S3C2416_H "s3c2416"
-
-#define S3C2416_SWRST		(S3C24XX_VA_CLKPWR + 0x44)
-#define S3C2416_SWRST_RESET	(0x533C2416)
-
-/* see regs-power.h for the other registers in the power block. */
-
-#endif	/* __ASM_ARCH_REGS_S3C2416_H */
-
-- 
1.7.10.4
