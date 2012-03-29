From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S3C24XX: fix missing common.h in mach-s3c24xx/
Date: Thu, 29 Mar 2012 09:14:34 +0900
Message-ID: <1332980074-4614-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:50990 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754121Ab2C2AVy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Mar 2012 20:21:54 -0400
Received: by pbcun15 with SMTP id un15so2515388pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Mar 2012 17:21:54 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

This patch fixes missing mach-s3c24xx/common.h which has been
lost when regarding s3c24xx directories merged.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c24xx/common.h |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s3c24xx/common.h

diff --git a/arch/arm/mach-s3c24xx/common.h b/arch/arm/mach-s3c24xx/common.h
new file mode 100644
index 0000000..a7cd62f
--- /dev/null
+++ b/arch/arm/mach-s3c24xx/common.h
@@ -0,0 +1,23 @@
+/*
+ * Copyright (c) 2012 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * Common Header for S3C24XX SoCs
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __ARCH_ARM_MACH_S3C24XX_COMMON_H
+#define __ARCH_ARM_MACH_S3C24XX_COMMON_H
+
+#ifdef CONFIG_CPU_S3C2410
+void s3c2410_restart(char mode, const char *cmd);
+#endif
+
+#ifdef CONFIG_CPU_S3C244X
+void s3c244x_restart(char mode, const char *cmd);
+#endif
+
+#endif /* __ARCH_ARM_MACH_S3C24XX_COMMON_H */
-- 
1.7.2.3
