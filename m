From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2: 1/2] drm/exynos: g2d: make ioctls more robust
Date: Wed, 23 Jul 2014 17:12:05 +0200
Message-ID: <1406128326-16280-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1406128326-16280-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:35813 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932509AbaGWPMQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jul 2014 11:12:16 -0400
In-Reply-To: <1406128326-16280-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, t.figa@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Both exynos_g2d_set_cmdlist_ioctl and exynos_g2d_exec_ioctl don't check
if the G2D was succesfully probe. If that is not the case, then g2d_priv
is just NULL and extracting 'dev' from it in the next step  is going to
produce a kernel oops.

Add proper checks and return ENODEV if the G2D is not available.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 5fa1bb6..929c6d7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1056,7 +1056,7 @@ int exynos_g2d_set_cmdlist_ioctl(struct drm_device *drm_dev, void *data,
 {
 	struct drm_exynos_file_private *file_priv = file->driver_priv;
 	struct exynos_drm_g2d_private *g2d_priv = file_priv->g2d_priv;
-	struct device *dev = g2d_priv->dev;
+	struct device *dev;
 	struct g2d_data *g2d;
 	struct drm_exynos_g2d_set_cmdlist *req = data;
 	struct drm_exynos_g2d_cmd *cmd;
@@ -1067,6 +1067,10 @@ int exynos_g2d_set_cmdlist_ioctl(struct drm_device *drm_dev, void *data,
 	int size;
 	int ret;
 
+	if (!g2d_priv)
+		return -ENODEV;
+
+	dev = g2d_priv->dev;
 	if (!dev)
 		return -ENODEV;
 
@@ -1223,13 +1227,17 @@ int exynos_g2d_exec_ioctl(struct drm_device *drm_dev, void *data,
 {
 	struct drm_exynos_file_private *file_priv = file->driver_priv;
 	struct exynos_drm_g2d_private *g2d_priv = file_priv->g2d_priv;
-	struct device *dev = g2d_priv->dev;
+	struct device *dev;
 	struct g2d_data *g2d;
 	struct drm_exynos_g2d_exec *req = data;
 	struct g2d_runqueue_node *runqueue_node;
 	struct list_head *run_cmdlist;
 	struct list_head *event_list;
 
+	if (!g2d_priv)
+		return -ENODEV;
+
+	dev = g2d_priv->dev;
 	if (!dev)
 		return -ENODEV;
 
-- 
1.8.5.5
