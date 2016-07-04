From: Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] gpu: drm: exynos_hdmi: add missing of_node_put after calling of_parse_phandle
Date: Mon, 4 Jul 2016 15:15:55 +0800
Message-ID: <1467616555-7916-1-git-send-email-peter.chen@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-co1nam03on0071.outbound.protection.outlook.com ([104.47.40.71]:52048
	"EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752592AbcGDHXJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2016 03:23:09 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com
Cc: inki.dae@samsung.com, kyungmin.park@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Chen <peter.chen@nxp.com>

of_node_put needs to be called when the device node which is got
from of_parse_phandle has finished using.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 58de5a4..e9591c7 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1828,6 +1828,7 @@ static int hdmi_probe(struct platform_device *pdev)
 		DRM_ERROR("Failed to find ddc node in device tree\n");
 		return -ENODEV;
 	}
+	of_node_put(dev->of_node);
 
 out_get_ddc_adpt:
 	hdata->ddc_adpt = of_find_i2c_adapter_by_node(ddc_node);
@@ -1846,6 +1847,7 @@ out_get_ddc_adpt:
 		ret = -ENODEV;
 		goto err_ddc;
 	}
+	of_node_put(dev->of_node);
 
 out_get_phy_port:
 	if (hdata->drv_data->is_apb_phy) {
-- 
1.9.1
