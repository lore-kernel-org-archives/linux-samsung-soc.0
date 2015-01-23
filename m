From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 16/18] iommu: exynos: remove excessive includes and sort
 others alphabetically
Date: Fri, 23 Jan 2015 16:51:26 +0100
Message-ID: <1422028288-891-17-git-send-email-m.szyprowski@samsung.com>
References: <1422028288-891-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:62078 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754615AbbAWPwM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 10:52:12 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NIN00FRE09Q4P10@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Jan 2015 15:56:14 +0000 (GMT)
In-reply-to: <1422028288-891-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: iommu@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linaro-mm-sig@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>, Shaik Ameer Basha <shaik.ameer@samsung.com>, Cho KyongHo <pullip.cho@samsung.com>, Joerg Roedel <joro@8bytes.org>, Thierry Reding <treding@nvidia.com>, Olof Johansson <olof@lixom.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, Will Deacon <will.deacon@arm.com>, David Wodhouse <dwmw2@infradead.org>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

Removed following unused includes: <linux/mm.h>, <linux/errno.h>,
<linux/memblock.h> and <linux/export.h>.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/iommu/exynos-iommu.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index ef71725..c53cc8f 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -12,19 +12,15 @@
 #define DEBUG
 #endif
 
-#include <linux/io.h>
-#include <linux/interrupt.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/err.h>
-#include <linux/mm.h>
+#include <linux/io.h>
 #include <linux/iommu.h>
-#include <linux/errno.h>
+#include <linux/interrupt.h>
 #include <linux/list.h>
-#include <linux/memblock.h>
-#include <linux/export.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
 
 #include <asm/cacheflush.h>
 #include <asm/pgtable.h>
-- 
1.9.2
