From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 07/25] drm/exynos: fix to calculate offset of each plane for
 ipp gsc
Date: Tue, 10 Nov 2015 14:23:23 +0100
Message-ID: <1447161821-1877-8-git-send-email-m.szyprowski@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17246 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753101AbbKJNYx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:24:53 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXL00KKWP9EYKA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2015 13:24:50 +0000 (GMT)
In-reply-to: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

From: Seung-Woo Kim <sw0312.kim@samsung.com>

NV12 and YUV420 formats are needed to calculate offset of each plane
in a gem buffer for ipp gsc. Without proper offset, only Y plane
can be processed, so result shows green frame. This patch fixes to
calculate offset for cbcr planes for NV12 and YUV420 formats.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 116 ++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 7aecd23cfa11..2882b9347cc8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -486,6 +486,98 @@ static void gsc_handle_irq(struct gsc_context *ctx, bool enable,
 	gsc_write(cfg, GSC_IRQ);
 }
 
+static int gsc_set_planar_addr(struct drm_exynos_ipp_buf_info *buf_info,
+		u32 fmt, struct drm_exynos_sz *sz)
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
+		DRM_DEBUG_KMS("base[%d][0x%lx]s[%d][%llu]\n",
+				i, (unsigned long)*base[i], i, size[i]);
+	}
+
+	if (!tsize) {
+		DRM_INFO("failed to get buffer size.\n");
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
+	break;
+	case DRM_FORMAT_XRGB8888:
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
+	DRM_DEBUG_KMS("y[0x%lx],cb[0x%lx],cr[0x%lx]\n", (unsigned long)*base[0],
+			(unsigned long)*base[1], (unsigned long)*base[2]);
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
+		DRM_ERROR("base[%d][0x%lx]s[%d][%llu]ofs[%d][%llu]\n",
+			i, (unsigned long)*base[i], i, size[i], i, ofs[i]);
+	}
+
+	return -EINVAL;
+}
 
 static int gsc_src_set_fmt(struct device *dev, u32 fmt)
 {
@@ -715,6 +807,8 @@ static int gsc_src_set_addr(struct device *dev,
 	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
 	struct drm_exynos_ipp_property *property;
+	struct drm_exynos_ipp_config *config;
+	int ret;
 
 	if (!c_node) {
 		DRM_ERROR("failed to get c_node.\n");
@@ -734,6 +828,13 @@ static int gsc_src_set_addr(struct device *dev,
 	/* address register set */
 	switch (buf_type) {
 	case IPP_BUF_ENQUEUE:
+		config = &property->config[EXYNOS_DRM_OPS_SRC];
+		ret = gsc_set_planar_addr(buf_info, config->fmt, &config->sz);
+		if (ret) {
+			dev_err(dev, "failed to set plane src addr.\n");
+			return ret;
+		}
+
 		gsc_write(buf_info->base[EXYNOS_DRM_PLANAR_Y],
 			GSC_IN_BASE_ADDR_Y(buf_id));
 		gsc_write(buf_info->base[EXYNOS_DRM_PLANAR_CB],
@@ -1170,6 +1271,8 @@ static int gsc_dst_set_addr(struct device *dev,
 	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
 	struct drm_exynos_ipp_property *property;
+	struct drm_exynos_ipp_config *config;
+	int ret;
 
 	if (!c_node) {
 		DRM_ERROR("failed to get c_node.\n");
@@ -1189,6 +1292,13 @@ static int gsc_dst_set_addr(struct device *dev,
 	/* address register set */
 	switch (buf_type) {
 	case IPP_BUF_ENQUEUE:
+		config = &property->config[EXYNOS_DRM_OPS_DST];
+		ret = gsc_set_planar_addr(buf_info, config->fmt, &config->sz);
+		if (ret) {
+			dev_err(dev, "failed to set plane dst addr.\n");
+			return ret;
+		}
+
 		gsc_write(buf_info->base[EXYNOS_DRM_PLANAR_Y],
 			GSC_OUT_BASE_ADDR_Y(buf_id));
 		gsc_write(buf_info->base[EXYNOS_DRM_PLANAR_CB],
@@ -1320,6 +1430,12 @@ static irqreturn_t gsc_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
+	if (c_node->state == IPP_STATE_STOP) {
+		DRM_ERROR("invalid state: prop_id[%d]\n",
+				c_node->property.prop_id);
+		return IRQ_HANDLED;
+	}
+
 	if (status & GSC_IRQ_STATUS_OR_FRM_DONE) {
 		dev_dbg(ippdrv->dev, "occurred frame done at %d, status 0x%x.\n",
 			ctx->id, status);
-- 
1.9.2
