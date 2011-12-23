From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH 2/2] ARM: SAMSUNG: dma-ops.h needs mach/dma.h
Date: Fri, 23 Dec 2011 16:23:34 +0000
Message-ID: <1324657414-27991-2-git-send-email-broonie@opensource.wolfsonmicro.com>
References: <1324657414-27991-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:53471 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754269Ab1LWQXk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Dec 2011 11:23:40 -0500
In-Reply-To: <1324657414-27991-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

dma-ops.h uses samsung_dma_is_dmadev so it needs to have mach/dma.h
included.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/plat-samsung/include/plat/dma-ops.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/dma-ops.h b/arch/arm/plat-samsung/include/plat/dma-ops.h
index 70b6325..71a6827 100644
--- a/arch/arm/plat-samsung/include/plat/dma-ops.h
+++ b/arch/arm/plat-samsung/include/plat/dma-ops.h
@@ -14,6 +14,7 @@
 #define __SAMSUNG_DMA_OPS_H_ __FILE__
 
 #include <linux/dmaengine.h>
+#include <mach/dma.h>
 
 struct samsung_dma_prep_info {
 	enum dma_transaction_type cap;
-- 
1.7.7.3
