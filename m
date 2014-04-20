From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 2/3] drm/exynos: add support for apb mapped phys in hdmi
 driver
Date: Sun, 20 Apr 2014 15:51:16 +0530
Message-ID: <1397989277-29602-3-git-send-email-rahul.sharma@samsung.com>
References: <1397989277-29602-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36337 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754905AbaDTKWJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Apr 2014 06:22:09 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4B006IHRGSIF30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 20 Apr 2014 19:22:04 +0900 (KST)
In-reply-to: <1397989277-29602-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Previous SoCs have hdmi phys which are accessible through
dedicated i2c lines. Newer SoCs have Apb mapped hdmi phys.
Hdmi driver is modified to support apb mapped phys.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |  142 +++++++++++++++++++++-------------
 drivers/gpu/drm/exynos/regs-hdmi.h   |    7 ++
 2 files changed, 96 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 438eeda..f4566b1 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -33,6 +33,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/i2c.h>
 #include <linux/of_gpio.h>
 #include <linux/hdmi.h>
@@ -67,6 +68,8 @@ enum hdmi_type {
 
 struct hdmi_driver_data {
 	unsigned int type;
+	const struct hdmiphy_config *phy_confs;
+	unsigned int phy_conf_count;
 	unsigned int is_apb_phy:1;
 };
 
@@ -196,6 +199,9 @@ struct hdmi_context {
 	struct hdmi_resources		res;
 
 	int				hpd_gpio;
+	void __iomem			*regs_hdmiphy;
+	const struct hdmiphy_config		*phy_confs;
+	unsigned int			phy_conf_count;
 
 	enum hdmi_type			type;
 };
@@ -205,14 +211,6 @@ struct hdmiphy_config {
 	u8 conf[32];
 };
 
-struct hdmi_driver_data exynos4212_hdmi_driver_data = {
-	.type	= HDMI_TYPE14,
-};
-
-struct hdmi_driver_data exynos5_hdmi_driver_data = {
-	.type	= HDMI_TYPE14,
-};
-
 /* list of phy config settings */
 static const struct hdmiphy_config hdmiphy_v13_configs[] = {
 	{
@@ -427,6 +425,21 @@ static const struct hdmiphy_config hdmiphy_v14_configs[] = {
 	},
 };
 
+
+struct hdmi_driver_data exynos4212_hdmi_driver_data = {
+	.type		= HDMI_TYPE14,
+	.phy_confs	= hdmiphy_v14_configs,
+	.phy_conf_count	= ARRAY_SIZE(hdmiphy_v14_configs),
+	.is_apb_phy	= 0,
+};
+
+struct hdmi_driver_data exynos5_hdmi_driver_data = {
+	.type		= HDMI_TYPE14,
+	.phy_confs	= hdmiphy_v13_configs,
+	.phy_conf_count	= ARRAY_SIZE(hdmiphy_v13_configs),
+	.is_apb_phy	= 0,
+};
+
 static inline u32 hdmi_reg_read(struct hdmi_context *hdata, u32 reg_id)
 {
 	return readl(hdata->regs + reg_id);
@@ -446,6 +459,48 @@ static inline void hdmi_reg_writemask(struct hdmi_context *hdata,
 	writel(value, hdata->regs + reg_id);
 }
 
+static int hdmiphy_reg_writeb(struct hdmi_context *hdata,
+			u32 reg_offset, u8 value)
+{
+	if (hdata->hdmiphy_port) {
+		u8 buffer[2];
+		int ret;
+
+		buffer[0] = reg_offset;
+		buffer[1] = value;
+
+		ret = i2c_master_send(hdata->hdmiphy_port, buffer, 2);
+		if (ret == 2)
+			return 0;
+		return ret;
+	} else {
+		writeb(value, hdata->regs_hdmiphy + (reg_offset<<2));
+		return 0;
+	}
+}
+
+static int hdmiphy_reg_write_buf(struct hdmi_context *hdata,
+			u32 reg_offset, const u8 *buf, u32 len)
+{
+	if ((reg_offset + len) > 32)
+		return -EINVAL;
+
+	if (hdata->hdmiphy_port) {
+		int ret;
+
+		ret = i2c_master_send(hdata->hdmiphy_port, buf, len);
+		if (ret == len)
+			return 0;
+		return ret;
+	} else {
+		int i;
+		for (i = 0; i < len; i++)
+			writeb(buf[i], hdata->regs_hdmiphy +
+				((reg_offset + i)<<2));
+		return 0;
+	}
+}
+
 static void hdmi_v13_regs_dump(struct hdmi_context *hdata, char *prefix)
 {
 #define DUMPREG(reg_id) \
@@ -849,20 +904,10 @@ static int hdmi_get_modes(struct drm_connector *connector)
 
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
+	for (i = 0; i < hdata->phy_conf_count; i++)
+		if (hdata->phy_confs[i].pixel_clock == pixel_clock)
 			return i;
 
 	DRM_DEBUG_KMS("Could not find phy config for %d\n", pixel_clock);
@@ -1514,17 +1559,9 @@ static void hdmiphy_poweroff(struct hdmi_context *hdata)
 
 static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 {
-	const u8 *hdmiphy_data;
-	u8 buffer[32];
-	u8 operation[2];
 	int ret;
 	int i;
 
-	if (!hdata->hdmiphy_port) {
-		DRM_ERROR("hdmiphy is not attached\n");
-		return;
-	}
-
 	/* pixel clock */
 	i = hdmi_find_phy_conf(hdata, hdata->mode_conf.pixel_clock);
 	if (i < 0) {
@@ -1532,26 +1569,17 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 		return;
 	}
 
-	if (hdata->type == HDMI_TYPE13)
-		hdmiphy_data = hdmiphy_v13_configs[i].conf;
-	else
-		hdmiphy_data = hdmiphy_v14_configs[i].conf;
-
-	memcpy(buffer, hdmiphy_data, 32);
-	ret = i2c_master_send(hdata->hdmiphy_port, buffer, 32);
-	if (ret != 32) {
-		DRM_ERROR("failed to configure HDMIPHY via I2C\n");
+	ret = hdmiphy_reg_write_buf(hdata, 0, hdata->phy_confs[i].conf, 32);
+	if (ret) {
+		DRM_ERROR("failed to configure hdmiphy\n");
 		return;
 	}
 
 	usleep_range(10000, 12000);
 
-	/* operation mode */
-	operation[0] = 0x1f;
-	operation[1] = 0x80;
-
-	ret = i2c_master_send(hdata->hdmiphy_port, operation, 2);
-	if (ret != 2) {
+	ret = hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE,
+				HDMI_PHY_DISABLE_MODE_SET);
+	if (ret) {
 		DRM_ERROR("failed to enable hdmiphy\n");
 		return;
 	}
@@ -2070,6 +2098,8 @@ static int hdmi_probe(struct platform_device *pdev)
 
 	drv_data = (struct hdmi_driver_data *)match->data;
 	hdata->type = drv_data->type;
+	hdata->phy_confs = drv_data->phy_confs;
+	hdata->phy_conf_count = drv_data->phy_conf_count;
 
 	hdata->hpd_gpio = pdata->hpd_gpio;
 	hdata->dev = dev;
@@ -2103,10 +2133,6 @@ static int hdmi_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	/* Not support APB PHY yet. */
-	if (drv_data->is_apb_phy)
-		return -EPERM;
-
 	/* hdmiphy i2c driver */
 	phy_node = of_parse_phandle(dev->of_node, "phy", 0);
 	if (!phy_node) {
@@ -2114,11 +2140,21 @@ static int hdmi_probe(struct platform_device *pdev)
 		ret = -ENODEV;
 		goto err_ddc;
 	}
-	hdata->hdmiphy_port = of_find_i2c_device_by_node(phy_node);
-	if (!hdata->hdmiphy_port) {
-		DRM_ERROR("Failed to get hdmi phy i2c client from node\n");
-		ret = -ENODEV;
-		goto err_ddc;
+
+	if (drv_data->is_apb_phy) {
+		hdata->regs_hdmiphy = of_iomap(phy_node, 0);
+		if (!hdata->regs_hdmiphy) {
+			DRM_ERROR("failed to ioremap hdmi phy\n");
+			ret = -ENOMEM;
+			goto err_ddc;
+		}
+	} else {
+		hdata->hdmiphy_port = of_find_i2c_device_by_node(phy_node);
+		if (!hdata->hdmiphy_port) {
+			DRM_ERROR("Failed to get hdmi phy i2c client\n");
+			ret = -ENODEV;
+			goto err_ddc;
+		}
 	}
 
 	hdata->irq = gpio_to_irq(hdata->hpd_gpio);
diff --git a/drivers/gpu/drm/exynos/regs-hdmi.h b/drivers/gpu/drm/exynos/regs-hdmi.h
index ef1b3eb..84a69cd 100644
--- a/drivers/gpu/drm/exynos/regs-hdmi.h
+++ b/drivers/gpu/drm/exynos/regs-hdmi.h
@@ -578,4 +578,11 @@
 #define HDMI_TG_VACT_ST4_H		HDMI_TG_BASE(0x0074)
 #define HDMI_TG_3D			HDMI_TG_BASE(0x00F0)
 
+/* HDMI PHY Registers Offsets*/
+#define HDMIPHY_MODE_SET_DONE		(0x7C >> 2)
+
+/* HDMI PHY Values */
+#define HDMI_PHY_DISABLE_MODE_SET	0x80
+#define HDMI_PHY_ENABLE_MODE_SET	0x00
+
 #endif /* SAMSUNG_REGS_HDMI_H */
-- 
1.7.9.5
