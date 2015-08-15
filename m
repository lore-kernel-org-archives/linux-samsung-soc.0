From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 08/11] drm/exynos: add atomic asynchronous commit
Date: Sat, 15 Aug 2015 13:26:17 -0300
Message-ID: <1439655980-32146-9-git-send-email-gustavo@padovan.org>
References: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f169.google.com ([209.85.160.169]:32973 "EHLO
	mail-yk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216AbbHOQ0r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Aug 2015 12:26:47 -0400
Received: by ykll84 with SMTP id l84so29599138ykl.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Aug 2015 09:26:46 -0700 (PDT)
In-Reply-To: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The atomic modesetting interfaces supports async commits that should be
implemented by the drivers. If drm core requests an async commit
exynos_atomic_commit() will now schedule a work task to run the update later.

It also serializes commits that needs to run on the same crtc, putting the
following commit to wait until the current one is finished.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 113 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_drv.h |  11 ++++
 drivers/gpu/drm/exynos/exynos_drm_fb.c  |  35 ----------
 3 files changed, 124 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index e8db234..a4937b5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -13,6 +13,8 @@
 
 #include <linux/pm_runtime.h>
 #include <drm/drmP.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 
 #include <linux/component.h>
@@ -37,6 +39,56 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+struct exynos_atomic_commit {
+	struct work_struct	work;
+	struct drm_device	*dev;
+	struct drm_atomic_state *state;
+	u32			crtcs;
+};
+
+static void exynos_atomic_commit_complete(struct exynos_atomic_commit *commit)
+{
+	struct drm_device *dev = commit->dev;
+	struct exynos_drm_private *priv = dev->dev_private;
+	struct drm_atomic_state *state = commit->state;
+
+	drm_atomic_helper_commit_modeset_disables(dev, state);
+
+	drm_atomic_helper_commit_modeset_enables(dev, state);
+
+	/*
+	 * Exynos can't update planes with CRTCs and encoders disabled,
+	 * its updates routines, specially for FIMD, requires the clocks
+	 * to be enabled. So it is necessary to handle the modeset operations
+	 * *before* the commit_planes() step, this way it will always
+	 * have the relevant clocks enabled to perform the update.
+	 */
+
+	drm_atomic_helper_commit_planes(dev, state);
+
+	drm_atomic_helper_wait_for_vblanks(dev, state);
+
+	drm_atomic_helper_cleanup_planes(dev, state);
+
+	drm_atomic_state_free(state);
+
+	spin_lock(&priv->lock);
+	priv->pending &= ~commit->crtcs;
+	spin_unlock(&priv->lock);
+
+	wake_up_all(&priv->wait);
+
+	kfree(commit);
+}
+
+static void exynos_drm_atomic_work(struct work_struct *work)
+{
+	struct exynos_atomic_commit *commit = container_of(work,
+				struct exynos_atomic_commit, work);
+
+	exynos_atomic_commit_complete(commit);
+}
+
 static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 {
 	struct exynos_drm_private *private;
@@ -48,6 +100,9 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 	if (!private)
 		return -ENOMEM;
 
+	init_waitqueue_head(&private->wait);
+	spin_lock_init(&private->lock);
+
 	dev_set_drvdata(dev->dev, dev);
 	dev->dev_private = (void *)private;
 
@@ -150,6 +205,64 @@ static int exynos_drm_unload(struct drm_device *dev)
 	return 0;
 }
 
+static int commit_is_pending(struct exynos_drm_private *priv, u32 crtcs)
+{
+	bool pending;
+
+	spin_lock(&priv->lock);
+	pending = priv->pending & crtcs;
+	spin_unlock(&priv->lock);
+
+	return pending;
+}
+
+int exynos_atomic_commit(struct drm_device *dev, struct drm_atomic_state *state,
+			 bool async)
+{
+	struct exynos_drm_private *priv = dev->dev_private;
+	struct exynos_atomic_commit *commit;
+	int i, ret;
+
+	commit = kzalloc(sizeof(*commit), GFP_KERNEL);
+	if (!commit)
+		return -ENOMEM;
+
+	ret = drm_atomic_helper_prepare_planes(dev, state);
+	if (ret) {
+		kfree(commit);
+		return ret;
+	}
+
+	/* This is the point of no return */
+
+	INIT_WORK(&commit->work, exynos_drm_atomic_work);
+	commit->dev = dev;
+	commit->state = state;
+
+	/* Wait until all affected CRTCs have completed previous commits and
+	 * mark them as pending.
+	 */
+	for (i = 0; i < dev->mode_config.num_crtc; ++i) {
+		if (state->crtcs[i])
+			commit->crtcs |= 1 << drm_crtc_index(state->crtcs[i]);
+	}
+
+	wait_event(priv->wait, !commit_is_pending(priv, commit->crtcs));
+
+	spin_lock(&priv->lock);
+	priv->pending |= commit->crtcs;
+	spin_unlock(&priv->lock);
+
+	drm_atomic_helper_swap_state(dev, state);
+
+	if (async)
+		schedule_work(&commit->work);
+	else
+		exynos_atomic_commit_complete(commit);
+
+	return 0;
+}
+
 static int exynos_drm_suspend(struct drm_device *dev, pm_message_t state)
 {
 	struct drm_connector *connector;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index de10cd1..406b278 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -170,6 +170,9 @@ struct drm_exynos_file_private {
  * @da_space_size: size of device address space.
  *	if 0 then default value is used for it.
  * @pipe: the pipe number for this crtc/manager.
+ * @pending: the crtcs that have pending updates to finish
+ * @lock: protect access to @pending
+ * @wait: wait an atomic commit to finish
  */
 struct exynos_drm_private {
 	struct drm_fb_helper *fb_helper;
@@ -185,6 +188,11 @@ struct exynos_drm_private {
 	unsigned long da_space_size;
 
 	unsigned int pipe;
+
+	/* for atomic commit */
+	u32			pending;
+	spinlock_t		lock;
+	wait_queue_head_t	wait;
 };
 
 /*
@@ -243,6 +251,9 @@ static inline int exynos_dpi_bind(struct drm_device *dev,
 }
 #endif
 
+int exynos_atomic_commit(struct drm_device *dev, struct drm_atomic_state *state,
+			 bool async);
+
 
 extern struct platform_driver fimd_driver;
 extern struct platform_driver exynos5433_decon_driver;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 2b6320e..edaccfb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -267,41 +267,6 @@ static void exynos_drm_output_poll_changed(struct drm_device *dev)
 		exynos_drm_fbdev_init(dev);
 }
 
-static int exynos_atomic_commit(struct drm_device *dev,
-				struct drm_atomic_state *state,
-				bool async)
-{
-	int ret;
-
-	ret = drm_atomic_helper_prepare_planes(dev, state);
-	if (ret)
-		return ret;
-
-	/* This is the point of no return */
-
-	drm_atomic_helper_swap_state(dev, state);
-
-	drm_atomic_helper_commit_modeset_disables(dev, state);
-
-	drm_atomic_helper_commit_modeset_enables(dev, state);
-
-	/*
-	 * Exynos can't update planes with CRTCs and encoders disabled,
-	 * its updates routines, specially for FIMD, requires the clocks
-	 * to be enabled. So it is necessary to handle the modeset operations
-	 * *before* the commit_planes() step, this way it will always
-	 * have the relevant clocks enabled to perform the update.
-	 */
-
-	drm_atomic_helper_commit_planes(dev, state);
-
-	drm_atomic_helper_cleanup_planes(dev, state);
-
-	drm_atomic_state_free(state);
-
-	return 0;
-}
-
 static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs = {
 	.fb_create = exynos_user_fb_create,
 	.output_poll_changed = exynos_drm_output_poll_changed,
-- 
2.1.0
