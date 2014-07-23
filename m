From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2: 2/2] drm/exynos: g2d: let exynos_g2d_get_ver_ioctl fail
Date: Wed, 23 Jul 2014 17:12:06 +0200
Message-ID: <1406128326-16280-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1406128326-16280-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:35818 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932548AbaGWPMS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jul 2014 11:12:18 -0400
In-Reply-To: <1406128326-16280-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, t.figa@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Currently the DRM_IOCTL_EXYNOS_G2D_GET_VER ioctl always succeeds, even
if no G2D support is available. Let the ioctl fail when this is the
case, so that userspace can accurately probe for G2D support.

This also fixes the exynos tests in libdrm. There 'g2d_init' doesn't
fail when G2D is absent, leading to a segfault later.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 929c6d7..38607a8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1042,8 +1042,23 @@ err:
 int exynos_g2d_get_ver_ioctl(struct drm_device *drm_dev, void *data,
 			     struct drm_file *file)
 {
+	struct drm_exynos_file_private *file_priv = file->driver_priv;
+	struct exynos_drm_g2d_private *g2d_priv = file_priv->g2d_priv;
+	struct device *dev;
+	struct g2d_data *g2d;
 	struct drm_exynos_g2d_get_ver *ver = data;
 
+	if (!g2d_priv)
+		return -ENODEV;
+
+	dev = g2d_priv->dev;
+	if (!dev)
+		return -ENODEV;
+
+	g2d = dev_get_drvdata(dev);
+	if (!g2d)
+		return -EFAULT;
+
 	ver->major = G2D_HW_MAJOR_VER;
 	ver->minor = G2D_HW_MINOR_VER;
 
-- 
1.8.5.5
