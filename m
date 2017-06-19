From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] drm/exynos/decon: Add include guard to the Exynos7 header
Date: Mon, 19 Jun 2017 18:31:09 +0200
Message-ID: <20170619163110.28173-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750811AbdFSQbR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 12:31:17 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>

Although header is included only once but still having an include guard
is a good practice.  To avoid confusion, add SoC prefix to existing
Exynos5433 header include guard.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 include/video/exynos5433_decon.h | 6 +++---
 include/video/exynos7_decon.h    | 5 +++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/video/exynos5433_decon.h b/include/video/exynos5433_decon.h
index 78957c9626f5..b30362da5692 100644
--- a/include/video/exynos5433_decon.h
+++ b/include/video/exynos5433_decon.h
@@ -6,8 +6,8 @@
  * published by the Free Software Foundationr
  */
 
-#ifndef EXYNOS_REGS_DECON_H
-#define EXYNOS_REGS_DECON_H
+#ifndef EXYNOS5433_REGS_DECON_H
+#define EXYNOS5433_REGS_DECON_H
 
 /* Exynos543X DECON */
 #define DECON_VIDCON0			0x0000
@@ -206,4 +206,4 @@
 #define CRCCTRL_CRCEN			(0x1 << 0)
 #define CRCCTRL_MASK			(0x7)
 
-#endif /* EXYNOS_REGS_DECON_H */
+#endif /* EXYNOS5433_REGS_DECON_H */
diff --git a/include/video/exynos7_decon.h b/include/video/exynos7_decon.h
index a62b11b613f6..d28829659a17 100644
--- a/include/video/exynos7_decon.h
+++ b/include/video/exynos7_decon.h
@@ -9,6 +9,9 @@
  * option) any later version.
  */
 
+#ifndef EXYNOS7_REGS_DECON_H
+#define EXYNOS7_REGS_DECON_H
+
 /* VIDCON0 */
 #define VIDCON0					0x00
 
@@ -347,3 +350,5 @@
 
 #define DECON_UPDATE_SLAVE_SYNC			(1 << 4)
 #define DECON_UPDATE_STANDALONE_F		(1 << 0)
+
+#endif /* EXYNOS7_REGS_DECON_H */
-- 
2.9.3
