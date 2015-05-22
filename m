From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v7 05/13] drm/exynos: atomic phase 2: wire up state reset(), duplicate() and destroy()
Date: Fri, 22 May 2015 12:40:45 -0300
Message-ID: <1432309253-18572-6-git-send-email-gustavo@padovan.org>
References: <1432309253-18572-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:36030 "EHLO
	mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946025AbbEVPlO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 11:41:14 -0400
Received: by qkx62 with SMTP id 62so14223896qkx.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 May 2015 08:41:13 -0700 (PDT)
In-Reply-To: <1432309253-18572-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Set CRTC, planes and connectors to use the default implementations from
the atomic helper library. The helpers will work to keep track of state
for each DRM object.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/bridge/ps8622.c           | 4 ++++
 drivers/gpu/drm/bridge/ptn3460.c          | 4 ++++
 drivers/gpu/drm/exynos/exynos_dp_core.c   | 4 ++++
 drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 5 +++++
 drivers/gpu/drm/exynos/exynos_drm_dpi.c   | 4 ++++
 drivers/gpu/drm/exynos/exynos_drm_drv.c   | 2 ++
 drivers/gpu/drm/exynos/exynos_drm_dsi.c   | 4 ++++
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 4 ++++
 drivers/gpu/drm/exynos/exynos_drm_vidi.c  | 4 ++++
 drivers/gpu/drm/exynos/exynos_hdmi.c      | 4 ++++
 10 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ps8622.c b/drivers/gpu/drm/bridge/ps8622.c
index e895aa7..b604326 100644
--- a/drivers/gpu/drm/bridge/ps8622.c
+++ b/drivers/gpu/drm/bridge/ps8622.c
@@ -31,6 +31,7 @@
 #include "drmP.h"
 #include "drm_crtc.h"
 #include "drm_crtc_helper.h"
+#include "drm_atomic_helper.h"
 
 /* Brightness scale on the Parade chip */
 #define PS8622_MAX_BRIGHTNESS 0xff
@@ -502,6 +503,9 @@ static const struct drm_connector_funcs ps8622_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = ps8622_detect,
 	.destroy = ps8622_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int ps8622_attach(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
index 9d2f053..8ed3617 100644
--- a/drivers/gpu/drm/bridge/ptn3460.c
+++ b/drivers/gpu/drm/bridge/ptn3460.c
@@ -27,6 +27,7 @@
 
 #include "drm_crtc.h"
 #include "drm_crtc_helper.h"
+#include "drm_atomic_helper.h"
 #include "drm_edid.h"
 #include "drmP.h"
 
@@ -263,6 +264,9 @@ static struct drm_connector_funcs ptn3460_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = ptn3460_detect,
 	.destroy = ptn3460_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int ptn3460_bridge_attach(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 30feb7d..195fe60 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -28,6 +28,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_panel.h>
 #include <drm/bridge/ptn3460.h>
 
@@ -957,6 +958,9 @@ static struct drm_connector_funcs exynos_dp_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = exynos_dp_detect,
 	.destroy = exynos_dp_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int exynos_dp_get_modes(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index c524f0c..5bfee9b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -14,6 +14,8 @@
 
 #include <drm/drmP.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 
 #include "exynos_drm_crtc.h"
 #include "exynos_drm_drv.h"
@@ -191,6 +193,9 @@ static struct drm_crtc_funcs exynos_crtc_funcs = {
 	.set_config	= drm_crtc_helper_set_config,
 	.page_flip	= exynos_drm_crtc_page_flip,
 	.destroy	= exynos_drm_crtc_destroy,
+	.reset = drm_atomic_helper_crtc_reset,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 };
 
 struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 37678cf..ced5c23 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -13,6 +13,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_atomic_helper.h>
 
 #include <linux/regulator/consumer.h>
 
@@ -63,6 +64,9 @@ static struct drm_connector_funcs exynos_dpi_connector_funcs = {
 	.detect = exynos_dpi_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = exynos_dpi_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int exynos_dpi_get_modes(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 8ac4652..08b9a8c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -98,6 +98,8 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto err_cleanup_vblank;
 
+	drm_mode_config_reset(dev);
+
 	/*
 	 * enable drm irq mode.
 	 * - with irq_enabled = true, we can use the vblank feature.
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 0492715..e4e7f74 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -14,6 +14,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_atomic_helper.h>
 
 #include <linux/clk.h>
 #include <linux/gpio/consumer.h>
@@ -1461,6 +1462,9 @@ static struct drm_connector_funcs exynos_dsi_connector_funcs = {
 	.detect = exynos_dsi_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = exynos_dsi_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int exynos_dsi_get_modes(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index a0fdfe2..43ada86 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -13,6 +13,7 @@
 
 #include <drm/exynos_drm.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_atomic_helper.h>
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
 #include "exynos_drm_fb.h"
@@ -169,6 +170,9 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 	.update_plane	= drm_plane_helper_update,
 	.disable_plane	= drm_plane_helper_disable,
 	.destroy	= drm_plane_cleanup,
+	.reset = drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 };
 
 static int exynos_plane_atomic_check(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 1b3479a..fc3a14b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -20,6 +20,7 @@
 
 #include <drm/drm_edid.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_atomic_helper.h>
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
@@ -388,6 +389,9 @@ static struct drm_connector_funcs vidi_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = vidi_detect,
 	.destroy = vidi_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int vidi_get_modes(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 5eba971..471e486 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -17,6 +17,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_atomic_helper.h>
 
 #include "regs-hdmi.h"
 
@@ -1054,6 +1055,9 @@ static struct drm_connector_funcs hdmi_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = hdmi_detect,
 	.destroy = hdmi_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int hdmi_get_modes(struct drm_connector *connector)
-- 
2.1.0
