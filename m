From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [RFC 1/4] drm: allow to create blank writable blob properties
Date: Thu, 06 Mar 2014 11:42:11 +0530
Message-ID: <1394086334-20967-2-git-send-email-rahul.sharma@samsung.com>
References: <1394086334-20967-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:26152 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013AbaCFGNB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Mar 2014 01:13:01 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N20006II3XORA60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Mar 2014 15:13:00 +0900 (KST)
In-reply-to: <1394086334-20967-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, inki.dae@samsung.com, prashanth.g@samsung.com, seanpaul@chromium.org, marcheu@chromium.org, joshi@samsung.com, linux-samsung-soc@vger.kernel.org, r.sh.open@google.com, ajaykumar.rs@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

There is no provision to create a blob property without
providing binary data. This data is needed to fill inside
the blob.

With subsequent patches, blob properties are modified to
receive well defined structures by the user application.
DRM creates a blank blob (initialized with all zeros) which
can be filled by user application through set_blob ioctl.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/drm_crtc.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 35ea15d..9a2215c 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -3190,7 +3190,7 @@ static struct drm_property_blob *drm_property_create_blob(struct drm_device *dev
 	struct drm_property_blob *blob;
 	int ret;
 
-	if (!length || !data)
+	if (!length)
 		return NULL;
 
 	blob = kzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
@@ -3205,7 +3205,8 @@ static struct drm_property_blob *drm_property_create_blob(struct drm_device *dev
 
 	blob->length = length;
 
-	memcpy(blob->data, data, length);
+	if (data)
+		memcpy(blob->data, data, length);
 
 	list_add_tail(&blob->head, &dev->mode_config.property_blob_list);
 	return blob;
-- 
1.7.9.5
