From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2 5/9] drm/exynos: dp: modify driver to support drm_panel
Date: Tue, 22 Apr 2014 04:09:14 +0530
Message-ID: <1398119958-32005-6-git-send-email-ajaykumar.rs@samsung.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18818 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754569AbaDUWj6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 18:39:58 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4E00DBLKALOY20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Apr 2014 07:39:57 +0900 (KST)
In-reply-to: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This patch attaches the dp connector to exynos_dp_panel, and adds
calls to drm_panel functions to control panel power sequence.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
Changes since V1:
	Addressed a comment from Jingoo Han. Also added post_disable
	control to exynos_dp driver.

 drivers/gpu/drm/exynos/Kconfig          |    1 +
 drivers/gpu/drm/exynos/exynos_dp_core.c |   18 ++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_dp_core.h |    1 +
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 5bf5bca..56af433 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -52,6 +52,7 @@ config DRM_EXYNOS_DP
 	bool "EXYNOS DRM DP driver support"
 	depends on DRM_EXYNOS && ARCH_EXYNOS
 	default DRM_EXYNOS
+	select DRM_PANEL
 	help
 	  This enables support for DP device.
 
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 18fd9c5..dbc5ccc 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -28,6 +28,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_panel.h>
 #include <drm/bridge/ptn3460.h>
 
 #include "exynos_drm_drv.h"
@@ -1028,6 +1029,9 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
 	drm_sysfs_connector_add(connector);
 	drm_mode_connector_attach_encoder(connector, encoder);
 
+	if (dp->drm_panel)
+		drm_panel_attach(dp->drm_panel, &dp->connector);
+
 	return 0;
 }
 
@@ -1062,10 +1066,12 @@ static void exynos_dp_poweron(struct exynos_dp_device *dp)
 	if (dp->dpms_mode == DRM_MODE_DPMS_ON)
 		return;
 
+	drm_panel_pre_enable(dp->drm_panel);
 	clk_prepare_enable(dp->clock);
 	exynos_dp_phy_init(dp);
 	exynos_dp_init_dp(dp);
 	enable_irq(dp->irq);
+	drm_panel_enable(dp->drm_panel);
 }
 
 static void exynos_dp_poweroff(struct exynos_dp_device *dp)
@@ -1073,10 +1079,12 @@ static void exynos_dp_poweroff(struct exynos_dp_device *dp)
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
 
+	drm_panel_disable(dp->drm_panel);
 	disable_irq(dp->irq);
 	flush_work(&dp->hotplug_work);
 	exynos_dp_phy_exit(dp);
 	clk_disable_unprepare(dp->clock);
+	drm_panel_post_disable(dp->drm_panel);
 }
 
 static void exynos_dp_dpms(struct exynos_drm_display *display, int mode)
@@ -1225,6 +1233,7 @@ static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
 static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
+	struct device_node *panel_node;
 	struct drm_device *drm_dev = data;
 	struct resource *res;
 	struct exynos_dp_device *dp;
@@ -1299,6 +1308,15 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	INIT_WORK(&dp->hotplug_work, exynos_dp_hotplug);
 
+	panel_node = of_find_compatible_node(NULL, NULL,
+						"samsung,exynos-dp-panel");
+	if (panel_node) {
+		dp->drm_panel = of_drm_find_panel(panel_node);
+		of_node_put(panel_node);
+		if (!dp->drm_panel)
+			return -ENODEV;
+	}
+
 	exynos_dp_phy_init(dp);
 
 	exynos_dp_init_dp(dp);
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm/exynos/exynos_dp_core.h
index 56fa43e..9dc7991 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.h
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.h
@@ -148,6 +148,7 @@ struct exynos_dp_device {
 	struct drm_device	*drm_dev;
 	struct drm_connector	connector;
 	struct drm_encoder	*encoder;
+	struct drm_panel	*drm_panel;
 	struct clk		*clock;
 	unsigned int		irq;
 	void __iomem		*reg_base;
-- 
1.7.9.5
