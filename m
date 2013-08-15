From: Shirish S <s.shirish@samsung.com>
Subject: [PATCH 3/3] drm: exynos: hdmi: Add dt support for hdmiphy settings
Date: Thu, 15 Aug 2013 08:57:05 +0530
Message-ID: <1376537225-3815-4-git-send-email-s.shirish@samsung.com>
References: <1376537225-3815-1-git-send-email-s.shirish@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25456 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759988Ab3HODEy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 23:04:54 -0400
In-reply-to: <1376537225-3815-1-git-send-email-s.shirish@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, airlied@linux.ie, kgene.kim@samsung.com, shirish@chromium.org

This patch adds dt support to hdmiphy config settings
as it is board specific and depends on the signal pattern
of board.

Signed-off-by: Shirish S <s.shirish@samsung.com>
---
 .../devicetree/bindings/video/exynos_hdmi.txt      |   18 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  191 +++++++-------------
 2 files changed, 80 insertions(+), 129 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
index 323983b..fb8a643 100644
--- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
+++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
@@ -12,7 +12,11 @@ Required properties:
 	a) phandle of the gpio controller node.
 	b) pin number within the gpio controller.
 	c) optional flags and pull up/down.
-
+- hdmiphy-confs: following information about the hdmiphy conf settings.
+        a) "nr-confs" specifies the number of pixel clocks supported.
+	b) "confX: confX" specifies the phy configuration settings,
+		"clock-frequency" specifies the pixel clock
+		"conf" specifies the setting for the corresponding pixel clock
 Example:
 
 	hdmi {
@@ -20,4 +24,16 @@ Example:
 		reg = <0x14530000 0x100000>;
 		interrupts = <0 95 0>;
 		hpd-gpio = <&gpx3 7 1>;
+		hdmiphy-confs {
+			nr-confs = <1>;
+			conf0: conf0 {
+				clock-frequency = <25200000>;
+				conf =  /bits/ 8 <
+					0x01 0x51 0x2A 0x75 0x40 0x01 0x00 0x08
+					0x82 0x80 0xfc 0xd8 0x45 0xa0 0xac 0x80
+					0x08 0x80 0x11 0x04 0x02 0x22 0x44 0x86
+					0x54 0xf4 0x24 0x00 0x00 0x00 0x01 0x80
+				>;
+			};
+		}
 	};
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 2f5c694..cb929ff 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -179,6 +179,11 @@ struct hdmi_conf_regs {
 	} conf;
 };
 
+struct hdmiphy_config {
+	int pixel_clock;
+	u8 conf[32];
+};
+
 struct hdmi_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
@@ -199,16 +204,14 @@ struct hdmi_context {
 
 	struct hdmi_resources		res;
 
+	struct hdmiphy_config		*confs;
+	int				nr_confs;
+
 	int				hpd_gpio;
 
 	enum hdmi_type			type;
 };
 
-struct hdmiphy_config {
-	int pixel_clock;
-	u8 conf[32];
-};
-
 /* list of phy config settings */
 static const struct hdmiphy_config hdmiphy_v13_configs[] = {
 	{
@@ -258,126 +261,6 @@ static const struct hdmiphy_config hdmiphy_v13_configs[] = {
 	},
 };
 
-static const struct hdmiphy_config hdmiphy_v14_configs[] = {
-	{
-		.pixel_clock = 25200000,
-		.conf = {
-			0x01, 0x51, 0x2A, 0x75, 0x40, 0x01, 0x00, 0x08,
-			0x82, 0x80, 0xfc, 0xd8, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xf4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 27000000,
-		.conf = {
-			0x01, 0xd1, 0x22, 0x51, 0x40, 0x08, 0xfc, 0x20,
-			0x98, 0xa0, 0xcb, 0xd8, 0x45, 0xa0, 0xac, 0x80,
-			0x06, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xe4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 27027000,
-		.conf = {
-			0x01, 0xd1, 0x2d, 0x72, 0x40, 0x64, 0x12, 0x08,
-			0x43, 0xa0, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xe3, 0x24, 0x00, 0x00, 0x00, 0x01, 0x00,
-		},
-	},
-	{
-		.pixel_clock = 36000000,
-		.conf = {
-			0x01, 0x51, 0x2d, 0x55, 0x40, 0x01, 0x00, 0x08,
-			0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xab, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 40000000,
-		.conf = {
-			0x01, 0x51, 0x32, 0x55, 0x40, 0x01, 0x00, 0x08,
-			0x82, 0x80, 0x2c, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0x9a, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 65000000,
-		.conf = {
-			0x01, 0xd1, 0x36, 0x34, 0x40, 0x1e, 0x0a, 0x08,
-			0x82, 0xa0, 0x45, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xbd, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 74176000,
-		.conf = {
-			0x01, 0xd1, 0x3e, 0x35, 0x40, 0x5b, 0xde, 0x08,
-			0x82, 0xa0, 0x73, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x56, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xa6, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 74250000,
-		.conf = {
-			0x01, 0xd1, 0x1f, 0x10, 0x40, 0x40, 0xf8, 0x08,
-			0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
-			0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xa5, 0x24, 0x01, 0x00, 0x00, 0x01, 0x00,
-		},
-	},
-	{
-		.pixel_clock = 83500000,
-		.conf = {
-			0x01, 0xd1, 0x23, 0x11, 0x40, 0x0c, 0xfb, 0x08,
-			0x85, 0xa0, 0xd1, 0xd8, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0x93, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 106500000,
-		.conf = {
-			0x01, 0xd1, 0x2c, 0x12, 0x40, 0x0c, 0x09, 0x08,
-			0x84, 0xa0, 0x0a, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0x73, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 108000000,
-		.conf = {
-			0x01, 0x51, 0x2d, 0x15, 0x40, 0x01, 0x00, 0x08,
-			0x82, 0x80, 0x0e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0xc7, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 146250000,
-		.conf = {
-			0x01, 0xd1, 0x3d, 0x15, 0x40, 0x18, 0xfd, 0x08,
-			0x83, 0xa0, 0x6e, 0xd9, 0x45, 0xa0, 0xac, 0x80,
-			0x08, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0x50, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
-		},
-	},
-	{
-		.pixel_clock = 148500000,
-		.conf = {
-			0x01, 0xd1, 0x1f, 0x00, 0x40, 0x40, 0xf8, 0x08,
-			0x81, 0xa0, 0xba, 0xd8, 0x45, 0xa0, 0xac, 0x80,
-			0x3c, 0x80, 0x11, 0x04, 0x02, 0x22, 0x44, 0x86,
-			0x54, 0x4b, 0x25, 0x03, 0x00, 0x00, 0x01, 0x00,
-		},
-	},
-};
-
 struct hdmi_infoframe {
 	enum HDMI_PACKET_TYPE type;
 	u8 ver;
@@ -777,8 +660,8 @@ static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
 		confs = hdmiphy_v13_configs;
 		count = ARRAY_SIZE(hdmiphy_v13_configs);
 	} else if (hdata->type == HDMI_TYPE14) {
-		confs = hdmiphy_v14_configs;
-		count = ARRAY_SIZE(hdmiphy_v14_configs);
+		confs = hdata->confs;
+		count = hdata->nr_confs;
 	} else
 		return -EINVAL;
 
@@ -1365,7 +1248,7 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 	if (hdata->type == HDMI_TYPE13)
 		hdmiphy_data = hdmiphy_v13_configs[i].conf;
 	else
-		hdmiphy_data = hdmiphy_v14_configs[i].conf;
+		hdmiphy_data = hdata->confs[i].conf;
 
 	memcpy(buffer, hdmiphy_data, 32);
 	ret = i2c_master_send(hdata->hdmiphy_port, buffer, 32);
@@ -1885,6 +1768,51 @@ static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
 err_data:
 	return NULL;
 }
+
+static int drm_hdmi_dt_parse_phy_conf(struct platform_device *pdev,
+						struct hdmi_context *hdata)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *dev_np = dev->of_node;
+	struct device_node *phy_conf, *cfg_np;
+	int i = 0;
+
+	phy_conf = of_find_node_by_name(dev_np, "hdmiphy-confs");
+	if (phy_conf == NULL) {
+		DRM_ERROR("Did not find hdmiphy_conf node\n");
+		return -ENODEV;
+	}
+
+	of_property_read_u32(phy_conf, "nr-confs", &hdata->nr_confs);
+	hdata->confs = kzalloc((hdata->nr_confs * sizeof
+					(struct hdmiphy_config)), GFP_KERNEL);
+
+	for_each_child_of_node(phy_conf, cfg_np) {
+		if (!of_find_property(cfg_np, "clock-frequency", NULL))
+			continue;
+
+		if (of_property_read_u32_array(cfg_np, "clock-frequency",
+					(u32 *)&hdata->confs[i].
+							pixel_clock, 1)) {
+				DRM_ERROR("Failed to get pixel clock\n");
+				return -EINVAL;
+		}
+
+		/*
+		 * conf property holds the phy setting value
+		 * for a particular board
+		 */
+		if (of_property_read_u8_array(cfg_np, "conf",
+					(u8 *)&hdata->confs[i].conf, 32)) {
+				DRM_ERROR("Failed to get conf\n");
+				return -EINVAL;
+		}
+		i++;
+	}
+	return 0;
+
+}
+
 #else
 static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
 					(struct device *dev)
@@ -2038,6 +1966,13 @@ static int hdmi_probe(struct platform_device *pdev)
 		goto err_hdmiphy;
 	}
 
+	/* get hdmiphy confs */
+	ret = drm_hdmi_dt_parse_phy_conf(pdev, hdata);
+	if (ret) {
+		DRM_ERROR("failed to get confs\n");
+		goto err_hdmiphy;
+	}
+
 	/* Attach HDMI Driver to common hdmi. */
 	exynos_hdmi_drv_attach(drm_hdmi_ctx);
 
-- 
1.7.10.4
