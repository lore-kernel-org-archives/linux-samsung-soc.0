From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH 2/2] drm/exynos: Provide ddc symlink in connector's sysfs
Date: Tue, 25 Jun 2019 11:46:36 +0200
Message-ID: <2bc41fb24348c7c3c89e9f653e694f8ae9b36e20.1561452052.git.andrzej.p@collabora.com>
References: <cover.1561452052.git.andrzej.p@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1561452052.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1561452052.git.andrzej.p@collabora.com>
References: <cover.1561452052.git.andrzej.p@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kernel@collabora.com, m.szyprowski@samsung.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Switch to using the ddc provided by the generic connector.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 894a99793633..6816e37861b7 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -126,7 +126,6 @@ struct hdmi_context {
 	void __iomem			*regs;
 	void __iomem			*regs_hdmiphy;
 	struct i2c_client		*hdmiphy_port;
-	struct i2c_adapter		*ddc_adpt;
 	struct gpio_desc		*hpd_gpio;
 	int				irq;
 	struct regmap			*pmureg;
@@ -872,10 +871,10 @@ static int hdmi_get_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int ret;
 
-	if (!hdata->ddc_adpt)
+	if (!connector->ddc)
 		return -ENODEV;
 
-	edid = drm_get_edid(connector, hdata->ddc_adpt);
+	edid = drm_get_edid(connector, connector->ddc);
 	if (!edid)
 		return -ENODEV;
 
@@ -1893,7 +1892,7 @@ static int hdmi_get_ddc_adapter(struct hdmi_context *hdata)
 		return -EPROBE_DEFER;
 	}
 
-	hdata->ddc_adpt = adpt;
+	hdata->connector.ddc = adpt;
 
 	return 0;
 }
@@ -2045,7 +2044,7 @@ static int hdmi_probe(struct platform_device *pdev)
 	if (hdata->regs_hdmiphy)
 		iounmap(hdata->regs_hdmiphy);
 err_ddc:
-	put_device(&hdata->ddc_adpt->dev);
+	put_device(&hdata->connector.ddc->dev);
 
 	return ret;
 }
@@ -2072,7 +2071,7 @@ static int hdmi_remove(struct platform_device *pdev)
 	if (hdata->regs_hdmiphy)
 		iounmap(hdata->regs_hdmiphy);
 
-	put_device(&hdata->ddc_adpt->dev);
+	put_device(&hdata->connector.ddc->dev);
 
 	mutex_destroy(&hdata->mutex);
 
-- 
2.17.1
