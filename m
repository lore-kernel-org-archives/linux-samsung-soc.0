From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 06/23] drm/exynos: add atomic asynchronous commit
Date: Tue, 23 Jun 2015 18:35:19 -0300
Message-ID: <1435095336-6196-7-git-send-email-gustavo@padovan.org>
References: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f175.google.com ([209.85.216.175]:33306 "EHLO
	mail-qc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933050AbbFWVgB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jun 2015 17:36:01 -0400
Received: by qcbcf1 with SMTP id cf1so7092807qcb.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2015 14:36:00 -0700 (PDT)
In-Reply-To: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The atomic modesetting interfaces supports async commits that should be
implemented by the drivers. If drm core requests an async commit
exynos_atomic_commit() will schedule a work task to run the update later.

It also waits an update to finish before schedule a new one.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |  6 ++++
 drivers/gpu/drm/exynos/exynos_drm_drv.h |  6 ++++
 drivers/gpu/drm/exynos/exynos_drm_fb.c  | 51 ++++++++++++++++++++++++++-------
 3 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 591bdec..aafb419 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -47,6 +47,9 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 	if (!private)
 		return -ENOMEM;
 
+	INIT_WORK(&private->work, exynos_drm_atomic_work);
+	private->dev = dev;
+
 	dev_set_drvdata(dev->dev, dev);
 	dev->dev_private = (void *)private;
 
@@ -127,6 +130,8 @@ err_free_private:
 
 static int exynos_drm_unload(struct drm_device *dev)
 {
+	struct exynos_drm_private *private = dev->dev_private;
+
 	exynos_drm_device_subdrv_remove(dev);
 
 	exynos_drm_fbdev_fini(dev);
@@ -137,6 +142,7 @@ static int exynos_drm_unload(struct drm_device *dev)
 	drm_mode_config_cleanup(dev);
 	drm_release_iommu_mapping(dev);
 
+	flush_work(&private->work);
 	kfree(dev->dev_private);
 	dev->dev_private = NULL;
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index a384569..e94d527 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -243,6 +243,10 @@ struct exynos_drm_private {
 	unsigned long da_space_size;
 
 	unsigned int pipe;
+
+	struct drm_device *dev;
+	struct work_struct work;
+	struct drm_atomic_state *state;
 };
 
 /*
@@ -295,6 +299,8 @@ static inline int exynos_dpi_remove(struct exynos_drm_display *display)
 }
 #endif
 
+void exynos_drm_atomic_work(struct work_struct *work);
+
 /* This function creates a encoder and a connector, and initializes them. */
 int exynos_drm_create_enc_conn(struct drm_device *dev,
 				struct exynos_drm_display *display);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 2b6320e..ad6b8ac 100644
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
@@ -298,6 +296,37 @@ static int exynos_atomic_commit(struct drm_device *dev,
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
+	flush_work(&private->work);
+
+	drm_atomic_helper_swap_state(dev, state);
+
+	if (async)
+		exynos_atomic_commit_schedule(dev, state);
+	else
+		exynos_atomic_commit_complete(dev, state);
 
 	return 0;
 }
-- 
2.1.0
