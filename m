From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 14/15] exynos: fimg2d: unify register style
Date: Mon, 16 Feb 2015 15:26:19 +0100
Message-ID: <1424096780-7559-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55526 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752517AbbBPO03 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Feb 2015 09:26:29 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

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
