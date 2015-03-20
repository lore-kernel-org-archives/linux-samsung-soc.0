From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 2/5] exynos: add EXYNOS_G2D_EVENT to drmHandleEvent
Date: Fri, 20 Mar 2015 23:25:45 +0100
Message-ID: <1426890348-12807-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1426890348-12807-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:53620 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751174AbbCTW0H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Mar 2015 18:26:07 -0400
In-Reply-To: <1426890348-12807-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This event is specific to Exynos G2D DRM driver. Only
process it when Exynos support is enabled.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_drm.h | 12 ++++++++++++
 xf86drm.h           |  7 ++++++-
 xf86drmMode.c       | 18 ++++++++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

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
diff --git a/xf86drm.h b/xf86drm.h
index 40c55c9..6b1c9b4 100644
--- a/xf86drm.h
+++ b/xf86drm.h
@@ -719,7 +719,7 @@ extern void drmMsg(const char *format, ...) DRM_PRINTFLIKE(1, 2);
 extern int drmSetMaster(int fd);
 extern int drmDropMaster(int fd);
 
-#define DRM_EVENT_CONTEXT_VERSION 2
+#define DRM_EVENT_CONTEXT_VERSION 3
 
 typedef struct _drmEventContext {
 
@@ -739,6 +739,11 @@ typedef struct _drmEventContext {
 				  unsigned int tv_usec,
 				  void *user_data);
 
+	void (*g2d_event_handler)(int fd,
+				  unsigned int cmdlist_no,
+				  unsigned int tv_sec,
+				  unsigned int tv_usec,
+				  void *user_data);
 } drmEventContext, *drmEventContextPtr;
 
 extern int drmHandleEvent(int fd, drmEventContextPtr evctx);
diff --git a/xf86drmMode.c b/xf86drmMode.c
index 61d5e01..d9f2898 100644
--- a/xf86drmMode.c
+++ b/xf86drmMode.c
@@ -53,6 +53,10 @@
 #include <unistd.h>
 #include <errno.h>
 
+#ifdef HAVE_EXYNOS
+#include <exynos/exynos_drm.h>
+#endif
+
 #ifdef HAVE_VALGRIND
 #include <valgrind.h>
 #include <memcheck.h>
@@ -846,6 +850,7 @@ int drmHandleEvent(int fd, drmEventContextPtr evctx)
 	int len, i;
 	struct drm_event *e;
 	struct drm_event_vblank *vblank;
+	struct drm_exynos_g2d_event *g2d;
 	
 	/* The DRM read semantics guarantees that we always get only
 	 * complete events. */
@@ -882,6 +887,19 @@ int drmHandleEvent(int fd, drmEventContextPtr evctx)
 						 vblank->tv_usec,
 						 U642VOID (vblank->user_data));
 			break;
+#ifdef HAVE_EXYNOS
+		case DRM_EXYNOS_G2D_EVENT:
+			if (evctx->version < 3 ||
+			    evctx->g2d_event_handler == NULL)
+				break;
+			g2d = (struct drm_exynos_g2d_event *) e;
+			evctx->g2d_event_handler(fd,
+						 g2d->cmdlist_no,
+						 g2d->tv_sec,
+						 g2d->tv_usec,
+						 U642VOID (g2d->user_data));
+			break;
+#endif
 		default:
 			break;
 		}
-- 
2.0.5
