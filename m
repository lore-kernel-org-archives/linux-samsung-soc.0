From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 2/2] drm/exynos: track vblank events on a per crtc basis
Date: Mon, 12 Jan 2015 16:01:03 -0200
Message-ID: <1421085663-12504-2-git-send-email-gustavo@padovan.org>
References: <1421085663-12504-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:40424 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103AbbALSBN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jan 2015 13:01:13 -0500
Received: by mail-qg0-f54.google.com with SMTP id l89so18796192qgf.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2015 10:01:12 -0800 (PST)
In-Reply-To: <1421085663-12504-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Mandeep Singh Baines <msb@chromium.org>

From: Mandeep Singh Baines <msb@chromium.org>

The goal of the change is to make sure we send the vblank event on the
current vblank. My hope is to fix any races that might be causing flicker.
After this change I only see a flicker in the transition plymouth and
X11.

Simplified the code by tracking vblank events on a per-crtc basis. This
allowed me to remove all error paths from the callback. It also allowed
me to remove the vblank wait from the callback.

Signed-off-by: Mandeep Singh Baines <msb@chromium.org>
Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 39 ++++++++------------------------
 drivers/gpu/drm/exynos/exynos_drm_drv.c  | 19 ----------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  6 ++---
 3 files changed, 12 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index a85c451..b1f1b25 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -34,9 +34,8 @@ static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 	if (mode > DRM_MODE_DPMS_ON) {
 		/* wait for the completion of page flip. */
 		if (!wait_event_timeout(exynos_crtc->pending_flip_queue,
-				!atomic_read(&exynos_crtc->pending_flip),
-				HZ/20))
-			atomic_set(&exynos_crtc->pending_flip, 0);
+				(exynos_crtc->event == NULL), HZ/20))
+			exynos_crtc->event = NULL;
 		drm_crtc_vblank_off(crtc);
 	}
 
@@ -166,7 +165,6 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 				     uint32_t page_flip_flags)
 {
 	struct drm_device *dev = crtc->dev;
-	struct exynos_drm_private *dev_priv = dev->dev_private;
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 	struct drm_framebuffer *old_fb = crtc->primary->fb;
 	unsigned int crtc_w, crtc_h;
@@ -194,12 +192,6 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 			goto out;
 		}
 
-		spin_lock_irq(&dev->event_lock);
-		list_add_tail(&event->base.link,
-				&dev_priv->pageflip_event_list);
-		atomic_set(&exynos_crtc->pending_flip, 1);
-		spin_unlock_irq(&dev->event_lock);
-
 		crtc->primary->fb = fb;
 		crtc_w = fb->width - crtc->x;
 		crtc_h = fb->height - crtc->y;
@@ -209,14 +201,12 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 		if (ret) {
 			crtc->primary->fb = old_fb;
 
-			spin_lock_irq(&dev->event_lock);
 			drm_vblank_put(dev, exynos_crtc->pipe);
-			list_del(&event->base.link);
-			atomic_set(&exynos_crtc->pending_flip, 0);
-			spin_unlock_irq(&dev->event_lock);
 
 			goto out;
 		}
+
+		exynos_crtc->event = event;
 	}
 out:
 	mutex_unlock(&dev->struct_mutex);
@@ -315,7 +305,6 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
 		return ERR_PTR(-ENOMEM);
 
 	init_waitqueue_head(&exynos_crtc->pending_flip_queue);
-	atomic_set(&exynos_crtc->pending_flip, 0);
 
 	exynos_crtc->dpms = DRM_MODE_DPMS_OFF;
 	exynos_crtc->pipe = pipe;
@@ -382,27 +371,19 @@ void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe)
 void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe)
 {
 	struct exynos_drm_private *dev_priv = dev->dev_private;
-	struct drm_pending_vblank_event *e, *t;
 	struct drm_crtc *drm_crtc = dev_priv->crtc[pipe];
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(drm_crtc);
-	unsigned long flags;
 
-	spin_lock_irqsave(&dev->event_lock, flags);
+	if (exynos_crtc->event) {
 
-	list_for_each_entry_safe(e, t, &dev_priv->pageflip_event_list,
-			base.link) {
-		/* if event's pipe isn't same as crtc then ignore it. */
-		if (pipe != e->pipe)
-			continue;
-
-		list_del(&e->base.link);
-		drm_send_vblank_event(dev, -1, e);
+		spin_lock_irq(&dev->event_lock);
+		drm_send_vblank_event(dev, -1, exynos_crtc->event);
 		drm_vblank_put(dev, pipe);
-		atomic_set(&exynos_crtc->pending_flip, 0);
 		wake_up(&exynos_crtc->pending_flip_queue);
-	}
+		spin_unlock_irq(&dev->event_lock);
 
-	spin_unlock_irqrestore(&dev->event_lock, flags);
+		exynos_crtc->event = NULL;
+	}
 }
 
 void exynos_drm_crtc_complete_scanout(struct drm_framebuffer *fb)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index b60fd9b..731cdbc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -61,7 +61,6 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 	if (!private)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&private->pageflip_event_list);
 	dev_set_drvdata(dev->dev, dev);
 	dev->dev_private = (void *)private;
 
@@ -237,27 +236,9 @@ static void exynos_drm_preclose(struct drm_device *dev,
 
 static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
 {
-	struct exynos_drm_private *private = dev->dev_private;
-	struct drm_pending_vblank_event *v, *vt;
-	struct drm_pending_event *e, *et;
-	unsigned long flags;
-
 	if (!file->driver_priv)
 		return;
 
-	/* Release all events not unhandled by page flip handler. */
-	spin_lock_irqsave(&dev->event_lock, flags);
-	list_for_each_entry_safe(v, vt, &private->pageflip_event_list,
-			base.link) {
-		if (v->base.file_priv == file) {
-			list_del(&v->base.link);
-			drm_vblank_put(dev, v->pipe);
-			v->base.destroy(&v->base);
-		}
-	}
-
-	spin_unlock_irqrestore(&dev->event_lock, flags);
-
 	kfree(file->driver_priv);
 	file->driver_priv = NULL;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index d490b49..7411af2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -216,6 +216,7 @@ enum exynos_crtc_mode {
  *	this pipe value.
  * @dpms: store the crtc dpms value
  * @mode: store the crtc mode value
+ * @event: vblank event that is currently queued for flip
  * @ops: pointer to callbacks for exynos drm specific functionality
  * @ctx: A pointer to the crtc's implementation specific context
  */
@@ -226,7 +227,7 @@ struct exynos_drm_crtc {
 	unsigned int			dpms;
 	enum exynos_crtc_mode		mode;
 	wait_queue_head_t		pending_flip_queue;
-	atomic_t			pending_flip;
+	struct drm_pending_vblank_event	*event;
 	struct exynos_drm_crtc_ops	*ops;
 	void				*ctx;
 };
@@ -256,9 +257,6 @@ struct drm_exynos_file_private {
 struct exynos_drm_private {
 	struct drm_fb_helper *fb_helper;
 
-	/* list head for new event to be added. */
-	struct list_head pageflip_event_list;
-
 	/*
 	 * created crtc object would be contained at this array and
 	 * this array is used to be aware of which crtc did it request vblank.
-- 
1.9.3
