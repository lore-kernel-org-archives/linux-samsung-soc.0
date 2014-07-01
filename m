From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/7] drm: exynos: hdmi: make 'hdmi-en' regulator optional and
 keep it enabled
Date: Tue, 01 Jul 2014 10:10:06 +0200
Message-ID: <1404202211-15788-3-git-send-email-m.szyprowski@samsung.com>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:27046 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755048AbaGAIKb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 04:10:31 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N80003X1XD96V70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Jul 2014 09:10:21 +0100 (BST)
In-reply-to: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Tomasz Figa <t.figa@samsung.com>

HDMI_EN regulator is additional regulator for providing voltage source
for DCC lines available on HDMI connector. When there is no power
provided for DDC epprom, some TV-sets do not pulls up HPD (hot plug
detect) line, what causes HDMI block to stay turned off. This patch
enables HDMI_EN regulator (if available) on driver probe and keep it
enabled all the time to let TV-set correctly signal HPD event.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index aa259b0a873a..a9a87d024c56 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -84,6 +84,7 @@ struct hdmi_resources {
 	struct clk			*sclk_hdmiphy;
 	struct clk			*mout_hdmi;
 	struct regulator_bulk_data	*regul_bulk;
+	struct regulator		*reg_hdmi_en;
 	int				regul_count;
 };
 
@@ -2168,7 +2169,6 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 	struct device *dev = hdata->dev;
 	struct hdmi_resources *res = &hdata->res;
 	static char *supply[] = {
-		"hdmi-en",
 		"vdd",
 		"vdd_osc",
 		"vdd_pll",
@@ -2228,6 +2228,20 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 	}
 	res->regul_count = ARRAY_SIZE(supply);
 
+	res->reg_hdmi_en = devm_regulator_get(dev, "hdmi-en");
+	if (IS_ERR(res->reg_hdmi_en) && PTR_ERR(res->reg_hdmi_en) != -ENOENT) {
+		DRM_ERROR("failed to get hdmi-en regulator\n");
+		return PTR_ERR(res->reg_hdmi_en);
+	}
+	if (!IS_ERR(res->reg_hdmi_en)) {
+		ret = regulator_enable(res->reg_hdmi_en);
+		if (ret) {
+			DRM_ERROR("failed to enable hdmi-en regulator\n");
+			return ret;
+		}
+	} else
+		res->reg_hdmi_en = NULL;
+
 	return ret;
 fail:
 	DRM_ERROR("HDMI resource init - failed\n");
@@ -2494,6 +2508,9 @@ static int hdmi_remove(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&hdata->hotplug_work);
 
+	if (hdata->res.reg_hdmi_en)
+		regulator_disable(hdata->res.reg_hdmi_en);
+
 	put_device(&hdata->hdmiphy_port->dev);
 	put_device(&hdata->ddc_adpt->dev);
 
-- 
1.9.2
