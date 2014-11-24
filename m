From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 2/4] drm/exynos: expose struct exynos_drm_crtc
Date: Mon, 24 Nov 2014 16:21:04 -0200
Message-ID: <1416853266-10584-3-git-send-email-gustavo@padovan.org>
References: <1416853266-10584-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f171.google.com ([209.85.216.171]:43769 "EHLO
	mail-qc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537AbaKXSVS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 13:21:18 -0500
Received: by mail-qc0-f171.google.com with SMTP id r5so7370318qcx.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2014 10:21:17 -0800 (PST)
In-Reply-To: <1416853266-10584-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Let other pieces of the driver access struct exynos_drm_crtc as well.

struct exynos_drm_manager will be merged into struct exynos_drm_crtc, in
the sense we will move all its members to exynos_drm_crtc, so to start
this conversion exynos_drm_crtc need to be exposed as well.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 30 ------------------------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  | 30 ++++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index c8a3169..e74b6fe 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -20,36 +20,6 @@
 #include "exynos_drm_encoder.h"
 #include "exynos_drm_plane.h"
 
-enum exynos_crtc_mode {
-	CRTC_MODE_NORMAL,	/* normal mode */
-	CRTC_MODE_BLANK,	/* The private plane of crtc is blank */
-};
-
-/*
- * Exynos specific crtc structure.
- *
- * @drm_crtc: crtc object.
- * @manager: the manager associated with this crtc
- * @pipe: a crtc index created at load() with a new crtc object creation
- *	and the crtc object would be set to private->crtc array
- *	to get a crtc object corresponding to this pipe from private->crtc
- *	array when irq interrupt occurred. the reason of using this pipe is that
- *	drm framework doesn't support multiple irq yet.
- *	we can refer to the crtc to current hardware interrupt occurred through
- *	this pipe value.
- * @dpms: store the crtc dpms value
- * @mode: store the crtc mode value
- */
-struct exynos_drm_crtc {
-	struct drm_crtc			drm_crtc;
-	struct exynos_drm_manager	*manager;
-	unsigned int			pipe;
-	unsigned int			dpms;
-	enum exynos_crtc_mode		mode;
-	wait_queue_head_t		pending_flip_queue;
-	atomic_t			pending_flip;
-};
-
 static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 9e14ae6f..ffef077 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -215,6 +215,36 @@ struct exynos_drm_manager {
 	struct exynos_drm_manager_ops *ops;
 };
 
+enum exynos_crtc_mode {
+	CRTC_MODE_NORMAL,	/* normal mode */
+	CRTC_MODE_BLANK,	/* The private plane of crtc is blank */
+};
+
+/*
+ * Exynos specific crtc structure.
+ *
+ * @drm_crtc: crtc object.
+ * @manager: the manager associated with this crtc
+ * @pipe: a crtc index created at load() with a new crtc object creation
+ *	and the crtc object would be set to private->crtc array
+ *	to get a crtc object corresponding to this pipe from private->crtc
+ *	array when irq interrupt occurred. the reason of using this pipe is that
+ *	drm framework doesn't support multiple irq yet.
+ *	we can refer to the crtc to current hardware interrupt occurred through
+ *	this pipe value.
+ * @dpms: store the crtc dpms value
+ * @mode: store the crtc mode value
+ */
+struct exynos_drm_crtc {
+	struct drm_crtc			drm_crtc;
+	struct exynos_drm_manager	*manager;
+	unsigned int			pipe;
+	unsigned int			dpms;
+	enum exynos_crtc_mode		mode;
+	wait_queue_head_t		pending_flip_queue;
+	atomic_t			pending_flip;
+};
+
 struct exynos_drm_g2d_private {
 	struct device		*dev;
 	struct list_head	inuse_cmdlist;
-- 
1.9.3
