From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH] MAINTAINERS: update email address and cleanup for exynos entry
Date: Fri, 14 Nov 2014 16:54:57 +0900
Message-ID: <1415951697-5991-1-git-send-email-kgene@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:12814 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754452AbaKNHyj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Nov 2014 02:54:39 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NF000GIORB12R20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Nov 2014 16:54:37 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: arnd@arndb.de, olof@lixom.net, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Ben Dooks <ben.dooks@codethink.co.uk>

Use kernel.org account instead of samsung.com and cleanup for Samsung
s3c, s5p and exynos SoCs.

Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 MAINTAINERS |   16 ++++------------
 1 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 60b1163..b1e27bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1308,30 +1308,22 @@ F:	drivers/*/*rockchip*
 F:	drivers/*/*/*rockchip*
 F:	sound/soc/rockchip/
 
-ARM/SAMSUNG ARM ARCHITECTURES
-M:	Ben Dooks <ben-linux@fluff.org>
-M:	Kukjin Kim <kgene.kim@samsung.com>
+ARM/SAMSUNG EXYNOS ARM ARCHITECTURES
+M:	Kukjin Kim <kgene@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
-W:	http://www.fluff.org/ben/linux/
 S:	Maintained
 F:	arch/arm/boot/dts/s3c*
 F:	arch/arm/boot/dts/exynos*
 F:	arch/arm/plat-samsung/
 F:	arch/arm/mach-s3c24*/
 F:	arch/arm/mach-s3c64xx/
+F:	arch/arm/mach-s5p*/
+F:	arch/arm/mach-exynos*/
 F:	drivers/*/*s3c2410*
 F:	drivers/*/*/*s3c2410*
 F:	drivers/spi/spi-s3c*
 F:	sound/soc/samsung/*
-
-ARM/S5P EXYNOS ARM ARCHITECTURES
-M:	Kukjin Kim <kgene.kim@samsung.com>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
-S:	Maintained
-F:	arch/arm/mach-s5p*/
-F:	arch/arm/mach-exynos*/
 N:	exynos
 
 ARM/SAMSUNG MOBILE MACHINE SUPPORT
-- 
1.7.4.4
