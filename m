From: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 4/4] drm: exynos: hdmi: Add dt support for hdmiphy settings
Date: Thu, 19 Dec 2013 17:42:28 +0530
Message-ID: <1387455148-22999-5-git-send-email-s.shirish@samsung.com>
References: <1387455148-22999-1-git-send-email-s.shirish@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1387455148-22999-1-git-send-email-s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds dt support to hdmiphy config settings
as it is board specific and depends on the signal pattern
of board.

Signed-off-by: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/video/exynos_hdmi.txt      |   34 ++++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   89 ++++++++++++++++----
 2 files changed, 105 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
index 323983b..0766e6e 100644
--- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
+++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
@@ -13,6 +13,31 @@ Required properties:
 	b) pin number within the gpio controller.
 	c) optional flags and pull up/down.
 
+Optional-but-recommended properties:
+- hdmiphy-configs: following information about the hdmiphy config settings.
+	a) "config<N>: config<N>" specifies the phy configuration settings,
+		where 'N' denotes the number of configuration, since every
+		pixel clock can have its unique configuration.
+		"samsung,pixel-clock" specifies the pixel clock
+		"samsung,de-emphasis-level" provides fine control of TMDS data
+		 pre emphasis, below shown is example for
+		data de-emphasis register at address 0x145D0040.
+			hdmiphy@38[16] for bits[3:0] permitted values are in
+			the range of 760 mVdiff to 1400 mVdiff at 20mVdiff
+			increments for every LSB
+			hdmiphy@38[16] for bits[7:4] permitted values are in
+			the range of 0dB to -7.45dB at increments of -0.45dB
+			for every LSB.
+		"samsung,clock-level" provides fine control of TMDS data
+		amplitude for each channel,
+		for example if 0x145D005C is the address of clock level
+		register then,
+			hdmiphy@38[23] for bits [1:0] permitted values are in
+			the range of 0 mVdiff & 60 mVdiff for each channel at
+			increments 20 mVdiff of amplitude levels for every LSB,
+			hdmiphy@38[23] for bits [7:3] permitted values are in
+			the range of 790 and 1430 mV at 20mV increments for
+			every LSB.
 Example:
 
 	hdmi {
@@ -20,4 +45,13 @@ Example:
 		reg = <0x14530000 0x100000>;
 		interrupts = <0 95 0>;
 		hpd-gpio = <&gpx3 7 1>;
+		hdmiphy-configs {
+			config0: config0 {
+				samsung,pixel-clock = <25200000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+
+			/* ... */
+		}
 	};
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index a0e10ae..2fa0074 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -200,6 +200,9 @@ struct hdmi_context {
 
 	struct hdmi_resources		res;
 
+	struct hdmiphy_config		*confs;
+	int				nr_confs;
+
 	int				hpd_gpio;
 
 	enum hdmi_type			type;
@@ -259,7 +262,7 @@ static const struct hdmiphy_config hdmiphy_v13_configs[] = {
 	},
 };
 
-static const struct hdmiphy_config hdmiphy_v14_configs[] = {
+static struct hdmiphy_config hdmiphy_v14_configs[] = {
 	{
 		.pixel_clock = 25200000,
 		.conf = {
@@ -771,20 +774,10 @@ static struct edid *hdmi_get_edid(void *ctx, struct drm_connector *connector)
 
 static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
 {
-	const struct hdmiphy_config *confs;
-	int count, i;
-
-	if (hdata->type == HDMI_TYPE13) {
-		confs = hdmiphy_v13_configs;
-		count = ARRAY_SIZE(hdmiphy_v13_configs);
-	} else if (hdata->type == HDMI_TYPE14) {
-		confs = hdmiphy_v14_configs;
-		count = ARRAY_SIZE(hdmiphy_v14_configs);
-	} else
-		return -EINVAL;
+	int i;
 
-	for (i = 0; i < count; i++)
-		if (confs[i].pixel_clock == pixel_clock)
+	for (i = 0; i < hdata->nr_confs; i++)
+		if (hdata->confs[i].pixel_clock == pixel_clock)
 			return i;
 
 	DRM_DEBUG_KMS("Could not find phy config for %d\n", pixel_clock);
@@ -1363,10 +1356,7 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 		return;
 	}
 
-	if (hdata->type == HDMI_TYPE13)
-		hdmiphy_data = hdmiphy_v13_configs[i].conf;
-	else
-		hdmiphy_data = hdmiphy_v14_configs[i].conf;
+	hdmiphy_data = hdata->confs[i].conf;
 
 	memcpy(buffer, hdmiphy_data, 32);
 	ret = i2c_master_send(hdata->hdmiphy_port, buffer, 32);
@@ -1858,6 +1848,62 @@ void hdmi_attach_hdmiphy_client(struct i2c_client *hdmiphy)
 		hdmi_hdmiphy = hdmiphy;
 }
 
+static int drm_hdmi_dt_parse_phy_conf(struct platform_device *pdev,
+						struct hdmi_context *hdata)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *dev_np = dev->of_node;
+	struct device_node *phy_conf, *cfg_np;
+	int i, pixel_clock = 0;
+
+	/* Initialize with default config */
+	switch (hdata->type) {
+	case HDMI_TYPE13:
+		hdata->confs = hdmiphy_v13_configs;
+		hdata->nr_confs = ARRAY_SIZE(hdmiphy_v13_configs);
+		break;
+	case HDMI_TYPE14:
+		hdata->confs = hdmiphy_v14_configs;
+		hdata->nr_confs = ARRAY_SIZE(hdmiphy_v14_configs);
+		break;
+	default:
+		DRM_ERROR("Did not find valid HDMI version\n");
+		break;
+	}
+
+	phy_conf = of_get_child_by_name(dev_np, "hdmiphy-configs");
+	if (phy_conf == NULL) {
+		DRM_ERROR("Did not find hdmiphy-configs node\n");
+		return -ENODEV;
+	}
+
+	for_each_child_of_node(phy_conf, cfg_np) {
+		if (of_property_read_u32(cfg_np, "samsung,pixel-clock",
+							&pixel_clock))
+			continue;
+
+		for (i = 0; i < ARRAY_SIZE(hdata->nr_confs); i++) {
+			if (hdata->confs[i].pixel_clock == pixel_clock)
+				/* Update the data de-emphasis and data level */
+				if (of_property_read_u8_array(cfg_np,
+					 "samsung,config-de-emphasis-level",
+					&hdata->confs[i].conf[16], 1)) {
+					DRM_ERROR("Failed to get conf\n");
+					return -EINVAL;
+				}
+				/* Update the clock level diff */
+				if (of_property_read_u8_array(cfg_np,
+					 "samsung,config-clock-level",
+					&hdata->confs[i].conf[23], 1)) {
+					DRM_ERROR("Failed to get conf\n");
+					return -EINVAL;
+				}
+		}
+	}
+	return 0;
+
+}
+
 static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
 					(struct device *dev)
 {
@@ -1986,6 +2032,13 @@ static int hdmi_probe(struct platform_device *pdev)
 		goto err_hdmiphy;
 	}
 
+	/* assign hdmiphy configurations */
+	ret = drm_hdmi_dt_parse_phy_conf(pdev, hdata);
+	if (ret) {
+		DRM_ERROR("failed to get user defined config,will use
+			default configs, eye diagram tests may fail\n");
+	}
+
 	/* Attach HDMI Driver to common hdmi. */
 	exynos_hdmi_drv_attach(drm_hdmi_ctx);
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
