From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Fix crash on soft reset
Date: Fri, 25 Jan 2013 10:42:11 -0800
Message-ID: <1359139331-25220-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57192 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757141Ab3AYSm5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 13:42:57 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH700K7G2NGWTU0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 03:42:56 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MH700KOH2NFPP80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 03:42:56 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Thomas Abraham <thomas.ab@samsung.com>, Girish K S <ks.giri@samsung.com>, Kukjin <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

The soft-reset control register is located in the XMU controller space.
Map this controller space before writing to the soft-reset controller
register.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Girish K S <ks.giri@samsung.com>
Signed-off-by: Kukjin <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/common.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index ed53a4f..b4d3188 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -294,6 +294,7 @@ void exynos4_restart(char mode, const char *cmd)
 
 void exynos5_restart(char mode, const char *cmd)
 {
+	struct device_node *np;
 	u32 val;
 	void __iomem *addr;
 
@@ -301,8 +302,9 @@ void exynos5_restart(char mode, const char *cmd)
 		val = 0x1;
 		addr = EXYNOS_SWRESET;
 	} else if (of_machine_is_compatible("samsung,exynos5440")) {
-		val = (0x10 << 20) | (0x1 << 16);
-		addr = EXYNOS5440_SWRESET;
+		np = of_find_compatible_node(NULL, NULL, "samsung,exynos5440-clock");
+		addr = of_iomap(np, 0) + 0xcc;
+		val = (0xfff << 20) | (0x1 << 16);
 	} else {
 		pr_err("%s: cannot support non-DT\n", __func__);
 		return;
-- 
1.7.10.4
