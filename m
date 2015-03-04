From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drm/exynos/ipp: Validate buffer enqueue requests
Date: Wed, 04 Mar 2015 15:02:49 +0100
Message-ID: <1425477769-5430-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:40712 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753781AbbCDODF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Mar 2015 09:03:05 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NKO00MIPXVP7WA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Mar 2015 14:07:01 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, jy0922.shim@samsung.com, Beata Michalska <b.michalska@samsung.com>

From: Beata Michalska <b.michalska@samsung.com>

As for now there is no validation of incoming buffer
enqueue request as far as the gem buffers are being
concerned. This might lead to some undesired cases
when the driver tries to operate on invalid buffers
(wiht no valid gem object handle i.e.).
Add some basic checks to rule out those potential issues.

Signed-off-by: Beata Michalska <b.michalska@samsung.com>
[mszyprow: rebased onto v4.0-rc1 and adapted to recent ipp changes]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 44 +++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 12ae9c4..ac35625 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -476,6 +476,45 @@ err_clear:
 	return ret;
 }
 
+static int ipp_validate_mem_node(struct drm_device *drm_dev,
+				 struct drm_exynos_ipp_mem_node *m_node,
+				 struct drm_exynos_ipp_cmd_node *c_node)
+{
+	struct drm_exynos_ipp_config *ipp_cfg;
+	unsigned int num_plane;
+	unsigned long min_size, size;
+	unsigned int bpp;
+	int i;
+
+	/* The property id should already be varified */
+	ipp_cfg = &c_node->property.config[m_node->prop_id];
+	num_plane = drm_format_num_planes(ipp_cfg->fmt);
+
+	/**
+	 * This is a rather simplified validation of a memory node.
+	 * It basically verifies provided gem object handles
+	 * and the buffer sizes with respect to current configuration.
+	 * This is not the best that can be done
+	 * but it seems more than enough
+	 */
+	for (i = 0; i < num_plane; ++i) {
+		if (!m_node->buf_info.handles[i]) {
+			DRM_ERROR("invalid handle for plane %d\n", i);
+			return -EINVAL;
+		}
+		bpp = drm_format_plane_cpp(ipp_cfg->fmt, i);
+		min_size = (ipp_cfg->sz.hsize * ipp_cfg->sz.vsize * bpp) >> 3;
+		size = exynos_drm_gem_get_size(drm_dev,
+					       m_node->buf_info.handles[i],
+					       c_node->filp);
+		if (min_size > size) {
+			DRM_ERROR("invalid size for plane %d\n", i);
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
 static int ipp_put_mem_node(struct drm_device *drm_dev,
 		struct drm_exynos_ipp_cmd_node *c_node,
 		struct drm_exynos_ipp_mem_node *m_node)
@@ -552,6 +591,11 @@ static struct drm_exynos_ipp_mem_node
 	}
 
 	mutex_lock(&c_node->mem_lock);
+	if (ipp_validate_mem_node(drm_dev, m_node, c_node)) {
+		ipp_put_mem_node(drm_dev, c_node, m_node);
+		mutex_unlock(&c_node->mem_lock);
+		return ERR_PTR(-EFAULT);
+	}
 	list_add_tail(&m_node->list, &c_node->mem_list[qbuf->ops_id]);
 	mutex_unlock(&c_node->mem_lock);
 
-- 
1.9.2
