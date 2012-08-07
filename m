From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V3 2/5] include/video: Add Exynos5 specific FIMD register
 offsets
Date: Tue, 07 Aug 2012 15:07:56 +0530
Message-ID: <1344332279-16736-3-git-send-email-l.krishna@samsung.com>
References: <1344332279-16736-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47767 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753383Ab2HGJWT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Aug 2012 05:22:19 -0400
In-reply-to: <1344332279-16736-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, ben-linux@fluff.org, kgene.kim@samsung.com, m.szyprowski@samsung.com

Exynos5 has VIDTCON and VIDCON registers at different offsets
from the previous SOCs. Hence, adding the macros.

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 include/video/samsung_fimd.h |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
index e979f42..7ae6c07 100644
--- a/include/video/samsung_fimd.h
+++ b/include/video/samsung_fimd.h
@@ -524,3 +524,10 @@
  * 1110		-none-	 -none-	  -none-   -none-    -none-
  * 1111		-none-	 -none-   -none-   -none-    -none-
 */
+
+/* FIMD Version 8 register offset definitions */
+#define FIMD_V8_VIDTCON0	(0x20010)
+#define FIMD_V8_VIDTCON1	(0x20014)
+#define FIMD_V8_VIDTCON2	(0x20018)
+#define FIMD_V8_VIDTCON3	(0x2001C)
+#define FIMD_V8_VIDCON1		(0x20004)
-- 
1.7.0.4
