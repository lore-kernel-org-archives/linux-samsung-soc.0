From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v2 05/18] drm_modes: add command mode helpers
Date: Wed, 21 May 2014 13:42:57 +0900
Message-ID: <1400647390-26590-6-git-send-email-yj44.cho@samsung.com>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com, s.trumtrar@pengutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds helper functions to convert cmdmode
to drm_display_mode

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/drm_modes.c |   59 +++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_modes.h     |   12 +++++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index bedf189..8977381 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -37,6 +37,8 @@
 #include <drm/drm_crtc.h>
 #include <video/of_videomode.h>
 #include <video/videomode.h>
+#include <video/of_cmdmode.h>
+#include <video/cmdmode.h>
 #include <drm/drm_modes.h>
 
 #include "drm_crtc_internal.h"
@@ -651,6 +653,63 @@ EXPORT_SYMBOL_GPL(of_get_drm_display_mode);
 #endif /* CONFIG_OF */
 #endif /* CONFIG_VIDEOMODE_HELPERS */
 
+#ifdef CONFIG_CMDMODE_HELPERS
+int drm_display_mode_from_cmdmode(const struct cmdmode *cm,
+				    struct drm_display_mode *dmode)
+{
+	dmode->hdisplay = cm->hactive;
+	dmode->htotal = dmode->hsync_end = dmode->hsync_start = dmode->hdisplay;
+
+	dmode->vdisplay = cm->vactive;
+	dmode->vtotal = dmode->vsync_end = dmode->vsync_start = dmode->vdisplay;
+
+	dmode->clock = cm->pixelclock / 1000;
+
+	dmode->cs_setup = cm->cs_setup;
+	dmode->wr_setup = cm->wr_setup;
+	dmode->wr_active = cm->wr_active;
+	dmode->wr_hold = cm->wr_hold;
+
+	dmode->flags = 0;
+	drm_mode_set_name(dmode);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_display_mode_from_cmdmode);
+
+#ifdef CONFIG_OF
+/**
+ * of_get_drm_cmdmode_display_mode - get a drm_display_mode from devicetree
+ * @np: device_node with the timing specification
+ * @dmode: will be set to the return value
+ * @index: index into the list of display timings in devicetree
+ *
+ * This function is expensive and should only be used, if only one mode is to be
+ * read from DT. To get multiple modes start with
+ * of_get_cmdmode_display_timings and work with that instead.
+ */
+int of_get_drm_cmdmode_display_mode(struct device_node *np,
+				    struct drm_display_mode *dmode, int index)
+{
+	struct cmdmode cm;
+	int ret;
+
+	ret = of_get_cmdmode(np, &cm, index);
+	if (ret)
+		return ret;
+
+	drm_display_mode_from_cmdmode(&cm, dmode);
+
+	pr_debug("%s: got %dx%d display mode from %s\n",
+		of_node_full_name(np), cm.hactive, cm.vactive, np->name);
+	drm_mode_debug_printmodeline(dmode);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_get_drm_cmdmode_display_mode);
+#endif /* CONFIG_OF */
+#endif /* CONFIG_CMDMODE_HELPERS */
+
 /**
  * drm_mode_set_name - set the name on a mode
  * @mode: name will be set in this mode
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index 91d0582..0d29754 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -144,6 +144,12 @@ struct drm_display_mode {
 	int vrefresh;		/* in Hz */
 	int hsync;		/* in kHz */
 	enum hdmi_picture_aspect picture_aspect_ratio;
+
+	/* Command mode info - refers to video/cmdmode.h */
+	int cs_setup;
+	int wr_setup;
+	int wr_active;
+	int wr_hold;
 };
 
 /* mode specified on the command line */
@@ -176,6 +182,7 @@ static inline bool drm_mode_is_stereo(const struct drm_display_mode *mode)
 
 struct drm_connector;
 struct drm_cmdline_mode;
+struct cmdmode;
 
 struct drm_display_mode *drm_mode_create(struct drm_device *dev);
 void drm_mode_destroy(struct drm_device *dev, struct drm_display_mode *mode);
@@ -200,6 +207,11 @@ void drm_display_mode_from_videomode(const struct videomode *vm,
 int of_get_drm_display_mode(struct device_node *np,
 			    struct drm_display_mode *dmode,
 			    int index);
+extern int drm_display_mode_from_cmdmode(const struct cmdmode *cm,
+					   struct drm_display_mode *dmode);
+extern int of_get_drm_cmdmode_display_mode(struct device_node *np,
+					   struct drm_display_mode *dmode,
+					   int index);
 
 void drm_mode_set_name(struct drm_display_mode *mode);
 int drm_mode_hsync(const struct drm_display_mode *mode);
-- 
1.7.9.5
