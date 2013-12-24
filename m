From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH RFC 07/11] ARM: SAMSUNG: pm: Move s3c_pm_check_* prototypes to
 plat/pm-common.h
Date: Tue, 24 Dec 2013 15:14:30 +0100
Message-ID: <1387894474-14428-7-git-send-email-t.figa@samsung.com>
References: <1387894474-14428-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36077 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752281Ab3LXOPN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Dec 2013 09:15:13 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MYB00D5ZE97FE60@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Dec 2013 14:15:07 +0000 (GMT)
In-reply-to: <1387894474-14428-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>

To allow using Samsung PM memory check helpers on platforms that do not
use the legacy Samsung PM core, this patch moves prototypes of relevant
functions to plat/pm-common.h header.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/plat-samsung/include/plat/pm-common.h | 14 ++++++++++++++
 arch/arm/plat-samsung/include/plat/pm.h        | 14 --------------
 arch/arm/plat-samsung/pm-check.c               |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/pm-common.h b/arch/arm/plat-samsung/include/plat/pm-common.h
index 2268db6..997b10a 100644
--- a/arch/arm/plat-samsung/include/plat/pm-common.h
+++ b/arch/arm/plat-samsung/include/plat/pm-common.h
@@ -93,4 +93,18 @@ static inline void s3c_pm_save_uarts(void) { }
 static inline void s3c_pm_restore_uarts(void) { }
 #endif
 
+/* suspend memory checking */
+
+#ifdef CONFIG_SAMSUNG_PM_CHECK
+extern void s3c_pm_check_prepare(void);
+extern void s3c_pm_check_restore(void);
+extern void s3c_pm_check_cleanup(void);
+extern void s3c_pm_check_store(void);
+#else
+#define s3c_pm_check_prepare() do { } while(0)
+#define s3c_pm_check_restore() do { } while(0)
+#define s3c_pm_check_cleanup() do { } while(0)
+#define s3c_pm_check_store()   do { } while(0)
+#endif
+
 #endif
diff --git a/arch/arm/plat-samsung/include/plat/pm.h b/arch/arm/plat-samsung/include/plat/pm.h
index 4099e8d..e17d871 100644
--- a/arch/arm/plat-samsung/include/plat/pm.h
+++ b/arch/arm/plat-samsung/include/plat/pm.h
@@ -80,20 +80,6 @@ extern void s3c_pm_debug_smdkled(u32 set, u32 clear);
 static inline void s3c_pm_debug_smdkled(u32 set, u32 clear) { }
 #endif /* CONFIG_S3C_PM_DEBUG_LED_SMDK */
 
-/* suspend memory checking */
-
-#ifdef CONFIG_SAMSUNG_PM_CHECK
-extern void s3c_pm_check_prepare(void);
-extern void s3c_pm_check_restore(void);
-extern void s3c_pm_check_cleanup(void);
-extern void s3c_pm_check_store(void);
-#else
-#define s3c_pm_check_prepare() do { } while(0)
-#define s3c_pm_check_restore() do { } while(0)
-#define s3c_pm_check_cleanup() do { } while(0)
-#define s3c_pm_check_store()   do { } while(0)
-#endif
-
 /**
  * s3c_pm_configure_extint() - ensure pins are correctly set for IRQ
  *
diff --git a/arch/arm/plat-samsung/pm-check.c b/arch/arm/plat-samsung/pm-check.c
index 3cbd626..04aff2c 100644
--- a/arch/arm/plat-samsung/pm-check.c
+++ b/arch/arm/plat-samsung/pm-check.c
@@ -19,7 +19,7 @@
 #include <linux/ioport.h>
 #include <linux/slab.h>
 
-#include <plat/pm.h>
+#include <plat/pm-common.h>
 
 #if CONFIG_SAMSUNG_PM_CHECK_CHUNKSIZE < 1
 #error CONFIG_SAMSUNG_PM_CHECK_CHUNKSIZE must be a positive non-zero value
-- 
1.8.4.3
