From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 7/9] drm/exynos: Save up space using bool var as bitfields
Date: Fri, 31 Oct 2014 14:17:41 +0000
Message-ID: <1414765063-30598-7-git-send-email-gustavo@padovan.org>
References: <1414765063-30598-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:57920 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757934AbaJaORt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 10:17:49 -0400
Received: by mail-wi0-f181.google.com with SMTP id n3so1425804wiv.14
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2014 07:17:48 -0700 (PDT)
In-Reply-To: <1414765063-30598-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Save a few bytes by compiling them all in the same byte.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 9e4a7e1..f77e6aa 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -66,10 +66,10 @@ enum exynos_drm_output_type {
  * @dma_addr: array of bus(accessed by dma) address to the memory region
  *	      allocated for a overlay.
  * @zpos: order of overlay layer(z position).
- * @default_win: a window to be enabled.
- * @color_key: color key on or off.
  * @index_color: if using color key feature then this value would be used
  *			as index color.
+ * @default_win: a window to be enabled.
+ * @color_key: color key on or off.
  * @local_path: in case of lcd type, local path mode on or off.
  * @transparency: transparency on or off.
  * @activated: activated or not.
@@ -97,13 +97,13 @@ struct exynos_drm_overlay {
 	uint32_t pixel_format;
 	dma_addr_t dma_addr[MAX_FB_BUFFER];
 	int zpos;
-
-	bool default_win;
-	bool color_key;
 	unsigned int index_color;
-	bool local_path;
-	bool transparency;
-	bool activated;
+
+	bool default_win:1;
+	bool color_key:1;
+	bool local_path:1;
+	bool transparency:1;
+	bool activated:1;
 };
 
 /*
-- 
1.9.3
