From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 2/3] drm: exynos: hdmi: use hdmiphy as PHY
Date: Thu, 15 May 2014 00:47:22 +0530
Message-ID: <1400095043-685-3-git-send-email-rahul.sharma@samsung.com>
References: <1400095043-685-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1400095043-685-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: a.hajda@samsung.com, t.stanislaws@samsung.com, devicetree@vger.kernel.org, kgene.kim@samsung.com, kishon@ti.com, kyungmin.park@samsung.com, robh+dt@kernel.org, grant.likely@linaro.org, sylvester.nawrocki@gmail.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Tomasz Stanislawski <t.stanislaws@samsung.com>

The HDMIPHY (physical interface) is controlled by a single
bit in a power controller's regiter. It was implemented
as clock. It was a simple but effective hack.

This patch makes HDMI driver to control HDMIPHY via PHY interface.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 9a6d652..ef1cdd0 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -36,6 +36,7 @@
 #include <linux/i2c.h>
 #include <linux/of_gpio.h>
 #include <linux/hdmi.h>
+#include <linux/phy/phy.h>
 
 #include <drm/exynos_drm.h>
 
@@ -74,8 +75,8 @@ struct hdmi_resources {
 	struct clk			*sclk_hdmi;
 	struct clk			*sclk_pixel;
 	struct clk			*sclk_hdmiphy;
-	struct clk			*hdmiphy;
 	struct clk			*mout_hdmi;
+	struct phy			*hdmiphy;
 	struct regulator_bulk_data	*regul_bulk;
 	int				regul_count;
 };
@@ -1854,7 +1855,7 @@ static void hdmi_poweron(struct exynos_drm_display *display)
 	if (regulator_bulk_enable(res->regul_count, res->regul_bulk))
 		DRM_DEBUG_KMS("failed to enable regulator bulk\n");
 
-	clk_prepare_enable(res->hdmiphy);
+	phy_power_on(res->hdmiphy);
 	clk_prepare_enable(res->hdmi);
 	clk_prepare_enable(res->sclk_hdmi);
 
@@ -1881,7 +1882,7 @@ static void hdmi_poweroff(struct exynos_drm_display *display)
 
 	clk_disable_unprepare(res->sclk_hdmi);
 	clk_disable_unprepare(res->hdmi);
-	clk_disable_unprepare(res->hdmiphy);
+	phy_power_off(res->hdmiphy);
 	regulator_bulk_disable(res->regul_count, res->regul_bulk);
 
 	pm_runtime_put_sync(hdata->dev);
@@ -1977,9 +1978,9 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 		DRM_ERROR("failed to get clock 'sclk_hdmiphy'\n");
 		goto fail;
 	}
-	res->hdmiphy = devm_clk_get(dev, "hdmiphy");
+	res->hdmiphy = devm_phy_get(dev, "hdmiphy");
 	if (IS_ERR(res->hdmiphy)) {
-		DRM_ERROR("failed to get clock 'hdmiphy'\n");
+		DRM_ERROR("failed to get phy 'hdmiphy'\n");
 		goto fail;
 	}
 	res->mout_hdmi = devm_clk_get(dev, "mout_hdmi");
-- 
1.7.9.5
