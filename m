From: Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] ARM: s3c2442: gta02: Fix usage gpio bank j pin definitions
Date: Fri, 24 Sep 2010 20:24:18 +0200
Message-ID: <1285352658-20355-1-git-send-email-lars@metafoo.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp-out-027.synserver.de ([212.40.180.27]:1029 "HELO
	smtp-out-026.synserver.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with SMTP id S1754334Ab0IXSYo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Sep 2010 14:24:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>

The gta02 header file still uses the old S3C2410_GPJx defines instead of the
S3C2410_GPJ(x) macro. Since the S3C2410_GPJx defines have already been removed
this causes a build failure.
This patches fixes the issue by doing a s,S3C2410_GPJ([\d]+),S3C2410_GPJ(\1),g
on the file.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 arch/arm/mach-s3c2440/include/mach/gta02.h |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-s3c2440/include/mach/gta02.h b/arch/arm/mach-s3c2440/include/mach/gta02.h
index 0147ed6..2e84b5a 100644
--- a/arch/arm/mach-s3c2440/include/mach/gta02.h
+++ b/arch/arm/mach-s3c2440/include/mach/gta02.h
@@ -44,19 +44,19 @@
 #define GTA02v3_GPIO_nUSB_FLT	S3C2410_GPG(10)	/* v3 + v4 only */
 #define GTA02v3_GPIO_nGSM_OC	S3C2410_GPG(11)	/* v3 + v4 only */
 
-#define GTA02_GPIO_AMP_SHUT	S3C2440_GPJ1	/* v2 + v3 + v4 only */
-#define GTA02v1_GPIO_WLAN_GPIO10	S3C2440_GPJ2
-#define GTA02_GPIO_HP_IN	S3C2440_GPJ2	/* v2 + v3 + v4 only */
-#define GTA02_GPIO_INT0		S3C2440_GPJ3	/* v2 + v3 + v4 only */
-#define GTA02_GPIO_nGSM_EN	S3C2440_GPJ4
-#define GTA02_GPIO_3D_RESET	S3C2440_GPJ5
-#define GTA02_GPIO_nDL_GSM	S3C2440_GPJ6	/* v4 + v5 only */
-#define GTA02_GPIO_WLAN_GPIO0	S3C2440_GPJ7
-#define GTA02v1_GPIO_BAT_ID	S3C2440_GPJ8
-#define GTA02_GPIO_KEEPACT	S3C2440_GPJ8
-#define GTA02v1_GPIO_HP_IN	S3C2440_GPJ10
-#define GTA02_CHIP_PWD		S3C2440_GPJ11	/* v2 + v3 + v4 only */
-#define GTA02_GPIO_nWLAN_RESET	S3C2440_GPJ12	/* v2 + v3 + v4 only */
+#define GTA02_GPIO_AMP_SHUT	S3C2410_GPJ(1)	/* v2 + v3 + v4 only */
+#define GTA02v1_GPIO_WLAN_GPIO10	S3C2410_GPJ(2)
+#define GTA02_GPIO_HP_IN	S3C2410_GPJ(2)	/* v2 + v3 + v4 only */
+#define GTA02_GPIO_INT0		S3C2410_GPJ(3)	/* v2 + v3 + v4 only */
+#define GTA02_GPIO_nGSM_EN	S3C2410_GPJ(4)
+#define GTA02_GPIO_3D_RESET	S3C2410_GPJ(5)
+#define GTA02_GPIO_nDL_GSM	S3C2410_GPJ(6)	/* v4 + v5 only */
+#define GTA02_GPIO_WLAN_GPIO0	S3C2410_GPJ(7)
+#define GTA02v1_GPIO_BAT_ID	S3C2410_GPJ(8)
+#define GTA02_GPIO_KEEPACT	S3C2410_GPJ(8)
+#define GTA02v1_GPIO_HP_IN	S3C2410_GPJ(10)
+#define GTA02_CHIP_PWD		S3C2410_GPJ(11)	/* v2 + v3 + v4 only */
+#define GTA02_GPIO_nWLAN_RESET	S3C2410_GPJ(12)	/* v2 + v3 + v4 only */
 
 #define GTA02_IRQ_GSENSOR_1	IRQ_EINT0
 #define GTA02_IRQ_MODEM		IRQ_EINT1
-- 
1.5.6.5
