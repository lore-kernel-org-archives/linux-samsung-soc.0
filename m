From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 6/6] ARM: S3C24XX: Add note on GPIO bank sizes
Date: Mon, 17 May 2010 08:22:38 +0100
Message-ID: <1274080958-369-6-git-send-email-ben-linux@fluff.org>
References: <1274080958-369-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:48551 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753867Ab0EQHW7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 03:22:59 -0400
In-Reply-To: <1274080958-369-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Add a table for the GPIO bank sizes for each SoC

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/include/mach/gpio-nrs.h |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/gpio-nrs.h b/arch/arm/mach-s3c2410/include/mach/gpio-nrs.h
index ad4a04a..4f7bf32 100644
--- a/arch/arm/mach-s3c2410/include/mach/gpio-nrs.h
+++ b/arch/arm/mach-s3c2410/include/mach/gpio-nrs.h
@@ -19,6 +19,25 @@
 #define S3C2410_GPIO_BANKG   (32*6)
 #define S3C2410_GPIO_BANKH   (32*7)
 
+/* GPIO sizes for various SoCs:
+ *
+ *             2442
+ *   2410 2412 2440 2443 2416
+ *   ---- ---- ---- ---- ----
+ * A 23   22   25   16   25
+ * B 11   11   11   11   9
+ * C 16   15   16   16   16
+ * D 16   16   16   16   16
+ * E 16   16   16   16   16
+ * F 8    8    8    8    8
+ * G 16   16   16   16   8
+ * H 11   11   9    15   15
+ * J --   --   13   16   --
+ * K --   --   --   --   16
+ * L --   --   --   15   7
+ * M --   --   --   2    2
+ */
+
 /* GPIO bank sizes */
 #define S3C2410_GPIO_A_NR	(32)
 #define S3C2410_GPIO_B_NR	(32)
-- 
1.6.3.3
