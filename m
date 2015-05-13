From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v4 1/9] exynos: Introduce exynos_handle_event()
Date: Wed, 13 May 2015 19:34:45 +0200
Message-ID: <1431538493-11431-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1431538493-11431-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55315 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934454AbbEMRe7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 13:34:59 -0400
In-Reply-To: <1431538493-11431-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Used to handle kernel events specific to the Exynos platform.
Currently only G2D events are handled.

v2: Adapt to container approach.
v3: Add exynos_handle_event() to Exynos symbol test.
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos-symbol-check |  1 +
 exynos/exynos_drm.c        | 28 ++++++++++++++++++++++++++++
 exynos/exynos_drm.h        | 12 ++++++++++++
 exynos/exynos_drmif.h      | 26 ++++++++++++++++++++++++++
 4 files changed, 67 insertions(+)

diff --git a/exynos/exynos-symbol-check b/exynos/exynos-symbol-check
index 1a1be89..c3ddbe4 100755
--- a/exynos/exynos-symbol-check
+++ b/exynos/exynos-symbol-check
@@ -22,6 +22,7 @@ exynos_device_destroy
 exynos_prime_fd_to_handle
 exynos_prime_handle_to_fd
 exynos_vidi_connection
+exynos_handle_event
 g2d_blend
 g2d_copy
 g2d_copy_with_scale
diff --git a/exynos/exynos_drm.c b/exynos/exynos_drm.c
index df9b8ed..7a400ad 100644
--- a/exynos/exynos_drm.c
+++ b/exynos/exynos_drm.c
@@ -42,6 +42,8 @@
 #include "exynos_drm.h"
 #include "exynos_drmif.h"
 
+#define U642VOID(x) ((void *)(unsigned long)(x))
+
 /*
  * Create exynos drm device object.
  *
@@ -374,3 +376,29 @@ exynos_vidi_connection(struct exynos_device *dev, uint32_t connect,
 
 	return 0;
 }
+
+static void
+exynos_handle_vendor(int fd, struct drm_event *e, void *ctx)
+{
+	struct drm_exynos_g2d_event *g2d;
+	struct exynos_event_context *ectx = ctx;
+
+	switch (e->type) {
+		case DRM_EXYNOS_G2D_EVENT:
+			if (ectx->version < 1 || ectx->g2d_event_handler == NULL)
+				break;
+			g2d = (struct drm_exynos_g2d_event *)e;
+			ectx->g2d_event_handler(fd, g2d->cmdlist_no, g2d->tv_sec,
+						g2d->tv_usec, U642VOID(g2d->user_data));
+			break;
+
+		default:
+			break;
+	}
+}
+
+int
+exynos_handle_event(struct exynos_device *dev, struct exynos_event_context *ctx)
+{
+	return drmHandleEvent2(dev->fd, &ctx->base, exynos_handle_vendor);
+}
diff --git a/exynos/exynos_drm.h b/exynos/exynos_drm.h
index 256c02f..c3af0ac 100644
--- a/exynos/exynos_drm.h
+++ b/exynos/exynos_drm.h
@@ -157,4 +157,16 @@ struct drm_exynos_g2d_exec {
 #define DRM_IOCTL_EXYNOS_G2D_EXEC		DRM_IOWR(DRM_COMMAND_BASE + \
 		DRM_EXYNOS_G2D_EXEC, struct drm_exynos_g2d_exec)
 
+/* EXYNOS specific events */
+#define DRM_EXYNOS_G2D_EVENT		0x80000000
+
+struct drm_exynos_g2d_event {
+	struct drm_event	base;
+	__u64				user_data;
+	__u32				tv_sec;
+	__u32				tv_usec;
+	__u32				cmdlist_no;
+	__u32				reserved;
+};
+
 #endif
diff --git a/exynos/exynos_drmif.h b/exynos/exynos_drmif.h
index c7c1d44..626e399 100644
--- a/exynos/exynos_drmif.h
+++ b/exynos/exynos_drmif.h
@@ -54,6 +54,25 @@ struct exynos_bo {
 	uint32_t		name;
 };
 
+#define EXYNOS_EVENT_CONTEXT_VERSION 1
+
+/*
+ * Exynos Event Context structure.
+ *
+ * @base: base context (for core events).
+ * @version: version info similar to the one in 'drmEventContext'.
+ * @g2d_event_handler: handler for G2D events.
+ */
+struct exynos_event_context {
+	drmEventContext base;
+
+	int version;
+
+	void (*g2d_event_handler)(int fd, unsigned int cmdlist_no,
+							  unsigned int tv_sec, unsigned int tv_usec,
+							  void *user_data);
+};
+
 /*
  * device related functions:
  */
@@ -83,4 +102,11 @@ int exynos_prime_fd_to_handle(struct exynos_device *dev, int fd,
 int exynos_vidi_connection(struct exynos_device *dev, uint32_t connect,
 				uint32_t ext, void *edid);
 
+/*
+ * event handling related functions:
+ */
+int exynos_handle_event(struct exynos_device *dev,
+				struct exynos_event_context *ctx);
+
+
 #endif /* EXYNOS_DRMIF_H_ */
-- 
2.0.5
