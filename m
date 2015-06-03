From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 2/9] drm/exynos: add atomic asynchronous commit
Date: Wed,  3 Jun 2015 11:30:25 -0300
Message-ID: <1433341832-2686-2-git-send-email-gustavo@padovan.org>
References: <1433341832-2686-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f175.google.com ([209.85.160.175]:34137 "EHLO
	mail-yk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754525AbbFCOam (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 10:30:42 -0400
Received: by ykfl8 with SMTP id l8so4166749ykf.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2015 07:30:41 -0700 (PDT)
In-Reply-To: <1433341832-2686-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The atomic modesetting interfaces supports async commits that should be
implemented by the drivers. If drm core requests an async commit
exynos_atomic_commit() will schedule a work task to run the update later.
It also waits to an update to finishes to schedule a new one.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |  6 ++++
 drivers/gpu/drm/exynos/exynos_drm_drv.h |  6 ++++
 drivers/gpu/drm/exynos/exynos_drm_fb.c  | 51 ++++++++++++++++++++++++++-------
 3 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 08b9a8c..8ccff36 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -60,6 +60,9 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 	if (!private)
 		return -ENOMEM;
 
+	INIT_WORK(&private->work, exynos_drm_atomic_work);
+	private->dev = dev;
+
 	dev_set_drvdata(dev->dev, dev);
 	dev->dev_private = (void *)private;
 
@@ -140,6 +143,8 @@ err_free_private:
 
 static int exynos_drm_unload(struct drm_device *dev)
 {
+	struct exynos_drm_private *private = dev->dev_private;
+
 	exynos_drm_device_subdrv_remove(dev);
 
 	exynos_drm_fbdev_fini(dev);
@@ -150,6 +155,7 @@ static int exynos_drm_unload(struct drm_device *dev)
 	drm_mode_config_cleanup(dev);
 	drm_release_iommu_mapping(dev);
 
+	flush_work(&private->work);
 	kfree(dev->dev_private);
 	dev->dev_private = NULL;
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 1c66f65..552ca4a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -255,6 +255,10 @@ struct exynos_drm_private {
 	unsigned long da_space_size;
 
 	unsigned int pipe;
+
+	struct drm_device *dev;
+	struct work_struct work;
+	struct drm_atomic_state *state;
 };
 
 /*
@@ -324,6 +328,8 @@ static inline int exynos_drm_probe_vidi(void) { return 0; }
 static inline void exynos_drm_remove_vidi(void) {}
 #endif
 
+void exynos_drm_atomic_work(struct work_struct *work);
+
 /* This function creates a encoder and a connector, and initializes them. */
 int exynos_drm_create_enc_conn(struct drm_device *dev,
 				struct exynos_drm_display *display);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 789db6f..28626db 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -267,20 +267,18 @@ static void exynos_drm_output_poll_changed(struct drm_device *dev)
 		exynos_drm_fbdev_init(dev);
 }
 
-static int exynos_atomic_commit(struct drm_device *dev,
-				struct drm_atomic_state *state,
-				bool async)
+static void exynos_atomic_commit_schedule(struct drm_device *dev,
+				struct drm_atomic_state *state)
 {
-	int ret;
-
-	ret = drm_atomic_helper_prepare_planes(dev, state);
-	if (ret)
-		return ret;
-
-	/* This is the point of no return */
+	struct exynos_drm_private *private = dev->dev_private;
 
-	drm_atomic_helper_swap_state(dev, state);
+	private->state = state;
+	schedule_work(&private->work);
+}
 
+static void exynos_atomic_commit_complete(struct drm_device *dev,
+					  struct drm_atomic_state *state)
+{
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
 	drm_atomic_helper_commit_modeset_enables(dev, state);
@@ -300,6 +298,37 @@ static int exynos_atomic_commit(struct drm_device *dev,
 	drm_atomic_helper_cleanup_planes(dev, state);
 
 	drm_atomic_state_free(state);
+}
+
+void exynos_drm_atomic_work(struct work_struct *work)
+{
+	struct exynos_drm_private *private = container_of(work,
+				struct exynos_drm_private, work);
+
+	exynos_atomic_commit_complete(private->dev, private->state);
+}
+
+static int exynos_atomic_commit(struct drm_device *dev,
+				struct drm_atomic_state *state,
+				bool async)
+{
+	struct exynos_drm_private *private = dev->dev_private;
+	int ret;
+
+	ret = drm_atomic_helper_prepare_planes(dev, state);
+	if (ret)
+		return ret;
+
+	/* This is the point of no return */
+
+	drm_atomic_helper_swap_state(dev, state);
+
+	flush_work(&private->work);
+
+	if (async)
+		exynos_atomic_commit_schedule(dev, state);
+	else
+		exynos_atomic_commit_complete(dev, state);
 
 	return 0;
 }
-- 
2.1.0
