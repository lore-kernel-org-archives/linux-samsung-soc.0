From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 09/11] mtd: OneNAND: Change dependency of ARCH_EXYNOS4
Date: Mon, 14 Feb 2011 17:23:05 +0900
Message-ID: <1297671787-10571-10-git-send-email-kgene.kim@samsung.com>
References: <1297671787-10571-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36656 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752481Ab1BNItl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Feb 2011 03:49:41 -0500
In-Reply-To: <1297671787-10571-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch updates EXYNOS4 OneNAND support according to the change of
ARCH name, EXYNOS4.

Cc: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/mtd/onenand/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index 4dbd0f5..4f42619 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -32,7 +32,7 @@ config MTD_ONENAND_OMAP2
 
 config MTD_ONENAND_SAMSUNG
         tristate "OneNAND on Samsung SOC controller support"
-        depends on ARCH_S3C64XX || ARCH_S5PC100 || ARCH_S5PV210 || ARCH_S5PV310
+        depends on ARCH_S3C64XX || ARCH_S5PC100 || ARCH_S5PV210 || ARCH_EXYNOS4
         help
           Support for a OneNAND flash device connected to an Samsung SOC.
           S3C64XX/S5PC100 use command mapping method.
-- 
1.7.1
