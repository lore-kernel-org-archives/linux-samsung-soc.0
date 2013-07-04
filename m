From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] drm/exynos: exynos_drm_ipp: fix return value check
Date: Thu, 4 Jul 2013 21:35:00 +0800
Message-ID: <CAPgLHd9yE7YES-yDFSWfHOKbbay2yLS_VrvF5-QyJumnNFitQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47]:53799 "EHLO
	mail-bk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751468Ab3GDNfB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Jul 2013 09:35:01 -0400
Received: by mail-bk0-f47.google.com with SMTP id jg1so643890bkc.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Jul 2013 06:35:00 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene.kim@samsung.com
Cc: yongjun_wei@trendmicro.com.cn, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function ipp_find_obj() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check
should be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index b1ef8e7..0eb8538 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -342,10 +342,10 @@ int exynos_drm_ipp_get_property(struct drm_device *drm_dev, void *data,
 		 */
 		ippdrv = ipp_find_obj(&ctx->ipp_idr, &ctx->ipp_lock,
 						prop_list->ipp_id);
-		if (!ippdrv) {
+		if (IS_ERR(ippdrv)) {
 			DRM_ERROR("not found ipp%d driver.\n",
 					prop_list->ipp_id);
-			return -EINVAL;
+			return PTR_ERR(ippdrv);
 		}
 
 		prop_list = ippdrv->prop_list;
@@ -970,9 +970,9 @@ int exynos_drm_ipp_queue_buf(struct drm_device *drm_dev, void *data,
 	/* find command node */
 	c_node = ipp_find_obj(&ctx->prop_idr, &ctx->prop_lock,
 		qbuf->prop_id);
-	if (!c_node) {
+	if (IS_ERR(c_node)) {
 		DRM_ERROR("failed to get command node.\n");
-		return -EFAULT;
+		return PTR_ERR(c_node);
 	}
 
 	/* buffer control */
@@ -1106,9 +1106,9 @@ int exynos_drm_ipp_cmd_ctrl(struct drm_device *drm_dev, void *data,
 
 	c_node = ipp_find_obj(&ctx->prop_idr, &ctx->prop_lock,
 		cmd_ctrl->prop_id);
-	if (!c_node) {
+	if (IS_ERR(c_node)) {
 		DRM_ERROR("invalid command node list.\n");
-		return -EINVAL;
+		return PTR_ERR(c_node);
 	}
 
 	if (!exynos_drm_ipp_check_valid(ippdrv->dev, cmd_ctrl->ctrl,
