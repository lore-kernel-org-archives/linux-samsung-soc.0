From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 06/25] drm/exynos: fix to calculate offset of each plane for
 ipp fimc
Date: Tue, 10 Nov 2015 14:23:22 +0100
Message-ID: <1447161821-1877-7-git-send-email-m.szyprowski@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:64203 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753094AbbKJNYv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:24:51 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXL00BIFP9DC0A0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2015 13:24:49 +0000 (GMT)
In-reply-to: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

From: Seung-Woo Kim <sw0312.kim@samsung.com>

NV12 and YUV420 formats are need to calculate offset of each plane
for ipp fimc in a gem buffer. Without proper offset, only Y plane
can be processed, so result shows green frame.
This patch fixes to calculate offset for cbcr planes for NV12 and
YUV420 formats.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 106 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_ipp.c  |  15 ++++-
 drivers/gpu/drm/exynos/exynos_drm_ipp.h  |   2 +
 3 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index c747824f3c98..72a7ca188be5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -403,6 +403,97 @@ static void fimc_handle_lastend(struct fimc_context *ctx, bool enable)
 	fimc_write(ctx, cfg, EXYNOS_CIOCTRL);
 }
 
+static int fimc_set_planar_addr(struct drm_exynos_ipp_buf_info *buf_info,
+				u32 fmt, struct drm_exynos_sz *sz)
+{
+	dma_addr_t *base[EXYNOS_DRM_PLANAR_MAX];
+	uint64_t size[EXYNOS_DRM_PLANAR_MAX];
+	uint64_t ofs[EXYNOS_DRM_PLANAR_MAX];
+	bool bypass = false;
+	uint64_t tsize = 0;
+	int i;
+
+	for_each_ipp_planar(i) {
+		base[i] = &buf_info->base[i];
+		size[i] = buf_info->size[i];
+		ofs[i] = 0;
+		tsize += size[i];
+	}
+
+	if (!tsize) {
+		DRM_INFO("%s:failed to get buffer size.\n", __func__);
+		return 0;
+	}
+
+	switch (fmt) {
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV61:
+		ofs[0] = sz->hsize * sz->vsize;
+		ofs[1] = ofs[0] >> 1;
+		if (*base[0] && *base[1]) {
+			if (size[0] + size[1] < ofs[0] + ofs[1])
+				goto err_info;
+			bypass = true;
+		}
+		break;
+	case DRM_FORMAT_YUV410:
+	case DRM_FORMAT_YVU410:
+	case DRM_FORMAT_YUV411:
+	case DRM_FORMAT_YVU411:
+	case DRM_FORMAT_YUV420:
+	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YUV444:
+	case DRM_FORMAT_YVU444:
+		ofs[0] = sz->hsize * sz->vsize;
+		ofs[1] = ofs[2] = ofs[0] >> 2;
+		if (*base[0] && *base[1] && *base[2]) {
+			if (size[0]+size[1]+size[2] < ofs[0]+ofs[1]+ofs[2])
+				goto err_info;
+			bypass = true;
+		}
+		break;
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+		ofs[0] = sz->hsize * sz->vsize << 2;
+		if (*base[0]) {
+			if (size[0] < ofs[0])
+				goto err_info;
+		}
+		bypass = true;
+		break;
+	default:
+		bypass = true;
+		break;
+	}
+
+	if (!bypass) {
+		*base[1] = *base[0] + ofs[0];
+		if (ofs[1] && ofs[2])
+			*base[2] = *base[1] + ofs[1];
+	}
+
+	DRM_DEBUG_KMS("%s:y[0x%x],cb[0x%x],cr[0x%x]\n", __func__,
+		*base[0], *base[1], *base[2]);
+
+	return 0;
+
+err_info:
+	DRM_ERROR("invalid size for fmt[0x%x]\n", fmt);
+
+	for_each_ipp_planar(i) {
+		base[i] = &buf_info->base[i];
+		size[i] = buf_info->size[i];
+
+		DRM_ERROR("buf[%d] - base[0x%x] sz[%llu] ofs[%llu]\n",
+			i, *base[i], size[i], ofs[i]);
+	}
+
+	return -EINVAL;
+}
 
 static int fimc_src_set_fmt_order(struct fimc_context *ctx, u32 fmt)
 {
@@ -689,6 +780,7 @@ static int fimc_src_set_addr(struct device *dev,
 	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
 	struct drm_exynos_ipp_property *property;
 	struct drm_exynos_ipp_config *config;
+	int ret;
 
 	if (!c_node) {
 		DRM_ERROR("failed to get c_node.\n");
@@ -709,6 +801,12 @@ static int fimc_src_set_addr(struct device *dev,
 	switch (buf_type) {
 	case IPP_BUF_ENQUEUE:
 		config = &property->config[EXYNOS_DRM_OPS_SRC];
+		ret = fimc_set_planar_addr(buf_info, config->fmt, &config->sz);
+		if (ret) {
+			dev_err(dev, "failed to set plane src addr.\n");
+			return ret;
+		}
+
 		fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_Y],
 			EXYNOS_CIIYSA0);
 
@@ -1148,6 +1246,7 @@ static int fimc_dst_set_addr(struct device *dev,
 	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
 	struct drm_exynos_ipp_property *property;
 	struct drm_exynos_ipp_config *config;
+	int ret;
 
 	if (!c_node) {
 		DRM_ERROR("failed to get c_node.\n");
@@ -1168,6 +1267,11 @@ static int fimc_dst_set_addr(struct device *dev,
 	switch (buf_type) {
 	case IPP_BUF_ENQUEUE:
 		config = &property->config[EXYNOS_DRM_OPS_DST];
+		ret = fimc_set_planar_addr(buf_info, config->fmt, &config->sz);
+		if (ret) {
+			dev_err(dev, "failed to set plane dst addr.\n");
+			return ret;
+		}
 
 		fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_Y],
 			EXYNOS_CIOYSA(buf_id));
@@ -1562,6 +1666,8 @@ static void fimc_ippdrv_stop(struct device *dev, enum drm_exynos_ipp_cmd cmd)
 	/* reset sequence */
 	fimc_write(ctx, 0x0, EXYNOS_CIFCNTSEQ);
 
+	fimc_clear_addr(ctx);
+
 	/* Scaler disable */
 	fimc_clear_bits(ctx, EXYNOS_CISCCTRL, EXYNOS_CISCCTRL_SCALERSTART);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 67d24236e745..408a14a9a180 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -571,6 +571,7 @@ static struct drm_exynos_ipp_mem_node
 		/* get dma address by handle */
 		if (qbuf->handle[i]) {
 			dma_addr_t *addr;
+			unsigned long size;
 
 			addr = exynos_drm_gem_get_dma_addr(drm_dev,
 					qbuf->handle[i], c_node->filp);
@@ -580,10 +581,20 @@ static struct drm_exynos_ipp_mem_node
 				return ERR_PTR(-EFAULT);
 			}
 
+			size = exynos_drm_gem_get_size(drm_dev,
+					qbuf->handle[i], c_node->filp);
+			if (!size) {
+				DRM_ERROR("failed to get size.\n");
+				ipp_put_mem_node(drm_dev, c_node, m_node);
+				return ERR_PTR(-EFAULT);
+			}
+
 			buf_info->handles[i] = qbuf->handle[i];
 			buf_info->base[i] = *addr;
-			DRM_DEBUG_KMS("i[%d]base[0x%x]hd[0x%lx]\n", i,
-				      buf_info->base[i], buf_info->handles[i]);
+			buf_info->size[i] = (uint64_t)size;
+			DRM_DEBUG_KMS("i[%d]base[%pad]hd[0x%lx]sz[%llx]\n", i,
+				      &buf_info->base[i], buf_info->handles[i],
+				      buf_info->size[i]);
 		}
 	}
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.h b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
index 2a61547a39d0..d4f0b588220b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
@@ -85,10 +85,12 @@ struct drm_exynos_ipp_cmd_node {
  *
  * @handles: Y, Cb, Cr each gem object handle.
  * @base: Y, Cb, Cr each planar address.
+ * @size: Y, Cb, Cr each planar size.
  */
 struct drm_exynos_ipp_buf_info {
 	unsigned long	handles[EXYNOS_DRM_PLANAR_MAX];
 	dma_addr_t	base[EXYNOS_DRM_PLANAR_MAX];
+	uint64_t	size[EXYNOS_DRM_PLANAR_MAX];
 };
 
 /*
-- 
1.9.2
