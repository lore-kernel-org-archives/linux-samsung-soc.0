From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 7/7] drm/exynos/hdmi: add Exynos5433 support
Date: Mon, 02 Nov 2015 14:16:45 +0100
Message-ID: <1446470205-15606-8-git-send-email-a.hajda@samsung.com>
References: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:24851 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753143AbbKBNSG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2015 08:18:06 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NX600KBFVM5AC90@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Nov 2015 13:18:05 +0000 (GMT)
In-reply-to: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

HDMI on Exynos5433 differs from previous versions:
- different HDMI-PHY settings,
- different clocks,
- SYSREG registers for enabling reference clock,
- MODE_SET register in HDMI-PHY.
It is distinguished from other variants by different compatible string.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 142 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/regs-hdmi.h   |   9 ++-
 2 files changed, 149 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index e44e2f6..46cf863 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -112,6 +112,7 @@ struct string_array_spec {
 struct hdmi_driver_data {
 	unsigned int type;
 	unsigned int is_apb_phy:1;
+	unsigned int has_sysreg:1;
 	struct hdmiphy_configs phy_confs;
 	struct string_array_spec clk_gates;
 	/*
@@ -140,6 +141,7 @@ struct hdmi_context {
 	struct gpio_desc 		*hpd_gpio;
 	int				irq;
 	struct regmap			*pmureg;
+	struct regmap			*sysreg;
 	struct clk			**clk_gates;
 	struct clk			**clk_muxes;
 	struct regulator_bulk_data	regul_bulk[ARRAY_SIZE(supply)];
@@ -516,6 +518,90 @@ static const struct hdmiphy_config hdmiphy_5420_configs[] = {
 	},
 };
 
+static const struct hdmiphy_config hdmiphy_5433_configs[] = {
+	{
+		.pixel_clock = 27000000,
+		.conf = {
+			0x01, 0x51, 0x22, 0x51, 0x08, 0xfc, 0x88, 0x46,
+			0x72, 0x50, 0x24, 0x0c, 0x24, 0x0f, 0x7c, 0xa5,
+			0xd4, 0x2b, 0x87, 0x00, 0x00, 0x04, 0x00, 0x30,
+			0x08, 0x10, 0x01, 0x01, 0x48, 0x40, 0x00, 0x40,
+		},
+	},
+	{
+		.pixel_clock = 27027000,
+		.conf = {
+			0x01, 0x51, 0x2d, 0x72, 0x64, 0x09, 0x88, 0xc3,
+			0x71, 0x50, 0x24, 0x14, 0x24, 0x0f, 0x7c, 0xa5,
+			0xd4, 0x2b, 0x87, 0x00, 0x00, 0x04, 0x00, 0x30,
+			0x28, 0x10, 0x01, 0x01, 0x48, 0x40, 0x00, 0x40,
+		},
+	},
+	{
+		.pixel_clock = 40000000,
+		.conf = {
+			0x01, 0x51, 0x32, 0x55, 0x01, 0x00, 0x88, 0x02,
+			0x4d, 0x50, 0x44, 0x8C, 0x27, 0x00, 0x7C, 0xAC,
+			0xD6, 0x2B, 0x67, 0x00, 0x00, 0x04, 0x00, 0x30,
+			0x08, 0x10, 0x01, 0x01, 0x48, 0x40, 0x00, 0x40,
+		},
+	},
+	{
+		.pixel_clock = 50000000,
+		.conf = {
+			0x01, 0x51, 0x34, 0x40, 0x64, 0x09, 0x88, 0xc3,
+			0x3d, 0x50, 0x44, 0x8C, 0x27, 0x00, 0x7C, 0xAC,
+			0xD6, 0x2B, 0x67, 0x00, 0x00, 0x04, 0x00, 0x30,
+			0x08, 0x10, 0x01, 0x01, 0x48, 0x40, 0x00, 0x40,
+		},
+	},
+	{
+		.pixel_clock = 65000000,
+		.conf = {
+			0x01, 0x51, 0x36, 0x31, 0x40, 0x10, 0x04, 0xc6,
+			0x2e, 0xe8, 0x44, 0x8C, 0x27, 0x00, 0x7C, 0xAC,
+			0xD6, 0x2B, 0x67, 0x00, 0x00, 0x04, 0x00, 0x30,
+			0x08, 0x10, 0x01, 0x01, 0x48, 0x40, 0x00, 0x40,
+		},
+	},
+	{
+		.pixel_clock = 74176000,
+		.conf = {
+			0x01, 0x51, 0x3E, 0x35, 0x5B, 0xDE, 0x88, 0x42,
+			0x53, 0x51, 0x44, 0x8C, 0x27, 0x00, 0x7C, 0xAC,
+			0xD6, 0x2B, 0x67, 0x00, 0x00, 0x04, 0x00, 0x30,
+			0x08, 0x10, 0x01, 0x01, 0x48, 0x40, 0x00, 0x40,
+		},
+	},
+	{
+		.pixel_clock = 74250000,
+		.conf = {
+			0x01, 0x51, 0x3E, 0x35, 0x40, 0xF0, 0x88, 0xC2,
+			0x52, 0x51, 0x44, 0x8C, 0x27, 0x00, 0x7C, 0xAC,
+			0xD6, 0x2B, 0x67, 0x00, 0x00, 0x04, 0x00, 0x30,
+			0x08, 0x10, 0x01, 0x01, 0x48, 0x40, 0x00, 0x40,
+		},
+	},
+	{
+		.pixel_clock = 108000000,
+		.conf = {
+			0x01, 0x51, 0x2d, 0x15, 0x01, 0x00, 0x88, 0x02,
+			0x72, 0x52, 0x44, 0x8C, 0x27, 0x00, 0x7C, 0xAC,
+			0xD6, 0x2B, 0x67, 0x00, 0x00, 0x04, 0x00, 0x30,
+			0x08, 0x10, 0x01, 0x01, 0x48, 0x40, 0x00, 0x40,
+		},
+	},
+	{
+		.pixel_clock = 148500000,
+		.conf = {
+			0x01, 0x51, 0x1f, 0x00, 0x40, 0xf8, 0x88, 0xc1,
+			0x52, 0x52, 0x24, 0x0c, 0x24, 0x0f, 0x7c, 0xa5,
+			0xd4, 0x2b, 0x87, 0x00, 0x00, 0x04, 0x00, 0x30,
+			0x08, 0x10, 0x01, 0x01, 0x48, 0x4a, 0x00, 0x40,
+		},
+	},
+};
+
 static const char * const hdmi_clk_gates4[] = {
 	"hdmi", "sclk_hdmi"
 };
@@ -524,6 +610,15 @@ static const char * const hdmi_clk_muxes4[] = {
 	"sclk_pixel", "sclk_hdmiphy", "mout_hdmi"
 };
 
+static const char * const hdmi_clk_gates5433[] = {
+	"hdmi_pclk", "hdmi_i_pclk", "i_tmds_clk", "i_pixel_clk", "i_spdif_clk"
+};
+
+static const char * const hdmi_clk_muxes5433[] = {
+	"oscclk", "tmds_clko", "tmds_clko_user",
+	"oscclk", "pixel_clko", "pixel_clko_user"
+};
+
 static const struct hdmi_driver_data exynos4210_hdmi_driver_data = {
 	.type		= HDMI_TYPE13,
 	.phy_confs	= INIT_ARRAY_SPEC(hdmiphy_v13_configs),
@@ -546,6 +641,15 @@ static const struct hdmi_driver_data exynos5420_hdmi_driver_data = {
 	.clk_muxes	= INIT_ARRAY_SPEC(hdmi_clk_muxes4),
 };
 
+static const struct hdmi_driver_data exynos5433_hdmi_driver_data = {
+	.type		= HDMI_TYPE14,
+	.is_apb_phy	= 1,
+	.has_sysreg     = 1,
+	.phy_confs	= INIT_ARRAY_SPEC(hdmiphy_5433_configs),
+	.clk_gates	= INIT_ARRAY_SPEC(hdmi_clk_gates5433),
+	.clk_muxes	= INIT_ARRAY_SPEC(hdmi_clk_muxes5433),
+};
+
 static inline u32 hdmi_map_reg(struct hdmi_context *hdata, u32 reg_id)
 {
 	if ((reg_id & 0xffff0000) == HDMI_MAPPED_BASE)
@@ -1541,6 +1645,8 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 	hdmi_reg_writev(hdata, HDMI_TG_HACT_ST_L, 2, m->htotal - m->hdisplay);
 	hdmi_reg_writev(hdata, HDMI_TG_HACT_SZ_L, 2, m->hdisplay);
 	hdmi_reg_writev(hdata, HDMI_TG_V_FSZ_L, 2, m->vtotal);
+	if (hdata->drv_data == &exynos5433_hdmi_driver_data)
+		hdmi_reg_writeb(hdata, HDMI_TG_DECON_EN, 1);
 }
 
 static void hdmi_mode_apply(struct hdmi_context *hdata)
@@ -1565,6 +1671,14 @@ static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 	usleep_range(10000, 12000);
 }
 
+static void hdmiphy_enable_mode_set(struct hdmi_context *hdata, bool enable)
+{
+	u8 v = enable ? HDMI_PHY_ENABLE_MODE_SET : HDMI_PHY_DISABLE_MODE_SET;
+
+	if (hdata->drv_data == &exynos5433_hdmi_driver_data)
+		writel(v, hdata->regs_hdmiphy + HDMIPHY5433_MODE_SET_DONE);
+}
+
 static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 {
 	int ret;
@@ -1576,12 +1690,14 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 		return;
 	}
 
+	hdmiphy_enable_mode_set(hdata, true);
 	ret = hdmiphy_reg_write_buf(hdata, 0,
 			hdata->drv_data->phy_confs.data[i].conf, 32);
 	if (ret) {
 		DRM_ERROR("failed to configure hdmiphy\n");
 		return;
 	}
+	hdmiphy_enable_mode_set(hdata, false);
 
 	usleep_range(10000, 12000);
 }
@@ -1614,6 +1730,15 @@ static void hdmi_mode_set(struct drm_encoder *encoder,
 	hdata->cea_video_id = drm_match_cea_mode(mode);
 }
 
+static void hdmi_set_refclk(struct hdmi_context *hdata, bool on)
+{
+	if (!hdata->sysreg)
+		return;
+
+	regmap_update_bits(hdata->sysreg, EXYNOS5433_SYSREG_DISP_HDMI_PHY,
+			   SYSREG_HDMI_REFCLK_INT_CLK, on ? ~0 : 0);
+}
+
 static void hdmi_enable(struct drm_encoder *encoder)
 {
 	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
@@ -1631,6 +1756,8 @@ static void hdmi_enable(struct drm_encoder *encoder)
 	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
 			PMU_HDMI_PHY_ENABLE_BIT, 1);
 
+	hdmi_set_refclk(hdata, true);
+
 	hdmi_clk_enable_gates(hdata);
 
 	hdmi_conf_apply(hdata);
@@ -1665,6 +1792,8 @@ static void hdmi_disable(struct drm_encoder *encoder)
 
 	hdmi_clk_disable_gates(hdata);
 
+	hdmi_set_refclk(hdata, false);
+
 	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
 			PMU_HDMI_PHY_ENABLE_BIT, 0);
 
@@ -1817,6 +1946,9 @@ static struct of_device_id hdmi_match_types[] = {
 		.compatible = "samsung,exynos5420-hdmi",
 		.data = &exynos5420_hdmi_driver_data,
 	}, {
+		.compatible = "samsung,exynos5433-hdmi",
+		.data = &exynos5433_hdmi_driver_data,
+	}, {
 		/* end node */
 	}
 };
@@ -1983,6 +2115,16 @@ out_get_phy_port:
 		goto err_hdmiphy;
 	}
 
+	if (hdata->drv_data->has_sysreg) {
+		hdata->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
+				"samsung,sysreg-phandle");
+		if (IS_ERR(hdata->sysreg)) {
+			DRM_ERROR("sysreg regmap lookup failed.\n");
+			ret = -EPROBE_DEFER;
+			goto err_hdmiphy;
+		}
+	}
+
 	pm_runtime_enable(dev);
 
 	ret = component_add(&pdev->dev, &hdmi_component_ops);
diff --git a/drivers/gpu/drm/exynos/regs-hdmi.h b/drivers/gpu/drm/exynos/regs-hdmi.h
index 8c891e5..169667a 100644
--- a/drivers/gpu/drm/exynos/regs-hdmi.h
+++ b/drivers/gpu/drm/exynos/regs-hdmi.h
@@ -586,10 +586,12 @@
 #define HDMI_TG_VACT_ST4_L		HDMI_TG_BASE(0x0070)
 #define HDMI_TG_VACT_ST4_H		HDMI_TG_BASE(0x0074)
 #define HDMI_TG_3D			HDMI_TG_BASE(0x00F0)
+#define HDMI_TG_DECON_EN		HDMI_TG_BASE(0x01e0)
 
 /* HDMI PHY Registers Offsets*/
-#define HDMIPHY_POWER		(0x74 >> 2)
-#define HDMIPHY_MODE_SET_DONE		(0x7c >> 2)
+#define HDMIPHY_POWER			0x74
+#define HDMIPHY_MODE_SET_DONE		0x7c
+#define HDMIPHY5433_MODE_SET_DONE	0x84
 
 /* HDMI PHY Values */
 #define HDMI_PHY_POWER_ON              0x80
@@ -603,4 +605,7 @@
 #define PMU_HDMI_PHY_CONTROL		0x700
 #define PMU_HDMI_PHY_ENABLE_BIT		BIT(0)
 
+#define EXYNOS5433_SYSREG_DISP_HDMI_PHY	0x1008
+#define SYSREG_HDMI_REFCLK_INT_CLK	1
+
 #endif /* SAMSUNG_REGS_HDMI_H */
-- 
1.9.1
