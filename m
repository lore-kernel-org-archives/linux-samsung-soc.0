From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V4 2/2] include/video: Add register offsets for FIMD version 8
Date: Tue, 07 Aug 2012 18:04:32 +0530
Message-ID: <1344342872-7904-3-git-send-email-l.krishna@samsung.com>
References: <1344342872-7904-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:65273 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751690Ab2HGMVB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Aug 2012 08:21:01 -0400
In-reply-to: <1344342872-7904-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, ben-linux@fluff.org, kgene.kim@samsung.com, m.szyprowski@samsung.com

FIMD version 8 has VIDTCON and VIDCON registers at different offsets
from the previous versions. Hence, adding the macros.

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
