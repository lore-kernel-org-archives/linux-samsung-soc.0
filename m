From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 01/13] drm: Implement drmHandleEvent2()
Date: Tue, 22 Sep 2015 17:54:50 +0200
Message-ID: <1442937302-8211-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:40764 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933513AbbIVPyF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Sep 2015 11:54:05 -0400
In-Reply-To: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Basically this is an extended version of drmHandleEvent().

drmHandleEvent() only handles core events (like e.g. page flips),
but since kernel DRM drivers might use vendor-specific events
to signal userspace the completion of pending jobs, etc., its
desirable to provide a way to handle these without putting
vendor-specific code in the core libdrm.

To use this you provide drmHandleEvent2() with a function that
handles your non-core events.

The signature of that function looks like this:
void vendor(int fd, struct drm_event *e, void *ctx);

'fd' is the DRM file descriptor, 'e' the non-core event
and 'ctx' the event context (casted to void).

This way we don't have to maintain a copy of drmHandleEvent()
in the vendor code.

v2: Remove the opaque pointer, since this can be better
    handled with a container approach.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 xf86drm.h     | 21 +++++++++++++++++++++
 xf86drmMode.c | 10 +++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/xf86drm.h b/xf86drm.h
index 481d882..1e474a3 100644
--- a/xf86drm.h
+++ b/xf86drm.h
@@ -750,8 +750,29 @@ typedef struct _drmEventContext {
 
 } drmEventContext, *drmEventContextPtr;
 
+typedef void (*drmEventVendorHandler)(int fd, struct drm_event *e, void *ctx);
+
 extern int drmHandleEvent(int fd, drmEventContextPtr evctx);
 
+/*
+ * drmHandleEvent2() is an extended variant of drmHandleEvent() which
+ * allows handling of vendor-specific/non-core events.
+ * The function pointer 'vendorhandler' is used (if non-zero) to
+ * process non-core events. Users of have to prepare a container struct
+ * in the following way:
+ *
+ * struct vendor_event_context {
+ *		drmEventContext base;
+ *		int vendor_specific_data[num];
+ * };
+ *
+ * And then call:
+ * struct vendor_event_context ctx = {0};
+ * drmHandleEvent2(fd, &ctx.base, handler);
+ */
+extern int drmHandleEvent2(int fd, drmEventContextPtr evctx,
+	drmEventVendorHandler vendorhandler);
+
 extern char *drmGetDeviceNameFromFd(int fd);
 extern int drmGetNodeTypeFromFd(int fd);
 
diff --git a/xf86drmMode.c b/xf86drmMode.c
index ab6b519..89698da 100644
--- a/xf86drmMode.c
+++ b/xf86drmMode.c
@@ -867,7 +867,8 @@ int drmModeCrtcSetGamma(int fd, uint32_t crtc_id, uint32_t size,
 	return DRM_IOCTL(fd, DRM_IOCTL_MODE_SETGAMMA, &l);
 }
 
-int drmHandleEvent(int fd, drmEventContextPtr evctx)
+int drmHandleEvent2(int fd, drmEventContextPtr evctx,
+			drmEventVendorHandler vendorhandler)
 {
 	char buffer[1024];
 	int len, i;
@@ -910,6 +911,8 @@ int drmHandleEvent(int fd, drmEventContextPtr evctx)
 						 U642VOID (vblank->user_data));
 			break;
 		default:
+			if (vendorhandler)
+				vendorhandler(fd, e, evctx);
 			break;
 		}
 		i += e->length;
@@ -918,6 +921,11 @@ int drmHandleEvent(int fd, drmEventContextPtr evctx)
 	return 0;
 }
 
+int drmHandleEvent(int fd, drmEventContextPtr evctx)
+{
+	return drmHandleEvent2(fd, evctx, NULL);
+}
+
 int drmModePageFlip(int fd, uint32_t crtc_id, uint32_t fb_id,
 		    uint32_t flags, void *user_data)
 {
-- 
2.0.5
