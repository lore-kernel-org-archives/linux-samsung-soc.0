From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/2] ARM: S5PV210: remove useless ifdef in common.h
Date: Fri, 18 Jan 2013 22:58:17 -0800
Message-ID: <1358578697-29534-2-git-send-email-kgene.kim@samsung.com>
References: <1358578697-29534-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:61333 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750959Ab3ASG6z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jan 2013 01:58:55 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGV00GMR225AP60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Jan 2013 15:58:54 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGV001JK21ZID90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Jan 2013 15:58:54 +0900 (KST)
In-reply-to: <1358578697-29534-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

The mach-s5pv210 should be complied with selecting CPU_S5PV210,
so the 'ifdef' in common.h is not required.

Reported-by: Chen Gang <gang.chen@asianux.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/common.h |    9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm/mach-s5pv210/common.h b/arch/arm/mach-s5pv210/common.h
index 6ed2af5..0a1cc0ae 100644
--- a/arch/arm/mach-s5pv210/common.h
+++ b/arch/arm/mach-s5pv210/common.h
@@ -20,18 +20,9 @@ void s5pv210_setup_clocks(void);
 
 void s5pv210_restart(char mode, const char *cmd);
 
-#ifdef CONFIG_CPU_S5PV210
-
 extern  int s5pv210_init(void);
 extern void s5pv210_map_io(void);
 extern void s5pv210_init_clocks(int xtal);
 extern void s5pv210_init_uarts(struct s3c2410_uartcfg *cfg, int no);
 
-#else
-#define s5pv210_init_clocks NULL
-#define s5pv210_init_uarts NULL
-#define s5pv210_map_io NULL
-#define s5pv210_init NULL
-#endif
-
 #endif /* __ARCH_ARM_MACH_S5PV210_COMMON_H */
-- 
1.7.10.4
