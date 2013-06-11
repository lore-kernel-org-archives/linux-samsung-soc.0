From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 4/9] drm/exynos: add support for exynos5420 hdmiphy
Date: Tue, 11 Jun 2013 19:41:26 +0530
Message-ID: <1370959891-8923-5-git-send-email-rahul.sharma@samsung.com>
References: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64425 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751464Ab3FKNu6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 09:50:58 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO800M1HEGTOYL0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Jun 2013 22:50:53 +0900 (KST)
In-reply-to: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add support for exynos5420 hdmiphy which is mapped to the platform
bus. hdmi dt node has a property with name "phy" which holds the
phandle for hdmiphy node. hdmi driver uses this phandle to check
the compatible type of the phy. If it is compatible with exynos5420,
it needs to be treated as a platform bus mapped device, else i2c
device.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |  274 ++++++++++++++++++++++++++++++----
 1 file changed, 243 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 0c94e54..423bdc6 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -191,6 +191,7 @@ struct hdmi_context {
 
 	void __iomem			*regs;
 	void __iomem			*phy_pow_ctrl_reg;
+	void __iomem			*regs_hdmiphy;
 	void				*parent_ctx;
 	int				irq;
 
@@ -381,6 +382,136 @@ static const struct hdmiphy_config hdmiphy_4212_configs[] = {
 	},
 };
 
+static const struct hdmiphy_config hdmiphy_5420_configs[] = {
+	{
+		.pixel_clock = 25200000,
+		.conf = {
+			0x01, 0x52, 0x3F, 0x55, 0x40, 0x01, 0x00, 0xC8,
+			0x82, 0xC8, 0xBD, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
+			0x06, 0x80, 0x01, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0xF4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 27000000,
+		.conf = {
+			0x01, 0xD1, 0x22, 0x51, 0x40, 0x08, 0xFC, 0xE0,
+			0x98, 0xE8, 0xCB, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
+			0x06, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0xE4, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 27027000,
+		.conf = {
+			0x01, 0xD1, 0x2D, 0x72, 0x40, 0x64, 0x12, 0xC8,
+			0x43, 0xE8, 0x0E, 0xD9, 0x45, 0xA0, 0xAC, 0x80,
+			0x06, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0xE3, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 36000000,
+		.conf = {
+			0x01, 0x51, 0x2D, 0x55, 0x40, 0x40, 0x00, 0xC8,
+			0x02, 0xC8, 0x0E, 0xD9, 0x45, 0xA0, 0xAC, 0x80,
+			0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0xAB, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+
+		},
+	},
+	{
+		.pixel_clock = 40000000,
+		.conf = {
+			0x01, 0xD1, 0x21, 0x31, 0x40, 0x3C, 0x28, 0xC8,
+			0x87, 0xE8, 0xC8, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
+			0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0x9A, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 65000000,
+		.conf = {
+			0x01, 0xD1, 0x36, 0x34, 0x40, 0x0C, 0x04, 0xC8,
+			0x82, 0xE8, 0x45, 0xD9, 0x45, 0xA0, 0xAC, 0x80,
+			0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0xBD, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 71000000,
+		.conf = {
+			0x01, 0xD1, 0x3B, 0x35, 0x40, 0x0C, 0x04, 0xC8,
+			0x85, 0xE8, 0x63, 0xD9, 0x45, 0xA0, 0xAC, 0x80,
+			0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0x57, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 74176000,
+		.conf = {
+			0x01, 0xD1, 0x1F, 0x10, 0x40, 0x5B, 0xEF, 0xC8,
+			0x81, 0xE8, 0xB9, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
+			0x56, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0xA6, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 74250000,
+		.conf = {
+			0x01, 0xD1, 0x1F, 0x10, 0x40, 0x40, 0xF8, 0xC8,
+			0x81, 0xE8, 0xBA, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
+			0x56, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0xA5, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 83500000,
+		.conf = {
+			0x01, 0xD1, 0x23, 0x11, 0x40, 0x0C, 0xFB, 0xC8,
+			0x85, 0xE8, 0xD1, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
+			0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0x4A, 0x24, 0x00, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 106500000,
+		.conf = {
+			0x01, 0xD1, 0x2C, 0x12, 0x40, 0x0C, 0x09, 0xC8,
+			0x84, 0xE8, 0x0A, 0xD9, 0x45, 0xA0, 0xAC, 0x80,
+			0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0x73, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 108000000,
+		.conf = {
+			0x01, 0x51, 0x2D, 0x15, 0x40, 0x01, 0x00, 0xC8,
+			0x82, 0xC8, 0x0E, 0xD9, 0x45, 0xA0, 0xAC, 0x80,
+			0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0xC7, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 146250000,
+		.conf = {
+			0x01, 0xD1, 0x3D, 0x15, 0x40, 0x18, 0xFD, 0xC8,
+			0x83, 0xE8, 0x6E, 0xD9, 0x45, 0xA0, 0xAC, 0x80,
+			0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0x54, 0x24, 0x01, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+	{
+		.pixel_clock = 148500000,
+		.conf = {
+			0x01, 0xD1, 0x1F, 0x00, 0x40, 0x40, 0xF8, 0xC8,
+			0x81, 0xE8, 0xBA, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
+			0x66, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
+			0x54, 0x4B, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
+		},
+	},
+};
+
 struct hdmi_infoframe {
 	enum HDMI_PACKET_TYPE type;
 	u8 ver;
@@ -414,6 +545,70 @@ static inline void hdmi_phy_pow_ctrl_reg_writemask(struct hdmi_context *hdata,
 	writel(value, hdata->phy_pow_ctrl_reg);
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
+static int hdmiphy_reg_read_buf(struct hdmi_context *hdata,
+			u32 reg_offset, u8 *buf, u32 len)
+{
+	if ((reg_offset + len) > 32)
+		return -EINVAL;
+
+	if (hdata->hdmiphy_port) {
+		int ret;
+
+		ret = i2c_master_recv(hdata->hdmiphy_port, buf, len);
+		if (ret == len)
+			return 0;
+		return ret;
+	} else {
+		int i;
+		for (i = 0; i < len; i++)
+			buf[i] = readb(hdata->regs_hdmiphy +
+				((reg_offset + i)<<2));
+		return 0;
+	}
+}
+
 static void hdmi_4210_regs_dump(struct hdmi_context *hdata, char *prefix)
 {
 #define DUMPREG(reg_id) \
@@ -796,6 +991,9 @@ static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
 	} else if (hdata->version == HDMI_VER_EXYNOS4212) {
 		confs = hdmiphy_4212_configs;
 		count = ARRAY_SIZE(hdmiphy_4212_configs);
+	} else if (hdata->version == HDMI_VER_EXYNOS5420) {
+		confs = hdmiphy_5420_configs;
+		count = ARRAY_SIZE(hdmiphy_5420_configs);
 	} else
 		return -EINVAL;
 
@@ -1318,19 +1516,13 @@ static void hdmi_mode_apply(struct hdmi_context *hdata)
 
 static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 {
-	u8 buffer[2];
 	u32 reg;
 
 	clk_disable_unprepare(hdata->res.sclk_hdmi);
 	clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_pixel);
 	clk_prepare_enable(hdata->res.sclk_hdmi);
 
-	/* operation mode */
-	buffer[0] = 0x1f;
-	buffer[1] = 0x00;
-
-	if (hdata->hdmiphy_port)
-		i2c_master_send(hdata->hdmiphy_port, buffer, 2);
+	hdmiphy_reg_writeb(hdata, 0x1f, 0x00);
 
 	if (hdata->version == HDMI_VER_EXYNOS4210)
 		reg = HDMI_4210_PHY_RSTOUT;
@@ -1366,16 +1558,10 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 {
 	const u8 *hdmiphy_data;
 	u8 buffer[32];
-	u8 operation[2];
 	u8 read_buffer[32] = {0, };
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
@@ -1383,31 +1569,32 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 		return;
 	}
 
-	if (hdata->version == HDMI_VER_EXYNOS4210)
+	if (hdata->version == HDMI_VER_EXYNOS4210) {
 		hdmiphy_data = hdmiphy_4210_configs[i].conf;
-	else
+	} else if (hdata->version == HDMI_VER_EXYNOS4212) {
 		hdmiphy_data = hdmiphy_4212_configs[i].conf;
+	} else if (hdata->version == HDMI_VER_EXYNOS5420) {
+		hdmiphy_data = hdmiphy_5420_configs[i].conf;
+	} else {
+		DRM_ERROR("invalid hdmi version.\n");
+		return;
+	}
 
-	memcpy(buffer, hdmiphy_data, 32);
-	ret = i2c_master_send(hdata->hdmiphy_port, buffer, 32);
-	if (ret != 32) {
-		DRM_ERROR("failed to configure HDMIPHY via I2C\n");
+	ret = hdmiphy_reg_write_buf(hdata, 0, hdmiphy_data, 32);
+	if (ret) {
+		DRM_ERROR("failed to configure HDMIPHY\n");
 		return;
 	}
 
 	usleep_range(10000, 12000);
 
-	/* operation mode */
-	operation[0] = 0x1f;
-	operation[1] = 0x80;
-
-	ret = i2c_master_send(hdata->hdmiphy_port, operation, 2);
-	if (ret != 2) {
+	ret = hdmiphy_reg_writeb(hdata, 0x1f, 0x80);
+	if (ret < 0) {
 		DRM_ERROR("failed to enable hdmiphy\n");
 		return;
 	}
 
-	ret = i2c_master_recv(hdata->hdmiphy_port, read_buffer, 32);
+	ret = hdmiphy_reg_read_buf(hdata, 0, read_buffer, 32);
 	if (ret < 0) {
 		DRM_ERROR("failed to read hdmiphy config\n");
 		return;
@@ -2000,6 +2187,7 @@ static int hdmi_probe(struct platform_device *pdev)
 	struct hdmi_context *hdata;
 	struct s5p_hdmi_platform_data *pdata;
 	struct resource *res;
+	struct device_node *phy_node;
 	int ret;
 
 	DRM_DEBUG_KMS("[%d]\n", __LINE__);
@@ -2088,14 +2276,38 @@ static int hdmi_probe(struct platform_device *pdev)
 
 	hdata->ddc_port = hdmi_ddc;
 
-	/* hdmiphy i2c driver */
-	if (i2c_add_driver(&hdmiphy_driver)) {
-		DRM_ERROR("failed to register hdmiphy i2c driver\n");
-		ret = -ENOENT;
+	/* hdmiphy driver */
+	phy_node = of_parse_phandle(dev->of_node, "phy", 0);
+	if (IS_ERR_OR_NULL(phy_node)) {
+		DRM_ERROR("failed to get phandle for phy.\n");
+		return -ENOENT;
 		goto err_ddc;
 	}
 
-	hdata->hdmiphy_port = hdmi_hdmiphy;
+	if (of_device_is_compatible(phy_node, "samsung,exynos5420-hdmiphy")) {
+		u32 buf[2];
+
+		if (of_property_read_u32_array(phy_node, "reg", buf, 2)) {
+			DRM_ERROR("faild to get reg for hdmi-phy\n");
+			ret = -EINVAL;
+			goto err_ddc;
+		}
+
+		hdata->regs_hdmiphy = devm_ioremap(hdata->dev, buf[0], buf[1]);
+		if (!hdata->regs_hdmiphy) {
+			DRM_ERROR("failed to ioremap hdmi-phy\n");
+			ret = -ENOMEM;
+			goto err_ddc;
+		}
+		hdata->hdmiphy_port = NULL;
+	} else {
+		if (i2c_add_driver(&hdmiphy_driver)) {
+			DRM_ERROR("failed to register hdmiphy i2c driver\n");
+			ret = -ENOENT;
+			goto err_ddc;
+		}
+		hdata->hdmiphy_port = hdmi_hdmiphy;
+	}
 
 	hdata->irq = gpio_to_irq(hdata->hpd_gpio);
 	if (hdata->irq < 0) {
-- 
1.7.10.4
