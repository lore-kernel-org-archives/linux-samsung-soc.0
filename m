From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 1/4] drm/exynos: move to_exynos_crtc() macro to main header
Date: Mon, 24 Nov 2014 16:21:03 -0200
Message-ID: <1416853266-10584-2-git-send-email-gustavo@padovan.org>
References: <1416853266-10584-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:42809 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537AbaKXSVP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 13:21:15 -0500
Received: by mail-qc0-f174.google.com with SMTP id c9so7181718qcz.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2014 10:21:15 -0800 (PST)
In-Reply-To: <1416853266-10584-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

With this change we allow other pieces of the code to use this macro.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 3 ---
 drivers/gpu/drm/exynos/exynos_drm_drv.h  | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 45026e6..c8a3169 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -20,9 +20,6 @@
 #include "exynos_drm_encoder.h"
 #include "exynos_drm_plane.h"
 
-#define to_exynos_crtc(x)	container_of(x, struct exynos_drm_crtc,\
-				drm_crtc)
-
 enum exynos_crtc_mode {
 	CRTC_MODE_NORMAL,	/* normal mode */
 	CRTC_MODE_BLANK,	/* The private plane of crtc is blank */
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 2e4e91b..9e14ae6f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -23,6 +23,9 @@
 #define MAX_FB_BUFFER	4
 #define DEFAULT_ZPOS	-1
 
+#define to_exynos_crtc(x)	container_of(x, struct exynos_drm_crtc,\
+				drm_crtc)
+
 /* This enumerates device type. */
 enum exynos_drm_device_type {
 	EXYNOS_DEVICE_TYPE_NONE,
-- 
1.9.3
