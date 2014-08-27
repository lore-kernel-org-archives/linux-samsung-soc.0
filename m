From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Wed, 27 Aug 2014 19:59:37 +0530
Message-ID: <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18355 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934652AbaH0OhW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 10:37:22 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NAY00IYYZA8DP70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Aug 2014 23:37:20 +0900 (KST)
In-reply-to: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

A set of helper functions are defined in this patch to make
bridge driver probe independent of the drm flow.

The bridge devices register themselves on a lookup table
when they get probed by calling "drm_bridge_add".

The parent encoder driver waits till the bridge is available
in the lookup table(by calling "of_drm_find_bridge") and then
continues with its initialization.

The encoder driver should also call "drm_bridge_attach" to pass
on the drm_device, encoder pointers to the bridge object.

drm_bridge_attach inturn calls drm_bridge_init to register itself
with the drm core. Later, it calls "bridge->funcs->attach" so that
bridge can continue with other initializations.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/Makefile               |    1 +
 drivers/gpu/drm/bridge/Kconfig         |   15 ++++-
 drivers/gpu/drm/drm_bridge.c           |  102 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc.c             |    4 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |    4 +-
 include/drm/drm_crtc.h                 |   12 +++-
 6 files changed, 131 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_bridge.c

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4a55d59..bdbfb6f 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -19,6 +19,7 @@ drm-y       :=	drm_auth.o drm_buffer.o drm_bufs.o drm_cache.o \
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_gem_cma_helper.o
 drm-$(CONFIG_PCI) += ati_pcigart.o
+drm-$(CONFIG_DRM_BRIDGE) += drm_bridge.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
 drm-$(CONFIG_OF) += drm_of.o
 
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 884923f..5a8e907 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -1,5 +1,16 @@
-config DRM_PTN3460
-	tristate "PTN3460 DP/LVDS bridge"
+config DRM_BRIDGE
+	tristate
 	depends on DRM
 	select DRM_KMS_HELPER
+	help
+	  Bridge registration and lookup framework.
+
+menu "bridge chips"
+	depends on DRM_BRIDGE
+
+config DRM_PTN3460
+	tristate "PTN3460 DP/LVDS bridge"
+	depends on DRM_BRIDGE
 	---help---
+
+endmenu
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
new file mode 100644
index 0000000..b2d43fd
--- /dev/null
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -0,0 +1,102 @@
+/*
+ * Copyright (c) 2014 Samsung Electronics Co., Ltd
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sub license,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include <linux/err.h>
+#include <linux/module.h>
+
+#include <drm/drm_crtc.h>
+
+#include "drm/drmP.h"
+
+static DEFINE_MUTEX(bridge_lock);
+static LIST_HEAD(bridge_list);
+
+int drm_bridge_add(struct drm_bridge *bridge)
+{
+	mutex_lock(&bridge_lock);
+	list_add_tail(&bridge->list, &bridge_list);
+	mutex_unlock(&bridge_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_bridge_add);
+
+void drm_bridge_remove(struct drm_bridge *bridge)
+{
+	mutex_lock(&bridge_lock);
+	list_del_init(&bridge->list);
+	mutex_unlock(&bridge_lock);
+}
+EXPORT_SYMBOL(drm_bridge_remove);
+
+int drm_bridge_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder)
+{
+	int ret;
+
+	if (!bridge || !encoder)
+		return -EINVAL;
+
+	if (bridge->encoder)
+		return -EBUSY;
+
+	encoder->bridge = bridge;
+	bridge->encoder = encoder;
+	bridge->drm = encoder->dev;
+
+	ret = drm_bridge_init(bridge->drm, bridge);
+	if (ret) {
+		DRM_ERROR("Failed to register bridge with drm\n");
+		return ret;
+	}
+
+	if (bridge->funcs->attach)
+		return bridge->funcs->attach(bridge);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_bridge_attach);
+
+#ifdef CONFIG_OF
+struct drm_bridge *of_drm_find_bridge(struct device_node *np)
+{
+	struct drm_bridge *bridge;
+
+	mutex_lock(&bridge_lock);
+
+	list_for_each_entry(bridge, &bridge_list, list) {
+		if (bridge->dev->of_node == np) {
+			mutex_unlock(&bridge_lock);
+			return bridge;
+		}
+	}
+
+	mutex_unlock(&bridge_lock);
+	return NULL;
+}
+EXPORT_SYMBOL(of_drm_find_bridge);
+#endif
+
+MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
+MODULE_DESCRIPTION("DRM bridge infrastructure");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 25f5cfa..2fb22fa 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -1039,7 +1039,7 @@ int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge)
 	if (ret)
 		goto out;
 
-	bridge->dev = dev;
+	bridge->drm = dev;
 
 	list_add_tail(&bridge->head, &dev->mode_config.bridge_list);
 	dev->mode_config.num_bridge++;
@@ -1058,7 +1058,7 @@ EXPORT_SYMBOL(drm_bridge_init);
  */
 void drm_bridge_cleanup(struct drm_bridge *bridge)
 {
-	struct drm_device *dev = bridge->dev;
+	struct drm_device *dev = bridge->drm;
 
 	drm_modeset_lock_all(dev);
 	drm_mode_object_put(dev, &bridge->base);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 0309539..bc9e5ff 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -33,7 +33,7 @@ static void hdmi_bridge_destroy(struct drm_bridge *bridge)
 
 static void power_on(struct drm_bridge *bridge)
 {
-	struct drm_device *dev = bridge->dev;
+	struct drm_device *dev = bridge->drm;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
@@ -67,7 +67,7 @@ static void power_on(struct drm_bridge *bridge)
 
 static void power_off(struct drm_bridge *bridge)
 {
-	struct drm_device *dev = bridge->dev;
+	struct drm_device *dev = bridge->drm;
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index f48a436..f6f426f 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -629,6 +629,7 @@ struct drm_plane {
 
 /**
  * drm_bridge_funcs - drm_bridge control functions
+ * @attach: Called during drm_bridge_attach
  * @mode_fixup: Try to fixup (or reject entirely) proposed mode for this bridge
  * @disable: Called right before encoder prepare, disables the bridge
  * @post_disable: Called right after encoder prepare, for lockstepped disable
@@ -638,6 +639,7 @@ struct drm_plane {
  * @destroy: make object go away
  */
 struct drm_bridge_funcs {
+	int (*attach)(struct drm_bridge *bridge);
 	bool (*mode_fixup)(struct drm_bridge *bridge,
 			   const struct drm_display_mode *mode,
 			   struct drm_display_mode *adjusted_mode);
@@ -660,8 +662,11 @@ struct drm_bridge_funcs {
  * @driver_private: pointer to the bridge driver's internal context
  */
 struct drm_bridge {
-	struct drm_device *dev;
+	struct device *dev;
+	struct drm_device *drm;
+	struct drm_encoder *encoder;
 	struct list_head head;
+	struct list_head list;
 
 	struct drm_mode_object base;
 
@@ -906,6 +911,11 @@ extern void drm_connector_cleanup(struct drm_connector *connector);
 /* helper to unplug all connectors from sysfs for device */
 extern void drm_connector_unplug_all(struct drm_device *dev);
 
+extern int drm_bridge_add(struct drm_bridge *bridge);
+extern void drm_bridge_remove(struct drm_bridge *bridge);
+extern struct drm_bridge *of_drm_find_bridge(struct device_node *np);
+extern int drm_bridge_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder);
 extern int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge);
 extern void drm_bridge_cleanup(struct drm_bridge *bridge);
 
-- 
1.7.9.5
