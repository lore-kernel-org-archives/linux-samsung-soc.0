From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [RFC 4/4] drm: export create and destroy function for blob properties
Date: Thu, 06 Mar 2014 11:42:14 +0530
Message-ID: <1394086334-20967-5-git-send-email-rahul.sharma@samsung.com>
References: <1394086334-20967-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63277 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751440AbaCFGNG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Mar 2014 01:13:06 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N2000CBO3XTFXB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Mar 2014 15:13:05 +0900 (KST)
In-reply-to: <1394086334-20967-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, inki.dae@samsung.com, prashanth.g@samsung.com, seanpaul@chromium.org, marcheu@chromium.org, joshi@samsung.com, linux-samsung-soc@vger.kernel.org, r.sh.open@google.com, ajaykumar.rs@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

Drm drivers can also create and attach private blob properties.
This patch exports functions to create and destroy blob properties.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/drm_crtc.c |    8 +++++---
 include/drm/drm_crtc.h     |    4 ++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 8771abf..f1939c2 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -3299,8 +3299,8 @@ done:
 	return ret;
 }
 
-static struct drm_property_blob *drm_property_create_blob(struct drm_device *dev, int length,
-							  void *data)
+struct drm_property_blob *drm_property_create_blob(struct drm_device *dev,
+			int length, void *data)
 {
 	struct drm_property_blob *blob;
 	int ret;
@@ -3326,14 +3326,16 @@ static struct drm_property_blob *drm_property_create_blob(struct drm_device *dev
 	list_add_tail(&blob->head, &dev->mode_config.property_blob_list);
 	return blob;
 }
+EXPORT_SYMBOL(drm_property_create_blob);
 
-static void drm_property_destroy_blob(struct drm_device *dev,
+void drm_property_destroy_blob(struct drm_device *dev,
 			       struct drm_property_blob *blob)
 {
 	drm_mode_object_put(dev, &blob->base);
 	list_del(&blob->head);
 	kfree(blob);
 }
+EXPORT_SYMBOL(drm_property_destroy_blob);
 
 int drm_mode_getblob_ioctl(struct drm_device *dev,
 			   void *data, struct drm_file *file_priv)
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index df7b178..8bf7fb2 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1077,6 +1077,10 @@ struct drm_property *drm_property_create_bitmask(struct drm_device *dev,
 struct drm_property *drm_property_create_range(struct drm_device *dev, int flags,
 					 const char *name,
 					 uint64_t min, uint64_t max);
+extern struct drm_property_blob *drm_property_create_blob(struct drm_device *dev,
+					int length, void *data);
+extern void drm_property_destroy_blob(struct drm_device *dev,
+					struct drm_property_blob *blob);
 extern void drm_property_destroy(struct drm_device *dev, struct drm_property *property);
 extern int drm_property_add_enum(struct drm_property *property, int index,
 				 uint64_t value, const char *name);
-- 
1.7.9.5
