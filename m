From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: [PATCH 2/2] drm/exynos: ipp: validate a GEM handle with multiple planes
Date: Tue, 09 Jun 2015 12:45:15 +0900
Message-ID: <1433821515-8952-2-git-send-email-human.hwang@samsung.com>
References: <1433821515-8952-1-git-send-email-human.hwang@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60884 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932288AbbFIDpb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jun 2015 23:45:31 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NPN0306RRRJU390@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 09 Jun 2015 12:45:20 +0900 (KST)
In-reply-to: <1433821515-8952-1-git-send-email-human.hwang@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com
Cc: sw0312.kim@samsung.com, jy0922.shim@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>

FIMC & GSC driver can calculate the offset of planes. So there are
use cases which IPP receives just one GEM handle of an image with
multiple plane. This patch extends ipp_validate_mem_node() to validate
this case.

Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 51 ++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 54c5cf4..b3dc778 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -482,8 +482,8 @@ static int ipp_validate_mem_node(struct drm_device *drm_dev,
 {
 	struct drm_exynos_ipp_config *ipp_cfg;
 	unsigned int num_plane;
-	unsigned long min_size, size;
-	unsigned int bpp;
+	unsigned long size, buf_size = 0, plane_size, img_size = 0;
+	unsigned int bpp, width, height;
 	int i;
 
 	ipp_cfg = &c_node->property.config[m_node->ops_id];
@@ -497,20 +497,45 @@ static int ipp_validate_mem_node(struct drm_device *drm_dev,
 	 * but it seems more than enough
 	 */
 	for (i = 0; i < num_plane; ++i) {
-		if (!m_node->buf_info.handles[i]) {
-			DRM_ERROR("invalid handle for plane %d\n", i);
-			return -EINVAL;
-		}
+		width = ipp_cfg->sz.hsize;
+		height = ipp_cfg->sz.vsize;
 		bpp = drm_format_plane_cpp(ipp_cfg->fmt, i);
-		min_size = (ipp_cfg->sz.hsize * ipp_cfg->sz.vsize * bpp) >> 3;
-		size = exynos_drm_gem_get_size(drm_dev,
-					       m_node->buf_info.handles[i],
-					       c_node->filp);
-		if (min_size > size) {
-			DRM_ERROR("invalid size for plane %d\n", i);
-			return -EINVAL;
+
+		/*
+		 * The result of drm_format_plane_cpp() for chroma planes must
+		 * be used with drm_format_xxxx_chroma_subsampling() for
+		 * correct result.
+		 */
+		if (i > 0) {
+			width /= drm_format_horz_chroma_subsampling(
+								ipp_cfg->fmt);
+			height /= drm_format_vert_chroma_subsampling(
+								ipp_cfg->fmt);
 		}
+		plane_size = width * height * bpp;
+		img_size += plane_size;
+
+		if (m_node->buf_info.handles[i]) {
+			size = exynos_drm_gem_get_size(drm_dev,
+					m_node->buf_info.handles[i],
+					c_node->filp);
+			if (plane_size > size) {
+				DRM_ERROR(
+					"buffer %d is smaller than required\n",
+					i);
+				return -EINVAL;
+			}
+
+			buf_size += size;
+		}
+	}
+
+	if (buf_size < img_size) {
+		DRM_ERROR("size of buffers(%lu) is smaller than image(%lu)\n",
+			buf_size, img_size);
+		return -EINVAL;
 	}
+
 	return 0;
 }
 
-- 
1.9.1
