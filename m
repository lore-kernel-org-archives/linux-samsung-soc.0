From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/5] drm/exynos: use regmap interface to set hdmiphy control
 bit in pmu
Date: Wed, 02 Apr 2014 22:43:43 +0530
Message-ID: <1396458826-3051-3-git-send-email-rahul.sharma@samsung.com>
References: <1396458826-3051-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34097 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932263AbaDBRO2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Apr 2014 13:14:28 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N3E000L5YK3QPC0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Apr 2014 02:14:27 +0900 (KST)
In-reply-to: <1396458826-3051-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Hdmiphy control bit needs to be set before setting the resolution
to hdmi hardware. This was handled using dummy hdmiphy clock which
is removed now.

PMU is already defined as system controller for exynos SoC. Registers
of PMU are accessed using regmap interfaces.

Devicetree binding document for hdmi is also updated.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 .../devicetree/bindings/video/exynos_hdmi.txt      |    2 ++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   17 +++++++++++++++++
 drivers/gpu/drm/exynos/regs-hdmi.h                 |    4 ++++
 3 files changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
index f9187a2..243a499 100644
--- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
+++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
@@ -27,6 +27,7 @@ Required properties:
 	"hdmi", "sclk_hdmi", "sclk_pixel", "sclk_hdmiphy" and "mout_hdmi".
 - ddc: phandle to the hdmi ddc node
 - phy: phandle to the hdmi phy node
+- samsung,syscon-phandle: phandle for system controller node for PMU.
 
 Example:
 
@@ -37,4 +38,5 @@ Example:
 		hpd-gpio = <&gpx3 7 1>;
 		ddc = <&hdmi_ddc_node>;
 		phy = <&hdmi_phy_node>;
+		samsung,syscon-phandle = <&pmu_system_controller>;
 	};
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 23abfa0..47b8c06 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -36,6 +36,8 @@
 #include <linux/i2c.h>
 #include <linux/of_gpio.h>
 #include <linux/hdmi.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 
 #include <drm/exynos_drm.h>
 
@@ -194,6 +196,7 @@ struct hdmi_context {
 	struct hdmi_resources		res;
 
 	int				hpd_gpio;
+	struct regmap			*pmureg;
 
 	enum hdmi_type			type;
 };
@@ -1853,6 +1856,9 @@ static void hdmi_poweron(struct exynos_drm_display *display)
 	if (regulator_bulk_enable(res->regul_count, res->regul_bulk))
 		DRM_DEBUG_KMS("failed to enable regulator bulk\n");
 
+	/* set pmu hdmiphy control bit to enable hdmiphy */
+	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
+			PMU_HDMI_PHY_ENABLE_BIT, 1);
 	clk_prepare_enable(res->hdmi);
 	clk_prepare_enable(res->sclk_hdmi);
 
@@ -1879,6 +1885,10 @@ static void hdmi_poweroff(struct exynos_drm_display *display)
 
 	clk_disable_unprepare(res->sclk_hdmi);
 	clk_disable_unprepare(res->hdmi);
+	/* reset pmu hdmiphy control bit to disable hdmiphy */
+	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
+			PMU_HDMI_PHY_ENABLE_BIT, 0);
+
 	regulator_bulk_disable(res->regul_count, res->regul_bulk);
 
 	pm_runtime_put_sync(hdata->dev);
@@ -2128,6 +2138,13 @@ static int hdmi_probe(struct platform_device *pdev)
 		goto err_hdmiphy;
 	}
 
+	hdata->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
+			"samsung,syscon-phandle");
+	if (IS_ERR_OR_NULL(hdata->pmureg)) {
+		DRM_ERROR("syscon regmap lookup failed.\n");
+		goto err_hdmiphy;
+	}
+
 	pm_runtime_enable(dev);
 
 	hdmi_display.ctx = hdata;
diff --git a/drivers/gpu/drm/exynos/regs-hdmi.h b/drivers/gpu/drm/exynos/regs-hdmi.h
index ef1b3eb..9811d6f 100644
--- a/drivers/gpu/drm/exynos/regs-hdmi.h
+++ b/drivers/gpu/drm/exynos/regs-hdmi.h
@@ -578,4 +578,8 @@
 #define HDMI_TG_VACT_ST4_H		HDMI_TG_BASE(0x0074)
 #define HDMI_TG_3D			HDMI_TG_BASE(0x00F0)
 
+/* PMU Registers for PHY */
+#define PMU_HDMI_PHY_CONTROL		0x700
+#define PMU_HDMI_PHY_ENABLE_BIT	(1<<0)
+
 #endif /* SAMSUNG_REGS_HDMI_H */
-- 
1.7.9.5
