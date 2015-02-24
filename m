From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v3 15/17] exynos: fimg2d: unify register style
Date: Tue, 24 Feb 2015 16:29:37 +0100
Message-ID: <1424791779-12016-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:48106 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752114AbbBXP3f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 10:29:35 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Register defines all use uppercase hex codes.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/fimg2d_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/exynos/fimg2d_reg.h b/exynos/fimg2d_reg.h
index 5782488..07dd634 100644
--- a/exynos/fimg2d_reg.h
+++ b/exynos/fimg2d_reg.h
@@ -15,7 +15,7 @@
 
 #define SOFT_RESET_REG			(0x0000)
 #define INTEN_REG			(0x0004)
-#define INTC_PEND_REG			(0x000c)
+#define INTC_PEND_REG			(0x000C)
 #define FIFO_STAT_REG			(0x0010)
 #define AXI_MODE_REG			(0x001C)
 #define DMA_SFR_BASE_ADDR_REG		(0x0080)
-- 
2.0.5
