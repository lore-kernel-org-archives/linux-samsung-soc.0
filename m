From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 14/15] exynos: fimg2d: unify register style
Date: Tue,  3 Feb 2015 14:54:04 +0100
Message-ID: <1422971645-30621-15-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:46024 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965577AbbBCNyg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 08:54:36 -0500
In-Reply-To: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

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
