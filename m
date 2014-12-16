From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 12/13] drm/irq: Expel legacy API
Date: Tue, 16 Dec 2014 17:53:34 +0100
Message-ID: <1418748815-15434-12-git-send-email-thierry.reding@gmail.com>
References: <1418748815-15434-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:56065 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751665AbaLPQy3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Dec 2014 11:54:29 -0500
Received: by mail-pd0-f174.google.com with SMTP id fp1so14121173pdb.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Dec 2014 08:54:28 -0800 (PST)
In-Reply-To: <1418748815-15434-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, Gerd Hoffmann <kraxel@redhat.com>, Mark Yao <mark.yao@rock-chips.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, linux-samsung-soc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

These legacy functions all operate on the struct drm_device * and an
index to the CRTC that they should access. This is bad because it
requires keeping track of a global data structures to resolve the index
to CRTC object lookup. In order to get rid of this global data new APIs
have been introduced that operate directly on these objects. Currently
the new functions still operate on the old data, but the goal is to
eventually move that data into struct drm_crtc. In order to start
conversion of drivers to the new API, move the old API away.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/Makefile         |    2 +-
 drivers/gpu/drm/drm_internal.h   |    2 +
 drivers/gpu/drm/drm_irq.c        | 1121 +------------------------------------
 drivers/gpu/drm/drm_irq_legacy.c | 1144 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 1165 insertions(+), 1104 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_irq_legacy.c

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 66e40398b3d3..c0d93beda612 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -5,7 +5,7 @@
 ccflags-y := -Iinclude/drm
 
 drm-y       :=	drm_auth.o drm_bufs.o drm_cache.o \
-		drm_context.o drm_dma.o \
+		drm_context.o drm_dma.o drm_irq_legacy.o \
 		drm_fops.o drm_gem.o drm_ioctl.o drm_irq.o \
 		drm_lock.o drm_memory.o drm_drv.o drm_vm.o \
 		drm_agpsupport.o drm_scatter.o drm_pci.o \
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 12a61d706827..61d83b581c8b 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -22,7 +22,9 @@
  */
 
 /* drm_irq.c */
+extern unsigned int drm_timestamp_precision;
 extern unsigned int drm_timestamp_monotonic;
+extern int drm_vblank_offdelay;
 
 /* drm_fops.c */
 extern struct mutex drm_global_mutex;
diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index ef5d993f06ee..37b536c57cd2 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -32,15 +32,13 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include <drm/drmP.h>
-#include "drm_trace.h"
-#include "drm_internal.h"
-
+#include <linux/export.h>
 #include <linux/interrupt.h>	/* For task queue support */
 #include <linux/slab.h>
 
-#include <linux/vgaarb.h>
-#include <linux/export.h>
+#include <drm/drmP.h>
+
+#include "drm_trace.h"
 
 /* Access macro for slots in vblank timestamp ringbuffer. */
 #define vblanktimestamp(dev, pipe, count) \
@@ -51,16 +49,7 @@
  */
 #define DRM_TIMESTAMP_MAXRETRIES 3
 
-/* Threshold in nanoseconds for detection of redundant
- * vblank irq in drm_handle_vblank(). 1 msec should be ok.
- */
-#define DRM_REDUNDANT_VBLIRQ_THRESH_NS 1000000
-
-static bool
-drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
-			  struct timeval *tvblank, unsigned flags);
-
-static unsigned int drm_timestamp_precision = 20;  /* Default to 20 usecs. */
+unsigned int drm_timestamp_precision = 20;  /* Default to 20 usecs. */
 
 /*
  * Default to use monotonic timestamps for wait-for-vblank and page-flip
@@ -68,492 +57,13 @@ static unsigned int drm_timestamp_precision = 20;  /* Default to 20 usecs. */
  */
 unsigned int drm_timestamp_monotonic = 1;
 
-static int drm_vblank_offdelay = 5000;    /* Default to 5000 msecs. */
+int drm_vblank_offdelay = 5000;    /* Default to 5000 msecs. */
 
 module_param_named(vblankoffdelay, drm_vblank_offdelay, int, 0600);
 module_param_named(timestamp_precision_usec, drm_timestamp_precision, int, 0600);
 module_param_named(timestamp_monotonic, drm_timestamp_monotonic, int, 0600);
 
 /**
- * drm_update_vblank_count - update the master vblank counter
- * @dev: DRM device
- * @pipe: counter to update
- *
- * Call back into the driver to update the appropriate vblank counter
- * (specified by @crtc).  Deal with wraparound, if it occurred, and
- * update the last read value so we can deal with wraparound on the next
- * call if necessary.
- *
- * Only necessary when going from off->on, to account for frames we
- * didn't get an interrupt for.
- *
- * Note: caller must hold dev->vbl_lock since this reads & writes
- * device vblank fields.
- */
-static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe)
-{
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	u32 cur_vblank, diff, tslot;
-	bool rc;
-	struct timeval t_vblank;
-
-	/*
-	 * Interrupts were disabled prior to this call, so deal with counter
-	 * wrap if needed.
-	 * NOTE!  It's possible we lost a full dev->max_vblank_count events
-	 * here if the register is small or we had vblank interrupts off for
-	 * a long time.
-	 *
-	 * We repeat the hardware vblank counter & timestamp query until
-	 * we get consistent results. This to prevent races between gpu
-	 * updating its hardware counter while we are retrieving the
-	 * corresponding vblank timestamp.
-	 */
-	do {
-		cur_vblank = dev->driver->get_vblank_counter(dev, pipe);
-		rc = drm_get_last_vbltimestamp(dev, pipe, &t_vblank, 0);
-	} while (cur_vblank != dev->driver->get_vblank_counter(dev, pipe));
-
-	/* Deal with counter wrap */
-	diff = cur_vblank - vblank->last;
-	if (cur_vblank < vblank->last) {
-		diff += dev->max_vblank_count;
-
-		DRM_DEBUG("last_vblank[%u]=0x%x, cur_vblank=0x%x => diff=0x%x\n",
-			  pipe, vblank->last, cur_vblank, diff);
-	}
-
-	DRM_DEBUG("updating vblank count on crtc %u, missed %d\n",
-		  pipe, diff);
-
-	if (diff == 0)
-		return;
-
-	/* Reinitialize corresponding vblank timestamp if high-precision query
-	 * available. Skip this step if query unsupported or failed. Will
-	 * reinitialize delayed at next vblank interrupt in that case.
-	 */
-	if (rc) {
-		tslot = atomic_read(&vblank->count) + diff;
-		vblanktimestamp(dev, pipe, tslot) = t_vblank;
-	}
-
-	smp_mb__before_atomic();
-	atomic_add(diff, &vblank->count);
-	smp_mb__after_atomic();
-}
-
-/*
- * Disable vblank irq's on crtc, make sure that last vblank count
- * of hardware and corresponding consistent software vblank counter
- * are preserved, even if there are any spurious vblank irq's after
- * disable.
- */
-static void vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
-{
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	unsigned long irqflags;
-	u32 vblcount;
-	s64 diff_ns;
-	bool vblrc;
-	struct timeval tvblank;
-	int count = DRM_TIMESTAMP_MAXRETRIES;
-
-	/* Prevent vblank irq processing while disabling vblank irqs,
-	 * so no updates of timestamps or count can happen after we've
-	 * disabled. Needed to prevent races in case of delayed irq's.
-	 */
-	spin_lock_irqsave(&dev->vblank_time_lock, irqflags);
-
-	/*
-	 * If the vblank interrupt was already disabled update the count
-	 * and timestamp to maintain the appearance that the counter
-	 * has been ticking all along until this time. This makes the
-	 * count account for the entire time between drm_vblank_on() and
-	 * drm_vblank_off().
-	 *
-	 * But only do this if precise vblank timestamps are available.
-	 * Otherwise we might read a totally bogus timestamp since drivers
-	 * lacking precise timestamp support rely upon sampling the system clock
-	 * at vblank interrupt time. Which obviously won't work out well if the
-	 * vblank interrupt is disabled.
-	 */
-	if (!vblank->enabled &&
-	    drm_get_last_vbltimestamp(dev, pipe, &tvblank, 0)) {
-		drm_update_vblank_count(dev, pipe);
-		spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags);
-		return;
-	}
-
-	dev->driver->disable_vblank(dev, pipe);
-	vblank->enabled = false;
-
-	/* No further vblank irq's will be processed after
-	 * this point. Get current hardware vblank count and
-	 * vblank timestamp, repeat until they are consistent.
-	 *
-	 * FIXME: There is still a race condition here and in
-	 * drm_update_vblank_count() which can cause off-by-one
-	 * reinitialization of software vblank counter. If gpu
-	 * vblank counter doesn't increment exactly at the leading
-	 * edge of a vblank interval, then we can lose 1 count if
-	 * we happen to execute between start of vblank and the
-	 * delayed gpu counter increment.
-	 */
-	do {
-		vblank->last = dev->driver->get_vblank_counter(dev, pipe);
-		vblrc = drm_get_last_vbltimestamp(dev, pipe, &tvblank, 0);
-	} while (vblank->last != dev->driver->get_vblank_counter(dev, pipe) && (--count) && vblrc);
-
-	if (!count)
-		vblrc = 0;
-
-	/* Compute time difference to stored timestamp of last vblank
-	 * as updated by last invocation of drm_handle_vblank() in vblank irq.
-	 */
-	vblcount = atomic_read(&vblank->count);
-	diff_ns = timeval_to_ns(&tvblank) -
-		  timeval_to_ns(&vblanktimestamp(dev, pipe, vblcount));
-
-	/* If there is at least 1 msec difference between the last stored
-	 * timestamp and tvblank, then we are currently executing our
-	 * disable inside a new vblank interval, the tvblank timestamp
-	 * corresponds to this new vblank interval and the irq handler
-	 * for this vblank didn't run yet and won't run due to our disable.
-	 * Therefore we need to do the job of drm_handle_vblank() and
-	 * increment the vblank counter by one to account for this vblank.
-	 *
-	 * Skip this step if there isn't any high precision timestamp
-	 * available. In that case we can't account for this and just
-	 * hope for the best.
-	 */
-	if (vblrc && (abs64(diff_ns) > 1000000)) {
-		/* Store new timestamp in ringbuffer. */
-		vblanktimestamp(dev, pipe, vblcount + 1) = tvblank;
-
-		/* Increment cooked vblank count. This also atomically commits
-		 * the timestamp computed above.
-		 */
-		smp_mb__before_atomic();
-		atomic_inc(&vblank->count);
-		smp_mb__after_atomic();
-	}
-
-	spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags);
-}
-
-static void vblank_disable_fn(unsigned long arg)
-{
-	struct drm_vblank_crtc *vblank = (void *)arg;
-	struct drm_device *dev = vblank->dev;
-	unsigned long irqflags;
-	unsigned int pipe = vblank->pipe;
-
-	if (!dev->vblank_disable_allowed)
-		return;
-
-	spin_lock_irqsave(&dev->vbl_lock, irqflags);
-	if (atomic_read(&vblank->refcount) == 0 && vblank->enabled) {
-		DRM_DEBUG("disabling vblank on crtc %u\n", pipe);
-		vblank_disable_and_save(dev, pipe);
-	}
-	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
-}
-
-/**
- * drm_vblank_cleanup - cleanup vblank support
- * @dev: DRM device
- *
- * This function cleans up any resources allocated in drm_vblank_init.
- */
-void drm_vblank_cleanup(struct drm_device *dev)
-{
-	unsigned int pipe;
-	unsigned long irqflags;
-
-	/* Bail if the driver didn't call drm_vblank_init() */
-	if (dev->num_crtcs == 0)
-		return;
-
-	for (pipe = 0; pipe < dev->num_crtcs; pipe++) {
-		struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-
-		del_timer_sync(&vblank->disable_timer);
-
-		spin_lock_irqsave(&dev->vbl_lock, irqflags);
-		vblank_disable_and_save(dev, pipe);
-		spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
-	}
-
-	kfree(dev->vblank);
-
-	dev->num_crtcs = 0;
-}
-EXPORT_SYMBOL(drm_vblank_cleanup);
-
-/**
- * drm_vblank_init - initialize vblank support
- * @dev: DRM device
- * @num_crtcs: number of CRTCs supported by @dev
- *
- * This function initializes vblank support for @num_crtcs display pipelines.
- *
- * Returns:
- * Zero on success or a negative error code on failure.
- */
-int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
-{
-	int ret = -ENOMEM;
-	unsigned int i;
-
-	spin_lock_init(&dev->vbl_lock);
-	spin_lock_init(&dev->vblank_time_lock);
-
-	dev->num_crtcs = num_crtcs;
-
-	dev->vblank = kcalloc(num_crtcs, sizeof(*dev->vblank), GFP_KERNEL);
-	if (!dev->vblank)
-		goto err;
-
-	for (i = 0; i < num_crtcs; i++) {
-		struct drm_vblank_crtc *vblank = &dev->vblank[i];
-
-		vblank->dev = dev;
-		vblank->pipe = i;
-		init_waitqueue_head(&vblank->queue);
-		setup_timer(&vblank->disable_timer, vblank_disable_fn,
-			    (unsigned long)vblank);
-	}
-
-	DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n");
-
-	/* Driver specific high-precision vblank timestamping supported? */
-	if (dev->driver->get_vblank_timestamp)
-		DRM_INFO("Driver supports precise vblank timestamp query.\n");
-	else
-		DRM_INFO("No driver support for vblank timestamp query.\n");
-
-	dev->vblank_disable_allowed = false;
-
-	return 0;
-
-err:
-	dev->num_crtcs = 0;
-	return ret;
-}
-EXPORT_SYMBOL(drm_vblank_init);
-
-static void drm_irq_vgaarb_nokms(void *cookie, bool state)
-{
-	struct drm_device *dev = cookie;
-
-	if (dev->driver->vgaarb_irq) {
-		dev->driver->vgaarb_irq(dev, state);
-		return;
-	}
-
-	if (!dev->irq_enabled)
-		return;
-
-	if (state) {
-		if (dev->driver->irq_uninstall)
-			dev->driver->irq_uninstall(dev);
-	} else {
-		if (dev->driver->irq_preinstall)
-			dev->driver->irq_preinstall(dev);
-		if (dev->driver->irq_postinstall)
-			dev->driver->irq_postinstall(dev);
-	}
-}
-
-/**
- * drm_irq_install - install IRQ handler
- * @dev: DRM device
- * @irq: IRQ number to install the handler for
- *
- * Initializes the IRQ related data. Installs the handler, calling the driver
- * irq_preinstall() and irq_postinstall() functions before and after the
- * installation.
- *
- * This is the simplified helper interface provided for drivers with no special
- * needs. Drivers which need to install interrupt handlers for multiple
- * interrupts must instead set drm_device->irq_enabled to signal the DRM core
- * that vblank interrupts are available.
- *
- * Returns:
- * Zero on success or a negative error code on failure.
- */
-int drm_irq_install(struct drm_device *dev, int irq)
-{
-	int ret;
-	unsigned long sh_flags = 0;
-
-	if (!drm_core_check_feature(dev, DRIVER_HAVE_IRQ))
-		return -EINVAL;
-
-	if (irq == 0)
-		return -EINVAL;
-
-	/* Driver must have been initialized */
-	if (!dev->dev_private)
-		return -EINVAL;
-
-	if (dev->irq_enabled)
-		return -EBUSY;
-	dev->irq_enabled = true;
-
-	DRM_DEBUG("irq=%d\n", irq);
-
-	/* Before installing handler */
-	if (dev->driver->irq_preinstall)
-		dev->driver->irq_preinstall(dev);
-
-	/* Install handler */
-	if (drm_core_check_feature(dev, DRIVER_IRQ_SHARED))
-		sh_flags = IRQF_SHARED;
-
-	ret = request_irq(irq, dev->driver->irq_handler,
-			  sh_flags, dev->driver->name, dev);
-
-	if (ret < 0) {
-		dev->irq_enabled = false;
-		return ret;
-	}
-
-	if (!drm_core_check_feature(dev, DRIVER_MODESET))
-		vga_client_register(dev->pdev, (void *)dev, drm_irq_vgaarb_nokms, NULL);
-
-	/* After installing handler */
-	if (dev->driver->irq_postinstall)
-		ret = dev->driver->irq_postinstall(dev);
-
-	if (ret < 0) {
-		dev->irq_enabled = false;
-		if (!drm_core_check_feature(dev, DRIVER_MODESET))
-			vga_client_register(dev->pdev, NULL, NULL, NULL);
-		free_irq(irq, dev);
-	} else {
-		dev->irq = irq;
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_irq_install);
-
-/**
- * drm_irq_uninstall - uninstall the IRQ handler
- * @dev: DRM device
- *
- * Calls the driver's irq_uninstall() function and unregisters the IRQ handler.
- * This should only be called by drivers which used drm_irq_install() to set up
- * their interrupt handler. Other drivers must only reset
- * drm_device->irq_enabled to false.
- *
- * Note that for kernel modesetting drivers it is a bug if this function fails.
- * The sanity checks are only to catch buggy user modesetting drivers which call
- * the same function through an ioctl.
- *
- * Returns:
- * Zero on success or a negative error code on failure.
- */
-int drm_irq_uninstall(struct drm_device *dev)
-{
-	unsigned long irqflags;
-	bool irq_enabled;
-	int i;
-
-	if (!drm_core_check_feature(dev, DRIVER_HAVE_IRQ))
-		return -EINVAL;
-
-	irq_enabled = dev->irq_enabled;
-	dev->irq_enabled = false;
-
-	/*
-	 * Wake up any waiters so they don't hang.
-	 */
-	if (dev->num_crtcs) {
-		spin_lock_irqsave(&dev->vbl_lock, irqflags);
-		for (i = 0; i < dev->num_crtcs; i++) {
-			struct drm_vblank_crtc *vblank = &dev->vblank[i];
-
-			wake_up(&vblank->queue);
-			vblank->enabled = false;
-			vblank->last =
-				dev->driver->get_vblank_counter(dev, i);
-		}
-		spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
-	}
-
-	if (!irq_enabled)
-		return -EINVAL;
-
-	DRM_DEBUG("irq=%d\n", dev->irq);
-
-	if (!drm_core_check_feature(dev, DRIVER_MODESET))
-		vga_client_register(dev->pdev, NULL, NULL, NULL);
-
-	if (dev->driver->irq_uninstall)
-		dev->driver->irq_uninstall(dev);
-
-	free_irq(dev->irq, dev);
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_irq_uninstall);
-
-/*
- * IRQ control ioctl.
- *
- * \param inode device inode.
- * \param file_priv DRM file private.
- * \param cmd command.
- * \param arg user argument, pointing to a drm_control structure.
- * \return zero on success or a negative number on failure.
- *
- * Calls irq_install() or irq_uninstall() according to \p arg.
- */
-int drm_control(struct drm_device *dev, void *data,
-		struct drm_file *file_priv)
-{
-	struct drm_control *ctl = data;
-	int ret = 0, irq;
-
-	/* if we haven't irq we fallback for compatibility reasons -
-	 * this used to be a separate function in drm_dma.h
-	 */
-
-	if (!drm_core_check_feature(dev, DRIVER_HAVE_IRQ))
-		return 0;
-	if (drm_core_check_feature(dev, DRIVER_MODESET))
-		return 0;
-	/* UMS was only ever support on pci devices. */
-	if (WARN_ON(!dev->pdev))
-		return -EINVAL;
-
-	switch (ctl->func) {
-	case DRM_INST_HANDLER:
-		irq = dev->pdev->irq;
-
-		if (dev->if_version < DRM_IF_VERSION(1, 2) &&
-		    ctl->irq != irq)
-			return -EINVAL;
-		mutex_lock(&dev->struct_mutex);
-		ret = drm_irq_install(dev, irq);
-		mutex_unlock(&dev->struct_mutex);
-
-		return ret;
-	case DRM_UNINST_HANDLER:
-		mutex_lock(&dev->struct_mutex);
-		ret = drm_irq_uninstall(dev);
-		mutex_unlock(&dev->struct_mutex);
-
-		return ret;
-	default:
-		return -EINVAL;
-	}
-}
-
-/**
  * drm_calc_timestamping_constants - calculate vblank timestamp constants
  * @crtc: drm_crtc whose timestamp constants should be updated.
  * @mode: display mode containing the scanout timings
@@ -770,83 +280,6 @@ int drm_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_calc_vbltimestamp_from_scanoutpos);
 
-static struct timeval get_drm_timestamp(void)
-{
-	ktime_t now;
-
-	now = drm_timestamp_monotonic ? ktime_get() : ktime_get_real();
-	return ktime_to_timeval(now);
-}
-
-/**
- * drm_get_last_vbltimestamp - retrieve raw timestamp for the most recent
- *                             vblank interval
- * @dev: DRM device
- * @pipe: index of CRTC whose vblank timestamp to retrieve
- * @tvblank: Pointer to target struct timeval which should receive the timestamp
- * @flags: Flags to pass to driver:
- *         0 = Default,
- *         DRM_CALLED_FROM_VBLIRQ = If function is called from vbl IRQ handler
- *
- * Fetches the system timestamp corresponding to the time of the most recent
- * vblank interval on specified CRTC. May call into kms-driver to
- * compute the timestamp with a high-precision GPU specific method.
- *
- * Returns zero if timestamp originates from uncorrected do_gettimeofday()
- * call, i.e., it isn't very precisely locked to the true vblank.
- *
- * Returns:
- * True if timestamp is considered to be very precise, false otherwise.
- */
-static bool
-drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
-			  struct timeval *tvblank, unsigned flags)
-{
-	int ret;
-
-	/* Define requested maximum error on timestamps (nanoseconds). */
-	int max_error = (int) drm_timestamp_precision * 1000;
-
-	/* Query driver if possible and precision timestamping enabled. */
-	if (dev->driver->get_vblank_timestamp && (max_error > 0)) {
-		ret = dev->driver->get_vblank_timestamp(dev, pipe, &max_error,
-							tvblank, flags);
-		if (ret > 0)
-			return true;
-	}
-
-	/* GPU high precision timestamp query unsupported or failed.
-	 * Return current monotonic/gettimeofday timestamp as best estimate.
-	 */
-	*tvblank = get_drm_timestamp();
-
-	return false;
-}
-
-/**
- * drm_vblank_count - retrieve "cooked" vblank counter value
- * @dev: DRM device
- * @pipe: index of CRTC for which to retrieve the counter
- *
- * Fetches the "cooked" vblank count value that represents the number of
- * vblank events since the system was booted, including lost events due to
- * modesetting activity.
- *
- * This is the legacy version of drm_crtc_vblank_count().
- *
- * Returns:
- * The software vblank counter.
- */
-u32 drm_vblank_count(struct drm_device *dev, int pipe)
-{
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-
-	if (WARN_ON(pipe >= dev->num_crtcs))
-		return 0;
-	return atomic_read(&vblank->count);
-}
-EXPORT_SYMBOL(drm_vblank_count);
-
 /**
  * drm_crtc_vblank_count - retrieve "cooked" vblank counter value
  * @crtc: which counter to retrieve
@@ -925,51 +358,6 @@ u32 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
 
-static void send_vblank_event(struct drm_device *dev,
-		struct drm_pending_vblank_event *e,
-		unsigned long seq, struct timeval *now)
-{
-	WARN_ON_SMP(!spin_is_locked(&dev->event_lock));
-	e->event.sequence = seq;
-	e->event.tv_sec = now->tv_sec;
-	e->event.tv_usec = now->tv_usec;
-
-	list_add_tail(&e->base.link,
-		      &e->base.file_priv->event_list);
-	wake_up_interruptible(&e->base.file_priv->event_wait);
-	trace_drm_vblank_event_delivered(e->base.pid, e->pipe,
-					 e->event.sequence);
-}
-
-/**
- * drm_send_vblank_event - helper to send vblank event after pageflip
- * @dev: DRM device
- * @pipe: CRTC index
- * @e: the event to send
- *
- * Updates sequence # and timestamp on event, and sends it to userspace.
- * Caller must hold event lock.
- *
- * This is the legacy version of drm_crtc_send_vblank_event().
- */
-void drm_send_vblank_event(struct drm_device *dev, unsigned int pipe,
-			   struct drm_pending_vblank_event *e)
-{
-	struct timeval now;
-	unsigned int seq;
-
-	if (dev->num_crtcs > 0) {
-		seq = drm_vblank_count_and_time(dev, pipe, &now);
-	} else {
-		seq = 0;
-
-		now = get_drm_timestamp();
-	}
-	e->pipe = pipe;
-	send_vblank_event(dev, e, seq, &now);
-}
-EXPORT_SYMBOL(drm_send_vblank_event);
-
 /**
  * drm_crtc_send_vblank_event - helper to send vblank event after pageflip
  * @crtc: the source CRTC of the vblank event
@@ -988,84 +376,6 @@ void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 EXPORT_SYMBOL(drm_crtc_send_vblank_event);
 
 /**
- * drm_vblank_enable - enable the vblank interrupt on a CRTC
- * @dev: DRM device
- * @pipe: CRTC index
- *
- * Returns:
- * Zero on success or a negative error code on failure.
- */
-static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
-{
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	int ret = 0;
-
-	assert_spin_locked(&dev->vbl_lock);
-
-	spin_lock(&dev->vblank_time_lock);
-
-	if (!vblank->enabled) {
-		/*
-		 * Enable vblank irqs under vblank_time_lock protection.
-		 * All vblank count & timestamp updates are held off
-		 * until we are done reinitializing master counter and
-		 * timestamps. Filtercode in drm_handle_vblank() will
-		 * prevent double-accounting of same vblank interval.
-		 */
-		ret = dev->driver->enable_vblank(dev, pipe);
-		DRM_DEBUG("enabling vblank on crtc %u, ret: %d\n", pipe, ret);
-		if (ret)
-			atomic_dec(&vblank->refcount);
-		else {
-			vblank->enabled = true;
-			drm_update_vblank_count(dev, pipe);
-		}
-	}
-
-	spin_unlock(&dev->vblank_time_lock);
-
-	return ret;
-}
-
-/**
- * drm_vblank_get - get a reference count on vblank events
- * @dev: DRM device
- * @pipe: index of CRTC to own
- *
- * Acquire a reference count on vblank events to avoid having them disabled
- * while in use.
- *
- * This is the legacy version of drm_crtc_vblank_get().
- *
- * Returns:
- * Zero on success or a negative error code on failure.
- */
-int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
-{
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	unsigned long irqflags;
-	int ret = 0;
-
-	if (WARN_ON(pipe >= dev->num_crtcs))
-		return -EINVAL;
-
-	spin_lock_irqsave(&dev->vbl_lock, irqflags);
-	/* Going from 0->1 means we have to enable interrupts again */
-	if (atomic_add_return(1, &vblank->refcount) == 1) {
-		ret = drm_vblank_enable(dev, pipe);
-	} else {
-		if (!vblank->enabled) {
-			atomic_dec(&vblank->refcount);
-			ret = -EINVAL;
-		}
-	}
-	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_vblank_get);
-
-/**
  * drm_crtc_vblank_get - get a reference count on vblank events
  * @crtc: which CRTC to own
  *
@@ -1084,39 +394,6 @@ int drm_crtc_vblank_get(struct drm_crtc *crtc)
 EXPORT_SYMBOL(drm_crtc_vblank_get);
 
 /**
- * drm_vblank_put - release ownership of vblank events
- * @dev: DRM device
- * @pipe: index of CRTC to release
- *
- * Release ownership of a given vblank counter, turning off interrupts
- * if possible. Disable interrupts after drm_vblank_offdelay milliseconds.
- *
- * This is the legacy version of drm_crtc_vblank_put().
- */
-void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
-{
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-
-	if (WARN_ON(pipe >= dev->num_crtcs))
-		return;
-
-	if (WARN_ON(atomic_read(&vblank->refcount) == 0))
-		return;
-
-	/* Last user schedules interrupt disable */
-	if (atomic_dec_and_test(&vblank->refcount)) {
-		if (drm_vblank_offdelay == 0)
-			return;
-		else if (dev->vblank_disable_immediate || drm_vblank_offdelay < 0)
-			vblank_disable_fn((unsigned long)vblank);
-		else
-			mod_timer(&vblank->disable_timer,
-				  jiffies + ((drm_vblank_offdelay * HZ)/1000));
-	}
-}
-EXPORT_SYMBOL(drm_vblank_put);
-
-/**
  * drm_crtc_vblank_put - give up ownership of vblank events
  * @crtc: which counter to give up
  *
@@ -1132,40 +409,6 @@ void drm_crtc_vblank_put(struct drm_crtc *crtc)
 EXPORT_SYMBOL(drm_crtc_vblank_put);
 
 /**
- * drm_wait_one_vblank - wait for one vblank
- * @dev: DRM device
- * @pipe: CRTC index
- *
- * This waits for one vblank to pass on @crtc, using the irq driver interfaces.
- * It is a failure to call this when the vblank irq for @crtc is disabled, e.g.
- * due to lack of driver support or because the crtc is off.
- */
-void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
-{
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	int ret;
-	u32 last;
-
-	if (WARN_ON(pipe >= dev->num_crtcs))
-		return;
-
-	ret = drm_vblank_get(dev, pipe);
-	if (WARN(ret, "vblank not available on crtc %i, ret=%i\n", pipe, ret))
-		return;
-
-	last = drm_vblank_count(dev, pipe);
-
-	ret = wait_event_timeout(vblank->queue,
-				 last != drm_vblank_count(dev, pipe),
-				 msecs_to_jiffies(100));
-
-	WARN(ret == 0, "vblank wait timed out on crtc %i\n", pipe);
-
-	drm_vblank_put(dev, pipe);
-}
-EXPORT_SYMBOL(drm_wait_one_vblank);
-
-/**
  * drm_crtc_wait_one_vblank - wait for one vblank
  * @crtc: DRM crtc
  *
@@ -1180,64 +423,6 @@ void drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 EXPORT_SYMBOL(drm_crtc_wait_one_vblank);
 
 /**
- * drm_vblank_off - disable vblank events on a CRTC
- * @dev: DRM device
- * @pipe: CRTC index
- *
- * Drivers can use this function to shut down the vblank interrupt handling when
- * disabling a crtc. This function ensures that the latest vblank frame count is
- * stored so that drm_vblank_on() can restore it again.
- *
- * Drivers must use this function when the hardware vblank counter can get
- * reset, e.g. when suspending.
- *
- * This is the legacy version of drm_crtc_vblank_off().
- */
-void drm_vblank_off(struct drm_device *dev, unsigned int pipe)
-{
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	struct drm_pending_vblank_event *e, *t;
-	struct timeval now;
-	unsigned long irqflags;
-	unsigned int seq;
-
-	if (WARN_ON(pipe >= dev->num_crtcs))
-		return;
-
-	spin_lock_irqsave(&dev->event_lock, irqflags);
-
-	spin_lock(&dev->vbl_lock);
-	vblank_disable_and_save(dev, pipe);
-	wake_up(&vblank->queue);
-
-	/*
-	 * Prevent subsequent drm_vblank_get() from re-enabling
-	 * the vblank interrupt by bumping the refcount.
-	 */
-	if (!vblank->inmodeset) {
-		atomic_inc(&vblank->refcount);
-		vblank->inmodeset = 1;
-	}
-	spin_unlock(&dev->vbl_lock);
-
-	/* Send any queued vblank events, lest the natives grow disquiet */
-	seq = drm_vblank_count_and_time(dev, pipe, &now);
-
-	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
-		if (e->pipe != pipe)
-			continue;
-		DRM_DEBUG("Sending premature vblank event on disable: \
-			  wanted %d, current %d\n",
-			  e->event.sequence, seq);
-		list_del(&e->base.link);
-		drm_vblank_put(dev, pipe);
-		send_vblank_event(dev, e, seq, &now);
-	}
-	spin_unlock_irqrestore(&dev->event_lock, irqflags);
-}
-EXPORT_SYMBOL(drm_vblank_off);
-
-/**
  * drm_crtc_vblank_off - disable vblank events on a CRTC
  * @crtc: CRTC in question
  *
@@ -1257,54 +442,6 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 EXPORT_SYMBOL(drm_crtc_vblank_off);
 
 /**
- * drm_vblank_on - enable vblank events on a CRTC
- * @dev: DRM device
- * @pipe: CRTC index
- *
- * This functions restores the vblank interrupt state captured with
- * drm_vblank_off() again. Note that calls to drm_vblank_on() and
- * drm_vblank_off() can be unbalanced and so can also be unconditionally called
- * in driver load code to reflect the current hardware state of the crtc.
- *
- * This is the legacy version of drm_crtc_vblank_on().
- */
-void drm_vblank_on(struct drm_device *dev, unsigned int pipe)
-{
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	unsigned long irqflags;
-
-	if (WARN_ON(pipe >= dev->num_crtcs))
-		return;
-
-	spin_lock_irqsave(&dev->vbl_lock, irqflags);
-	/* Drop our private "prevent drm_vblank_get" refcount */
-	if (vblank->inmodeset) {
-		atomic_dec(&vblank->refcount);
-		vblank->inmodeset = 0;
-	}
-
-	/*
-	 * sample the current counter to avoid random jumps
-	 * when drm_vblank_enable() applies the diff
-	 *
-	 * -1 to make sure user will never see the same
-	 * vblank counter value before and after a modeset
-	 */
-	vblank->last =
-		(dev->driver->get_vblank_counter(dev, pipe) - 1) &
-		dev->max_vblank_count;
-	/*
-	 * re-enable interrupts if there are users left, or the
-	 * user wishes vblank interrupts to be enabled all the time.
-	 */
-	if (atomic_read(&vblank->refcount) != 0 ||
-	    (!dev->vblank_disable_immediate && drm_vblank_offdelay == 0))
-		WARN_ON(drm_vblank_enable(dev, pipe));
-	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
-}
-EXPORT_SYMBOL(drm_vblank_on);
-
-/**
  * drm_crtc_vblank_on - enable vblank events on a CRTC
  * @crtc: CRTC in question
  *
@@ -1321,129 +458,20 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_on);
 
-/**
- * drm_vblank_pre_modeset - account for vblanks across mode sets
- * @dev: DRM device
- * @pipe: CRTC index
- *
- * Account for vblank events across mode setting events, which will likely
- * reset the hardware frame counter.
- *
- * This is done by grabbing a temporary vblank reference to ensure that the
- * vblank interrupt keeps running across the modeset sequence. With this the
- * software-side vblank frame counting will ensure that there are no jumps or
- * discontinuities.
- *
- * Unfortunately this approach is racy and also doesn't work when the vblank
- * interrupt stops running, e.g. across system suspend resume. It is therefore
- * highly recommended that drivers use the newer drm_vblank_off() and
- * drm_vblank_on() instead. drm_vblank_pre_modeset() only works correctly when
- * using "cooked" software vblank frame counters and not relying on any hardware
- * counters.
- *
- * Drivers must call drm_vblank_post_modeset() when re-enabling the same crtc
- * again.
- */
-void drm_vblank_pre_modeset(struct drm_device *dev, unsigned int pipe)
-{
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-
-	/* vblank is not initialized (IRQ not installed ?), or has been freed */
-	if (!dev->num_crtcs)
-		return;
-
-	if (WARN_ON(pipe >= dev->num_crtcs))
-		return;
-
-	/*
-	 * To avoid all the problems that might happen if interrupts
-	 * were enabled/disabled around or between these calls, we just
-	 * have the kernel take a reference on the CRTC (just once though
-	 * to avoid corrupting the count if multiple, mismatch calls occur),
-	 * so that interrupts remain enabled in the interim.
-	 */
-	if (!vblank->inmodeset) {
-		vblank->inmodeset = 0x1;
-		if (drm_vblank_get(dev, pipe) == 0)
-			vblank->inmodeset |= 0x2;
-	}
-}
-EXPORT_SYMBOL(drm_vblank_pre_modeset);
-
-/**
- * drm_vblank_post_modeset - undo drm_vblank_pre_modeset changes
- * @dev: DRM device
- * @pipe: CRTC index
- *
- * This function again drops the temporary vblank reference acquired in
- * drm_vblank_pre_modeset.
- */
-void drm_vblank_post_modeset(struct drm_device *dev, unsigned int pipe)
-{
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	unsigned long irqflags;
-
-	/* vblank is not initialized (IRQ not installed ?), or has been freed */
-	if (!dev->num_crtcs)
-		return;
-
-	if (WARN_ON(pipe >= dev->num_crtcs))
-		return;
-
-	if (vblank->inmodeset) {
-		spin_lock_irqsave(&dev->vbl_lock, irqflags);
-		dev->vblank_disable_allowed = true;
-		spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
-
-		if (vblank->inmodeset & 0x2)
-			drm_vblank_put(dev, pipe);
-
-		vblank->inmodeset = 0;
-	}
-}
-EXPORT_SYMBOL(drm_vblank_post_modeset);
-
-/*
- * drm_modeset_ctl - handle vblank event counter changes across mode switch
- * @DRM_IOCTL_ARGS: standard ioctl arguments
- *
- * Applications should call the %_DRM_PRE_MODESET and %_DRM_POST_MODESET
- * ioctls around modesetting so that any lost vblank events are accounted for.
- *
- * Generally the counter will reset across mode sets.  If interrupts are
- * enabled around this call, we don't have to do anything since the counter
- * will have already been incremented.
- */
-int drm_modeset_ctl(struct drm_device *dev, void *data,
-		    struct drm_file *file_priv)
+static void send_vblank_event(struct drm_device *dev,
+		struct drm_pending_vblank_event *e,
+		unsigned long seq, struct timeval *now)
 {
-	struct drm_modeset_ctl *modeset = data;
-	unsigned int pipe;
-
-	/* If drm_vblank_init() hasn't been called yet, just no-op */
-	if (!dev->num_crtcs)
-		return 0;
-
-	/* KMS drivers handle this internally */
-	if (drm_core_check_feature(dev, DRIVER_MODESET))
-		return 0;
-
-	pipe = modeset->crtc;
-	if (pipe >= dev->num_crtcs)
-		return -EINVAL;
-
-	switch (modeset->cmd) {
-	case _DRM_PRE_MODESET:
-		drm_vblank_pre_modeset(dev, pipe);
-		break;
-	case _DRM_POST_MODESET:
-		drm_vblank_post_modeset(dev, pipe);
-		break;
-	default:
-		return -EINVAL;
-	}
+	WARN_ON_SMP(!spin_is_locked(&dev->event_lock));
+	e->event.sequence = seq;
+	e->event.tv_sec = now->tv_sec;
+	e->event.tv_usec = now->tv_usec;
 
-	return 0;
+	list_add_tail(&e->base.link,
+		      &e->base.file_priv->event_list);
+	wake_up_interruptible(&e->base.file_priv->event_wait);
+	trace_drm_vblank_event_delivered(e->base.pid, e->pipe,
+					 e->event.sequence);
 }
 
 static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
@@ -1635,119 +663,6 @@ done:
 	return ret;
 }
 
-static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
-{
-	struct drm_pending_vblank_event *e, *t;
-	struct timeval now;
-	unsigned int seq;
-
-	assert_spin_locked(&dev->event_lock);
-
-	seq = drm_vblank_count_and_time(dev, pipe, &now);
-
-	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
-		if (e->pipe != pipe)
-			continue;
-		if ((seq - e->event.sequence) > (1<<23))
-			continue;
-
-		DRM_DEBUG("vblank event on %d, current %d\n",
-			  e->event.sequence, seq);
-
-		list_del(&e->base.link);
-		drm_vblank_put(dev, pipe);
-		send_vblank_event(dev, e, seq, &now);
-	}
-
-	trace_drm_vblank_event(pipe, seq);
-}
-
-/**
- * drm_handle_vblank - handle a vblank event
- * @dev: DRM device
- * @pipe: index of CRTC where this event occurred
- *
- * Drivers should call this routine in their vblank interrupt handlers to
- * update the vblank counter and send any signals that may be pending.
- *
- * This is the legacy version of drm_crtc_handle_vblank().
- */
-bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
-{
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
-	u32 vblcount;
-	s64 diff_ns;
-	struct timeval tvblank;
-	unsigned long irqflags;
-
-	if (!dev->num_crtcs)
-		return false;
-
-	if (WARN_ON(pipe >= dev->num_crtcs))
-		return false;
-
-	spin_lock_irqsave(&dev->event_lock, irqflags);
-
-	/* Need timestamp lock to prevent concurrent execution with
-	 * vblank enable/disable, as this would cause inconsistent
-	 * or corrupted timestamps and vblank counts.
-	 */
-	spin_lock(&dev->vblank_time_lock);
-
-	/* Vblank irq handling disabled. Nothing to do. */
-	if (!vblank->enabled) {
-		spin_unlock(&dev->vblank_time_lock);
-		spin_unlock_irqrestore(&dev->event_lock, irqflags);
-		return false;
-	}
-
-	/* Fetch corresponding timestamp for this vblank interval from
-	 * driver and store it in proper slot of timestamp ringbuffer.
-	 */
-
-	/* Get current timestamp and count. */
-	vblcount = atomic_read(&vblank->count);
-	drm_get_last_vbltimestamp(dev, pipe, &tvblank, DRM_CALLED_FROM_VBLIRQ);
-
-	/* Compute time difference to timestamp of last vblank */
-	diff_ns = timeval_to_ns(&tvblank) -
-		  timeval_to_ns(&vblanktimestamp(dev, pipe, vblcount));
-
-	/* Update vblank timestamp and count if at least
-	 * DRM_REDUNDANT_VBLIRQ_THRESH_NS nanoseconds
-	 * difference between last stored timestamp and current
-	 * timestamp. A smaller difference means basically
-	 * identical timestamps. Happens if this vblank has
-	 * been already processed and this is a redundant call,
-	 * e.g., due to spurious vblank interrupts. We need to
-	 * ignore those for accounting.
-	 */
-	if (abs64(diff_ns) > DRM_REDUNDANT_VBLIRQ_THRESH_NS) {
-		/* Store new timestamp in ringbuffer. */
-		vblanktimestamp(dev, pipe, vblcount + 1) = tvblank;
-
-		/* Increment cooked vblank count. This also atomically commits
-		 * the timestamp computed above.
-		 */
-		smp_mb__before_atomic();
-		atomic_inc(&vblank->count);
-		smp_mb__after_atomic();
-	} else {
-		DRM_DEBUG("crtc %u: Redundant vblirq ignored. diff_ns = %d\n",
-			  pipe, (int) diff_ns);
-	}
-
-	spin_unlock(&dev->vblank_time_lock);
-
-	wake_up(&vblank->queue);
-	drm_handle_vblank_events(dev, pipe);
-
-	spin_unlock_irqrestore(&dev->event_lock, irqflags);
-
-	return true;
-}
-EXPORT_SYMBOL(drm_handle_vblank);
-
 /**
  * drm_crtc_handle_vblank - handle a vblank event
  * @crtc: where this event occurred
diff --git a/drivers/gpu/drm/drm_irq_legacy.c b/drivers/gpu/drm/drm_irq_legacy.c
new file mode 100644
index 000000000000..9367ce8a36fd
--- /dev/null
+++ b/drivers/gpu/drm/drm_irq_legacy.c
@@ -0,0 +1,1144 @@
+/*
+ * drm_irq_legacy.c legacy IRQ and vblank support
+ *
+ * \author Rickard E. (Rik) Faith <faith@valinux.com>
+ * \author Gareth Hughes <gareth@valinux.com>
+ */
+
+/*
+ * Copyright 1999, 2000 Precision Insight, Inc., Cedar Park, Texas.
+ * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <linux/vgaarb.h>
+
+#include <drm/drmP.h>
+
+#include "drm_internal.h"
+#include "drm_trace.h"
+
+/* Access macro for slots in vblank timestamp ringbuffer. */
+#define vblanktimestamp(dev, pipe, count) \
+	((dev)->vblank[pipe].time[(count) % DRM_VBLANKTIME_RBSIZE])
+
+/*
+ * Threshold in nanoseconds for detection of redundant vblank irq in
+ * drm_handle_vblank(). 1 msec should be ok.
+ */
+#define DRM_REDUNDANT_VBLIRQ_THRESH_NS 1000000
+
+/*
+ * Retry timestamp calculation up to 3 times to satisfy
+ * drm_timestamp_precision before giving up.
+ */
+#define DRM_TIMESTAMP_MAXRETRIES 3
+
+static struct timeval get_drm_timestamp(void)
+{
+	ktime_t now;
+
+	now = drm_timestamp_monotonic ? ktime_get() : ktime_get_real();
+	return ktime_to_timeval(now);
+}
+
+/**
+ * drm_get_last_vbltimestamp - retrieve raw timestamp for the most recent
+ *                             vblank interval
+ * @dev: DRM device
+ * @pipe: index of CRTC whose vblank timestamp to retrieve
+ * @tvblank: Pointer to target struct timeval which should receive the timestamp
+ * @flags: Flags to pass to driver:
+ *         0 = Default,
+ *         DRM_CALLED_FROM_VBLIRQ = If function is called from vbl IRQ handler
+ *
+ * Fetches the system timestamp corresponding to the time of the most recent
+ * vblank interval on specified CRTC. May call into kms-driver to
+ * compute the timestamp with a high-precision GPU specific method.
+ *
+ * Returns zero if timestamp originates from uncorrected do_gettimeofday()
+ * call, i.e., it isn't very precisely locked to the true vblank.
+ *
+ * Returns:
+ * True if timestamp is considered to be very precise, false otherwise.
+ */
+static bool
+drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
+			  struct timeval *tvblank, unsigned flags)
+{
+	int ret;
+
+	/* Define requested maximum error on timestamps (nanoseconds). */
+	int max_error = (int) drm_timestamp_precision * 1000;
+
+	/* Query driver if possible and precision timestamping enabled. */
+	if (dev->driver->get_vblank_timestamp && (max_error > 0)) {
+		ret = dev->driver->get_vblank_timestamp(dev, pipe, &max_error,
+							tvblank, flags);
+		if (ret > 0)
+			return true;
+	}
+
+	/* GPU high precision timestamp query unsupported or failed.
+	 * Return current monotonic/gettimeofday timestamp as best estimate.
+	 */
+	*tvblank = get_drm_timestamp();
+
+	return false;
+}
+
+/**
+ * drm_update_vblank_count - update the master vblank counter
+ * @dev: DRM device
+ * @pipe: counter to update
+ *
+ * Call back into the driver to update the appropriate vblank counter
+ * (specified by @crtc).  Deal with wraparound, if it occurred, and
+ * update the last read value so we can deal with wraparound on the next
+ * call if necessary.
+ *
+ * Only necessary when going from off->on, to account for frames we
+ * didn't get an interrupt for.
+ *
+ * Note: caller must hold dev->vbl_lock since this reads & writes
+ * device vblank fields.
+ */
+static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe)
+{
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	u32 cur_vblank, diff, tslot;
+	bool rc;
+	struct timeval t_vblank;
+
+	/*
+	 * Interrupts were disabled prior to this call, so deal with counter
+	 * wrap if needed.
+	 * NOTE!  It's possible we lost a full dev->max_vblank_count events
+	 * here if the register is small or we had vblank interrupts off for
+	 * a long time.
+	 *
+	 * We repeat the hardware vblank counter & timestamp query until
+	 * we get consistent results. This to prevent races between gpu
+	 * updating its hardware counter while we are retrieving the
+	 * corresponding vblank timestamp.
+	 */
+	do {
+		cur_vblank = dev->driver->get_vblank_counter(dev, pipe);
+		rc = drm_get_last_vbltimestamp(dev, pipe, &t_vblank, 0);
+	} while (cur_vblank != dev->driver->get_vblank_counter(dev, pipe));
+
+	/* Deal with counter wrap */
+	diff = cur_vblank - vblank->last;
+	if (cur_vblank < vblank->last) {
+		diff += dev->max_vblank_count;
+
+		DRM_DEBUG("last_vblank[%u]=0x%x, cur_vblank=0x%x => diff=0x%x\n",
+			  pipe, vblank->last, cur_vblank, diff);
+	}
+
+	DRM_DEBUG("updating vblank count on crtc %u, missed %d\n",
+		  pipe, diff);
+
+	if (diff == 0)
+		return;
+
+	/* Reinitialize corresponding vblank timestamp if high-precision query
+	 * available. Skip this step if query unsupported or failed. Will
+	 * reinitialize delayed at next vblank interrupt in that case.
+	 */
+	if (rc) {
+		tslot = atomic_read(&vblank->count) + diff;
+		vblanktimestamp(dev, pipe, tslot) = t_vblank;
+	}
+
+	smp_mb__before_atomic();
+	atomic_add(diff, &vblank->count);
+	smp_mb__after_atomic();
+}
+
+/*
+ * Disable vblank irq's on crtc, make sure that last vblank count
+ * of hardware and corresponding consistent software vblank counter
+ * are preserved, even if there are any spurious vblank irq's after
+ * disable.
+ */
+static void vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
+{
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	unsigned long irqflags;
+	u32 vblcount;
+	s64 diff_ns;
+	bool vblrc;
+	struct timeval tvblank;
+	int count = DRM_TIMESTAMP_MAXRETRIES;
+
+	/* Prevent vblank irq processing while disabling vblank irqs,
+	 * so no updates of timestamps or count can happen after we've
+	 * disabled. Needed to prevent races in case of delayed irq's.
+	 */
+	spin_lock_irqsave(&dev->vblank_time_lock, irqflags);
+
+	/*
+	 * If the vblank interrupt was already disabled update the count
+	 * and timestamp to maintain the appearance that the counter
+	 * has been ticking all along until this time. This makes the
+	 * count account for the entire time between drm_vblank_on() and
+	 * drm_vblank_off().
+	 *
+	 * But only do this if precise vblank timestamps are available.
+	 * Otherwise we might read a totally bogus timestamp since drivers
+	 * lacking precise timestamp support rely upon sampling the system clock
+	 * at vblank interrupt time. Which obviously won't work out well if the
+	 * vblank interrupt is disabled.
+	 */
+	if (!vblank->enabled &&
+	    drm_get_last_vbltimestamp(dev, pipe, &tvblank, 0)) {
+		drm_update_vblank_count(dev, pipe);
+		spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags);
+		return;
+	}
+
+	dev->driver->disable_vblank(dev, pipe);
+	vblank->enabled = false;
+
+	/* No further vblank irq's will be processed after
+	 * this point. Get current hardware vblank count and
+	 * vblank timestamp, repeat until they are consistent.
+	 *
+	 * FIXME: There is still a race condition here and in
+	 * drm_update_vblank_count() which can cause off-by-one
+	 * reinitialization of software vblank counter. If gpu
+	 * vblank counter doesn't increment exactly at the leading
+	 * edge of a vblank interval, then we can lose 1 count if
+	 * we happen to execute between start of vblank and the
+	 * delayed gpu counter increment.
+	 */
+	do {
+		vblank->last = dev->driver->get_vblank_counter(dev, pipe);
+		vblrc = drm_get_last_vbltimestamp(dev, pipe, &tvblank, 0);
+	} while (vblank->last != dev->driver->get_vblank_counter(dev, pipe) && (--count) && vblrc);
+
+	if (!count)
+		vblrc = 0;
+
+	/* Compute time difference to stored timestamp of last vblank
+	 * as updated by last invocation of drm_handle_vblank() in vblank irq.
+	 */
+	vblcount = atomic_read(&vblank->count);
+	diff_ns = timeval_to_ns(&tvblank) -
+		  timeval_to_ns(&vblanktimestamp(dev, pipe, vblcount));
+
+	/* If there is at least 1 msec difference between the last stored
+	 * timestamp and tvblank, then we are currently executing our
+	 * disable inside a new vblank interval, the tvblank timestamp
+	 * corresponds to this new vblank interval and the irq handler
+	 * for this vblank didn't run yet and won't run due to our disable.
+	 * Therefore we need to do the job of drm_handle_vblank() and
+	 * increment the vblank counter by one to account for this vblank.
+	 *
+	 * Skip this step if there isn't any high precision timestamp
+	 * available. In that case we can't account for this and just
+	 * hope for the best.
+	 */
+	if (vblrc && (abs64(diff_ns) > 1000000)) {
+		/* Store new timestamp in ringbuffer. */
+		vblanktimestamp(dev, pipe, vblcount + 1) = tvblank;
+
+		/* Increment cooked vblank count. This also atomically commits
+		 * the timestamp computed above.
+		 */
+		smp_mb__before_atomic();
+		atomic_inc(&vblank->count);
+		smp_mb__after_atomic();
+	}
+
+	spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags);
+}
+
+static void vblank_disable_fn(unsigned long arg)
+{
+	struct drm_vblank_crtc *vblank = (void *)arg;
+	struct drm_device *dev = vblank->dev;
+	unsigned long irqflags;
+	unsigned int pipe = vblank->pipe;
+
+	if (!dev->vblank_disable_allowed)
+		return;
+
+	spin_lock_irqsave(&dev->vbl_lock, irqflags);
+	if (atomic_read(&vblank->refcount) == 0 && vblank->enabled) {
+		DRM_DEBUG("disabling vblank on crtc %u\n", pipe);
+		vblank_disable_and_save(dev, pipe);
+	}
+	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
+}
+
+/**
+ * drm_vblank_init - initialize vblank support
+ * @dev: DRM device
+ * @num_crtcs: number of CRTCs supported by @dev
+ *
+ * This function initializes vblank support for @num_crtcs display pipelines.
+ *
+ * Returns:
+ * Zero on success or a negative error code on failure.
+ */
+int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
+{
+	int ret = -ENOMEM;
+	unsigned int i;
+
+	spin_lock_init(&dev->vbl_lock);
+	spin_lock_init(&dev->vblank_time_lock);
+
+	dev->num_crtcs = num_crtcs;
+
+	dev->vblank = kcalloc(num_crtcs, sizeof(*dev->vblank), GFP_KERNEL);
+	if (!dev->vblank)
+		goto err;
+
+	for (i = 0; i < num_crtcs; i++) {
+		struct drm_vblank_crtc *vblank = &dev->vblank[i];
+
+		vblank->dev = dev;
+		vblank->pipe = i;
+		init_waitqueue_head(&vblank->queue);
+		setup_timer(&vblank->disable_timer, vblank_disable_fn,
+			    (unsigned long)vblank);
+	}
+
+	DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n");
+
+	/* Driver specific high-precision vblank timestamping supported? */
+	if (dev->driver->get_vblank_timestamp)
+		DRM_INFO("Driver supports precise vblank timestamp query.\n");
+	else
+		DRM_INFO("No driver support for vblank timestamp query.\n");
+
+	dev->vblank_disable_allowed = false;
+
+	return 0;
+
+err:
+	dev->num_crtcs = 0;
+	return ret;
+}
+EXPORT_SYMBOL(drm_vblank_init);
+
+/**
+ * drm_vblank_cleanup - cleanup vblank support
+ * @dev: DRM device
+ *
+ * This function cleans up any resources allocated in drm_vblank_init.
+ */
+void drm_vblank_cleanup(struct drm_device *dev)
+{
+	unsigned int pipe;
+	unsigned long irqflags;
+
+	/* Bail if the driver didn't call drm_vblank_init() */
+	if (dev->num_crtcs == 0)
+		return;
+
+	for (pipe = 0; pipe < dev->num_crtcs; pipe++) {
+		struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+
+		del_timer_sync(&vblank->disable_timer);
+
+		spin_lock_irqsave(&dev->vbl_lock, irqflags);
+		vblank_disable_and_save(dev, pipe);
+		spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
+	}
+
+	kfree(dev->vblank);
+
+	dev->num_crtcs = 0;
+}
+EXPORT_SYMBOL(drm_vblank_cleanup);
+
+/**
+ * drm_vblank_count - retrieve "cooked" vblank counter value
+ * @dev: DRM device
+ * @pipe: index of CRTC for which to retrieve the counter
+ *
+ * Fetches the "cooked" vblank count value that represents the number of
+ * vblank events since the system was booted, including lost events due to
+ * modesetting activity.
+ *
+ * This is the legacy version of drm_crtc_vblank_count().
+ *
+ * Returns:
+ * The software vblank counter.
+ */
+u32 drm_vblank_count(struct drm_device *dev, int pipe)
+{
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+
+	if (WARN_ON(pipe >= dev->num_crtcs))
+		return 0;
+	return atomic_read(&vblank->count);
+}
+EXPORT_SYMBOL(drm_vblank_count);
+
+/**
+ * drm_vblank_enable - enable the vblank interrupt on a CRTC
+ * @dev: DRM device
+ * @pipe: CRTC index
+ *
+ * Returns:
+ * Zero on success or a negative error code on failure.
+ */
+static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
+{
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	int ret = 0;
+
+	assert_spin_locked(&dev->vbl_lock);
+
+	spin_lock(&dev->vblank_time_lock);
+
+	if (!vblank->enabled) {
+		/*
+		 * Enable vblank irqs under vblank_time_lock protection.
+		 * All vblank count & timestamp updates are held off
+		 * until we are done reinitializing master counter and
+		 * timestamps. Filtercode in drm_handle_vblank() will
+		 * prevent double-accounting of same vblank interval.
+		 */
+		ret = dev->driver->enable_vblank(dev, pipe);
+		DRM_DEBUG("enabling vblank on crtc %u, ret: %d\n", pipe, ret);
+		if (ret)
+			atomic_dec(&vblank->refcount);
+		else {
+			vblank->enabled = true;
+			drm_update_vblank_count(dev, pipe);
+		}
+	}
+
+	spin_unlock(&dev->vblank_time_lock);
+
+	return ret;
+}
+
+/**
+ * drm_vblank_get - get a reference count on vblank events
+ * @dev: DRM device
+ * @crtc: which CRTC to own
+ *
+ * Acquire a reference count on vblank events to avoid having them disabled
+ * while in use.
+ *
+ * This is the legacy version of drm_crtc_vblank_get().
+ *
+ * Returns:
+ * Zero on success, nonzero on failure.
+ */
+int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
+{
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	unsigned long irqflags;
+	int ret = 0;
+
+	if (WARN_ON(pipe >= dev->num_crtcs))
+		return -EINVAL;
+
+	spin_lock_irqsave(&dev->vbl_lock, irqflags);
+	/* Going from 0->1 means we have to enable interrupts again */
+	if (atomic_add_return(1, &vblank->refcount) == 1) {
+		ret = drm_vblank_enable(dev, pipe);
+	} else {
+		if (!vblank->enabled) {
+			atomic_dec(&vblank->refcount);
+			ret = -EINVAL;
+		}
+	}
+	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_vblank_get);
+
+/**
+ * drm_vblank_put - release ownership of vblank events
+ * @dev: DRM device
+ * @pipe: index of CRTC to release
+ *
+ * Release ownership of a given vblank counter, turning off interrupts
+ * if possible. Disable interrupts after drm_vblank_offdelay milliseconds.
+ *
+ * This is the legacy version of drm_crtc_vblank_put().
+ */
+void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
+{
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+
+	if (WARN_ON(pipe >= dev->num_crtcs))
+		return;
+
+	if (WARN_ON(atomic_read(&vblank->refcount) == 0))
+		return;
+
+	/* Last user schedules interrupt disable */
+	if (atomic_dec_and_test(&vblank->refcount)) {
+		if (drm_vblank_offdelay == 0)
+			return;
+		else if (dev->vblank_disable_immediate || drm_vblank_offdelay < 0)
+			vblank_disable_fn((unsigned long)vblank);
+		else
+			mod_timer(&vblank->disable_timer,
+				  jiffies + ((drm_vblank_offdelay * HZ)/1000));
+	}
+}
+EXPORT_SYMBOL(drm_vblank_put);
+
+/**
+ * drm_wait_one_vblank - wait for one vblank
+ * @dev: DRM device
+ * @pipe: CRTC index
+ *
+ * This waits for one vblank to pass on @crtc, using the irq driver interfaces.
+ * It is a failure to call this when the vblank irq for @crtc is disabled, e.g.
+ * due to lack of driver support or because the crtc is off.
+ */
+void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
+{
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	int ret;
+	u32 last;
+
+	if (WARN_ON(pipe >= dev->num_crtcs))
+		return;
+
+	ret = drm_vblank_get(dev, pipe);
+	if (WARN(ret, "vblank not available on crtc %i, ret=%i\n", pipe, ret))
+		return;
+
+	last = drm_vblank_count(dev, pipe);
+
+	ret = wait_event_timeout(vblank->queue,
+				 last != drm_vblank_count(dev, pipe),
+				 msecs_to_jiffies(100));
+
+	WARN(ret == 0, "vblank wait timed out on crtc %i\n", pipe);
+
+	drm_vblank_put(dev, pipe);
+}
+EXPORT_SYMBOL(drm_wait_one_vblank);
+
+static void send_vblank_event(struct drm_device *dev,
+		struct drm_pending_vblank_event *e,
+		unsigned long seq, struct timeval *now)
+{
+	WARN_ON_SMP(!spin_is_locked(&dev->event_lock));
+	e->event.sequence = seq;
+	e->event.tv_sec = now->tv_sec;
+	e->event.tv_usec = now->tv_usec;
+
+	list_add_tail(&e->base.link,
+		      &e->base.file_priv->event_list);
+	wake_up_interruptible(&e->base.file_priv->event_wait);
+	trace_drm_vblank_event_delivered(e->base.pid, e->pipe,
+					 e->event.sequence);
+}
+
+/**
+ * drm_vblank_off - disable vblank events on a CRTC
+ * @dev: DRM device
+ * @pipe: CRTC index
+ *
+ * Drivers can use this function to shut down the vblank interrupt handling when
+ * disabling a crtc. This function ensures that the latest vblank frame count is
+ * stored so that drm_vblank_on() can restore it again.
+ *
+ * Drivers must use this function when the hardware vblank counter can get
+ * reset, e.g. when suspending.
+ *
+ * This is the legacy version of drm_crtc_vblank_off().
+ */
+void drm_vblank_off(struct drm_device *dev, unsigned int pipe)
+{
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_pending_vblank_event *e, *t;
+	struct timeval now;
+	unsigned long irqflags;
+	unsigned int seq;
+
+	if (WARN_ON(pipe >= dev->num_crtcs))
+		return;
+
+	spin_lock_irqsave(&dev->event_lock, irqflags);
+
+	spin_lock(&dev->vbl_lock);
+	vblank_disable_and_save(dev, pipe);
+	wake_up(&vblank->queue);
+
+	/*
+	 * Prevent subsequent drm_vblank_get() from re-enabling
+	 * the vblank interrupt by bumping the refcount.
+	 */
+	if (!vblank->inmodeset) {
+		atomic_inc(&vblank->refcount);
+		vblank->inmodeset = 1;
+	}
+	spin_unlock(&dev->vbl_lock);
+
+	/* Send any queued vblank events, lest the natives grow disquiet */
+	seq = drm_vblank_count_and_time(dev, pipe, &now);
+
+	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
+		if (e->pipe != pipe)
+			continue;
+		DRM_DEBUG("Sending premature vblank event on disable: \
+			  wanted %d, current %d\n",
+			  e->event.sequence, seq);
+		list_del(&e->base.link);
+		drm_vblank_put(dev, pipe);
+		send_vblank_event(dev, e, seq, &now);
+	}
+	spin_unlock_irqrestore(&dev->event_lock, irqflags);
+}
+EXPORT_SYMBOL(drm_vblank_off);
+
+/**
+ * drm_vblank_on - enable vblank events on a CRTC
+ * @dev: DRM device
+ * @pipe: CRTC index
+ *
+ * This functions restores the vblank interrupt state captured with
+ * drm_vblank_off() again. Note that calls to drm_vblank_on() and
+ * drm_vblank_off() can be unbalanced and so can also be unconditionally called
+ * in driver load code to reflect the current hardware state of the crtc.
+ *
+ * This is the legacy version of drm_crtc_vblank_on().
+ */
+void drm_vblank_on(struct drm_device *dev, unsigned int pipe)
+{
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	unsigned long irqflags;
+
+	if (WARN_ON(pipe >= dev->num_crtcs))
+		return;
+
+	spin_lock_irqsave(&dev->vbl_lock, irqflags);
+	/* Drop our private "prevent drm_vblank_get" refcount */
+	if (vblank->inmodeset) {
+		atomic_dec(&vblank->refcount);
+		vblank->inmodeset = 0;
+	}
+
+	/*
+	 * sample the current counter to avoid random jumps
+	 * when drm_vblank_enable() applies the diff
+	 *
+	 * -1 to make sure user will never see the same
+	 * vblank counter value before and after a modeset
+	 */
+	vblank->last =
+		(dev->driver->get_vblank_counter(dev, pipe) - 1) &
+		dev->max_vblank_count;
+	/*
+	 * re-enable interrupts if there are users left, or the
+	 * user wishes vblank interrupts to be enabled all the time.
+	 */
+	if (atomic_read(&vblank->refcount) != 0 ||
+	    (!dev->vblank_disable_immediate && drm_vblank_offdelay == 0))
+		WARN_ON(drm_vblank_enable(dev, pipe));
+	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
+}
+EXPORT_SYMBOL(drm_vblank_on);
+
+/**
+ * drm_vblank_pre_modeset - account for vblanks across mode sets
+ * @dev: DRM device
+ * @pipe: CRTC index
+ *
+ * Account for vblank events across mode setting events, which will likely
+ * reset the hardware frame counter.
+ *
+ * This is done by grabbing a temporary vblank reference to ensure that the
+ * vblank interrupt keeps running across the modeset sequence. With this the
+ * software-side vblank frame counting will ensure that there are no jumps or
+ * discontinuities.
+ *
+ * Unfortunately this approach is racy and also doesn't work when the vblank
+ * interrupt stops running, e.g. across system suspend resume. It is therefore
+ * highly recommended that drivers use the newer drm_vblank_off() and
+ * drm_vblank_on() instead. drm_vblank_pre_modeset() only works correctly when
+ * using "cooked" software vblank frame counters and not relying on any hardware
+ * counters.
+ *
+ * Drivers must call drm_vblank_post_modeset() when re-enabling the same crtc
+ * again.
+ */
+void drm_vblank_pre_modeset(struct drm_device *dev, unsigned int pipe)
+{
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+
+	/* vblank is not initialized (IRQ not installed ?), or has been freed */
+	if (!dev->num_crtcs)
+		return;
+
+	if (WARN_ON(pipe >= dev->num_crtcs))
+		return;
+
+	/*
+	 * To avoid all the problems that might happen if interrupts
+	 * were enabled/disabled around or between these calls, we just
+	 * have the kernel take a reference on the CRTC (just once though
+	 * to avoid corrupting the count if multiple, mismatch calls occur),
+	 * so that interrupts remain enabled in the interim.
+	 */
+	if (!vblank->inmodeset) {
+		vblank->inmodeset = 0x1;
+		if (drm_vblank_get(dev, pipe) == 0)
+			vblank->inmodeset |= 0x2;
+	}
+}
+EXPORT_SYMBOL(drm_vblank_pre_modeset);
+
+/**
+ * drm_vblank_post_modeset - undo drm_vblank_pre_modeset changes
+ * @dev: DRM device
+ * @pipe: CRTC index
+ *
+ * This function again drops the temporary vblank reference acquired in
+ * drm_vblank_pre_modeset.
+ */
+void drm_vblank_post_modeset(struct drm_device *dev, unsigned int pipe)
+{
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	unsigned long irqflags;
+
+	/* vblank is not initialized (IRQ not installed ?), or has been freed */
+	if (!dev->num_crtcs)
+		return;
+
+	if (WARN_ON(pipe >= dev->num_crtcs))
+		return;
+
+	if (vblank->inmodeset) {
+		spin_lock_irqsave(&dev->vbl_lock, irqflags);
+		dev->vblank_disable_allowed = true;
+		spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
+
+		if (vblank->inmodeset & 0x2)
+			drm_vblank_put(dev, pipe);
+
+		vblank->inmodeset = 0;
+	}
+}
+EXPORT_SYMBOL(drm_vblank_post_modeset);
+
+static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
+{
+	struct drm_pending_vblank_event *e, *t;
+	struct timeval now;
+	unsigned int seq;
+
+	assert_spin_locked(&dev->event_lock);
+
+	seq = drm_vblank_count_and_time(dev, pipe, &now);
+
+	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
+		if (e->pipe != pipe)
+			continue;
+		if ((seq - e->event.sequence) > (1<<23))
+			continue;
+
+		DRM_DEBUG("vblank event on %d, current %d\n",
+			  e->event.sequence, seq);
+
+		list_del(&e->base.link);
+		drm_vblank_put(dev, pipe);
+		send_vblank_event(dev, e, seq, &now);
+	}
+
+	trace_drm_vblank_event(pipe, seq);
+}
+
+/**
+ * drm_handle_vblank - handle a vblank event
+ * @dev: DRM device
+ * @pipe: index of CRTC where this event occurred
+ *
+ * Drivers should call this routine in their vblank interrupt handlers to
+ * update the vblank counter and send any signals that may be pending.
+ *
+ * This is the legacy version of drm_crtc_handle_vblank().
+ */
+bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
+{
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	u32 vblcount;
+	s64 diff_ns;
+	struct timeval tvblank;
+	unsigned long irqflags;
+
+	if (!dev->num_crtcs)
+		return false;
+
+	if (WARN_ON(pipe >= dev->num_crtcs))
+		return false;
+
+	spin_lock_irqsave(&dev->event_lock, irqflags);
+
+	/* Need timestamp lock to prevent concurrent execution with
+	 * vblank enable/disable, as this would cause inconsistent
+	 * or corrupted timestamps and vblank counts.
+	 */
+	spin_lock(&dev->vblank_time_lock);
+
+	/* Vblank irq handling disabled. Nothing to do. */
+	if (!vblank->enabled) {
+		spin_unlock(&dev->vblank_time_lock);
+		spin_unlock_irqrestore(&dev->event_lock, irqflags);
+		return false;
+	}
+
+	/* Fetch corresponding timestamp for this vblank interval from
+	 * driver and store it in proper slot of timestamp ringbuffer.
+	 */
+
+	/* Get current timestamp and count. */
+	vblcount = atomic_read(&vblank->count);
+	drm_get_last_vbltimestamp(dev, pipe, &tvblank, DRM_CALLED_FROM_VBLIRQ);
+
+	/* Compute time difference to timestamp of last vblank */
+	diff_ns = timeval_to_ns(&tvblank) -
+		  timeval_to_ns(&vblanktimestamp(dev, pipe, vblcount));
+
+	/* Update vblank timestamp and count if at least
+	 * DRM_REDUNDANT_VBLIRQ_THRESH_NS nanoseconds
+	 * difference between last stored timestamp and current
+	 * timestamp. A smaller difference means basically
+	 * identical timestamps. Happens if this vblank has
+	 * been already processed and this is a redundant call,
+	 * e.g., due to spurious vblank interrupts. We need to
+	 * ignore those for accounting.
+	 */
+	if (abs64(diff_ns) > DRM_REDUNDANT_VBLIRQ_THRESH_NS) {
+		/* Store new timestamp in ringbuffer. */
+		vblanktimestamp(dev, pipe, vblcount + 1) = tvblank;
+
+		/* Increment cooked vblank count. This also atomically commits
+		 * the timestamp computed above.
+		 */
+		smp_mb__before_atomic();
+		atomic_inc(&vblank->count);
+		smp_mb__after_atomic();
+	} else {
+		DRM_DEBUG("crtc %u: Redundant vblirq ignored. diff_ns = %d\n",
+			  pipe, (int) diff_ns);
+	}
+
+	spin_unlock(&dev->vblank_time_lock);
+
+	wake_up(&vblank->queue);
+	drm_handle_vblank_events(dev, pipe);
+
+	spin_unlock_irqrestore(&dev->event_lock, irqflags);
+
+	return true;
+}
+EXPORT_SYMBOL(drm_handle_vblank);
+
+/**
+ * drm_send_vblank_event - helper to send vblank event after pageflip
+ * @dev: DRM device
+ * @pipe: CRTC index
+ * @e: the event to send
+ *
+ * Updates sequence # and timestamp on event, and sends it to userspace.
+ * Caller must hold event lock.
+ *
+ * This is the legacy version of drm_crtc_send_vblank_event().
+ */
+void drm_send_vblank_event(struct drm_device *dev, unsigned int pipe,
+			   struct drm_pending_vblank_event *e)
+{
+	struct timeval now;
+	unsigned int seq;
+
+	if (dev->num_crtcs > 0) {
+		seq = drm_vblank_count_and_time(dev, pipe, &now);
+	} else {
+		seq = 0;
+
+		now = get_drm_timestamp();
+	}
+	e->pipe = pipe;
+	send_vblank_event(dev, e, seq, &now);
+}
+EXPORT_SYMBOL(drm_send_vblank_event);
+
+static void drm_irq_vgaarb_nokms(void *cookie, bool state)
+{
+	struct drm_device *dev = cookie;
+
+	if (dev->driver->vgaarb_irq) {
+		dev->driver->vgaarb_irq(dev, state);
+		return;
+	}
+
+	if (!dev->irq_enabled)
+		return;
+
+	if (state) {
+		if (dev->driver->irq_uninstall)
+			dev->driver->irq_uninstall(dev);
+	} else {
+		if (dev->driver->irq_preinstall)
+			dev->driver->irq_preinstall(dev);
+		if (dev->driver->irq_postinstall)
+			dev->driver->irq_postinstall(dev);
+	}
+}
+
+/**
+ * drm_irq_install - install IRQ handler
+ * @dev: DRM device
+ * @irq: IRQ number to install the handler for
+ *
+ * Initializes the IRQ related data. Installs the handler, calling the driver
+ * irq_preinstall() and irq_postinstall() functions before and after the
+ * installation.
+ *
+ * This is the simplified helper interface provided for drivers with no special
+ * needs. Drivers which need to install interrupt handlers for multiple
+ * interrupts must instead set drm_device->irq_enabled to signal the DRM core
+ * that vblank interrupts are available.
+ *
+ * Returns:
+ * Zero on success or a negative error code on failure.
+ */
+int drm_irq_install(struct drm_device *dev, int irq)
+{
+	int ret;
+	unsigned long sh_flags = 0;
+
+	if (!drm_core_check_feature(dev, DRIVER_HAVE_IRQ))
+		return -EINVAL;
+
+	if (irq == 0)
+		return -EINVAL;
+
+	/* Driver must have been initialized */
+	if (!dev->dev_private)
+		return -EINVAL;
+
+	if (dev->irq_enabled)
+		return -EBUSY;
+	dev->irq_enabled = true;
+
+	DRM_DEBUG("irq=%d\n", irq);
+
+	/* Before installing handler */
+	if (dev->driver->irq_preinstall)
+		dev->driver->irq_preinstall(dev);
+
+	/* Install handler */
+	if (drm_core_check_feature(dev, DRIVER_IRQ_SHARED))
+		sh_flags = IRQF_SHARED;
+
+	ret = request_irq(irq, dev->driver->irq_handler,
+			  sh_flags, dev->driver->name, dev);
+
+	if (ret < 0) {
+		dev->irq_enabled = false;
+		return ret;
+	}
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		vga_client_register(dev->pdev, (void *)dev, drm_irq_vgaarb_nokms, NULL);
+
+	/* After installing handler */
+	if (dev->driver->irq_postinstall)
+		ret = dev->driver->irq_postinstall(dev);
+
+	if (ret < 0) {
+		dev->irq_enabled = false;
+		if (!drm_core_check_feature(dev, DRIVER_MODESET))
+			vga_client_register(dev->pdev, NULL, NULL, NULL);
+		free_irq(irq, dev);
+	} else {
+		dev->irq = irq;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_irq_install);
+
+/**
+ * drm_irq_uninstall - uninstall the IRQ handler
+ * @dev: DRM device
+ *
+ * Calls the driver's irq_uninstall() function and unregisters the IRQ handler.
+ * This should only be called by drivers which used drm_irq_install() to set up
+ * their interrupt handler. Other drivers must only reset
+ * drm_device->irq_enabled to false.
+ *
+ * Note that for kernel modesetting drivers it is a bug if this function fails.
+ * The sanity checks are only to catch buggy user modesetting drivers which call
+ * the same function through an ioctl.
+ *
+ * Returns:
+ * Zero on success or a negative error code on failure.
+ */
+int drm_irq_uninstall(struct drm_device *dev)
+{
+	unsigned long irqflags;
+	bool irq_enabled;
+	int i;
+
+	if (!drm_core_check_feature(dev, DRIVER_HAVE_IRQ))
+		return -EINVAL;
+
+	irq_enabled = dev->irq_enabled;
+	dev->irq_enabled = false;
+
+	/*
+	 * Wake up any waiters so they don't hang.
+	 */
+	if (dev->num_crtcs) {
+		spin_lock_irqsave(&dev->vbl_lock, irqflags);
+		for (i = 0; i < dev->num_crtcs; i++) {
+			struct drm_vblank_crtc *vblank = &dev->vblank[i];
+
+			wake_up(&vblank->queue);
+			vblank->enabled = false;
+			vblank->last =
+				dev->driver->get_vblank_counter(dev, i);
+		}
+		spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
+	}
+
+	if (!irq_enabled)
+		return -EINVAL;
+
+	DRM_DEBUG("irq=%d\n", dev->irq);
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		vga_client_register(dev->pdev, NULL, NULL, NULL);
+
+	if (dev->driver->irq_uninstall)
+		dev->driver->irq_uninstall(dev);
+
+	free_irq(dev->irq, dev);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_irq_uninstall);
+
+/*
+ * IRQ control ioctl.
+ *
+ * \param inode device inode.
+ * \param file_priv DRM file private.
+ * \param cmd command.
+ * \param arg user argument, pointing to a drm_control structure.
+ * \return zero on success or a negative number on failure.
+ *
+ * Calls irq_install() or irq_uninstall() according to \p arg.
+ */
+int drm_control(struct drm_device *dev, void *data,
+		struct drm_file *file_priv)
+{
+	struct drm_control *ctl = data;
+	int ret = 0, irq;
+
+	/* if we haven't irq we fallback for compatibility reasons -
+	 * this used to be a separate function in drm_dma.h
+	 */
+
+	if (!drm_core_check_feature(dev, DRIVER_HAVE_IRQ))
+		return 0;
+	if (drm_core_check_feature(dev, DRIVER_MODESET))
+		return 0;
+	/* UMS was only ever support on pci devices. */
+	if (WARN_ON(!dev->pdev))
+		return -EINVAL;
+
+	switch (ctl->func) {
+	case DRM_INST_HANDLER:
+		irq = dev->pdev->irq;
+
+		if (dev->if_version < DRM_IF_VERSION(1, 2) &&
+		    ctl->irq != irq)
+			return -EINVAL;
+		mutex_lock(&dev->struct_mutex);
+		ret = drm_irq_install(dev, irq);
+		mutex_unlock(&dev->struct_mutex);
+
+		return ret;
+	case DRM_UNINST_HANDLER:
+		mutex_lock(&dev->struct_mutex);
+		ret = drm_irq_uninstall(dev);
+		mutex_unlock(&dev->struct_mutex);
+
+		return ret;
+	default:
+		return -EINVAL;
+	}
+}
+
+/*
+ * drm_modeset_ctl - handle vblank event counter changes across mode switch
+ * @DRM_IOCTL_ARGS: standard ioctl arguments
+ *
+ * Applications should call the %_DRM_PRE_MODESET and %_DRM_POST_MODESET
+ * ioctls around modesetting so that any lost vblank events are accounted for.
+ *
+ * Generally the counter will reset across mode sets.  If interrupts are
+ * enabled around this call, we don't have to do anything since the counter
+ * will have already been incremented.
+ */
+int drm_modeset_ctl(struct drm_device *dev, void *data,
+		    struct drm_file *file_priv)
+{
+	struct drm_modeset_ctl *modeset = data;
+	unsigned int pipe;
+
+	/* If drm_vblank_init() hasn't been called yet, just no-op */
+	if (!dev->num_crtcs)
+		return 0;
+
+	/* KMS drivers handle this internally */
+	if (drm_core_check_feature(dev, DRIVER_MODESET))
+		return 0;
+
+	pipe = modeset->crtc;
+	if (pipe >= dev->num_crtcs)
+		return -EINVAL;
+
+	switch (modeset->cmd) {
+	case _DRM_PRE_MODESET:
+		drm_vblank_pre_modeset(dev, pipe);
+		break;
+	case _DRM_POST_MODESET:
+		drm_vblank_post_modeset(dev, pipe);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
-- 
2.1.3
