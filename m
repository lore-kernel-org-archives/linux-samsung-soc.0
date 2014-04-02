From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 1/5] drm/exynos: remove dummy hdmiphy clock from hdmi driver
Date: Wed, 02 Apr 2014 22:43:42 +0530
Message-ID: <1396458826-3051-2-git-send-email-rahul.sharma@samsung.com>
References: <1396458826-3051-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52939 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932341AbaDBRO1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Apr 2014 13:14:27 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N3E003RZYK2V710@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Apr 2014 02:14:26 +0900 (KST)
In-reply-to: <1396458826-3051-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Exynos drm hdmi driver used to get dummy hdmiphy clock to
control the PMU bit for hdmiphy. This clock is removed
during CCF migration. This should also be cleaned from
hdmi driver.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |    8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 25bf65a..23abfa0 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -74,7 +74,6 @@ struct hdmi_resources {
 	struct clk			*sclk_hdmi;
 	struct clk			*sclk_pixel;
 	struct clk			*sclk_hdmiphy;
-	struct clk			*hdmiphy;
 	struct clk			*mout_hdmi;
 	struct regulator_bulk_data	*regul_bulk;
 	int				regul_count;
@@ -1854,7 +1853,6 @@ static void hdmi_poweron(struct exynos_drm_display *display)
 	if (regulator_bulk_enable(res->regul_count, res->regul_bulk))
 		DRM_DEBUG_KMS("failed to enable regulator bulk\n");
 
-	clk_prepare_enable(res->hdmiphy);
 	clk_prepare_enable(res->hdmi);
 	clk_prepare_enable(res->sclk_hdmi);
 
@@ -1881,7 +1879,6 @@ static void hdmi_poweroff(struct exynos_drm_display *display)
 
 	clk_disable_unprepare(res->sclk_hdmi);
 	clk_disable_unprepare(res->hdmi);
-	clk_disable_unprepare(res->hdmiphy);
 	regulator_bulk_disable(res->regul_count, res->regul_bulk);
 
 	pm_runtime_put_sync(hdata->dev);
@@ -1977,11 +1974,6 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 		DRM_ERROR("failed to get clock 'sclk_hdmiphy'\n");
 		goto fail;
 	}
-	res->hdmiphy = devm_clk_get(dev, "hdmiphy");
-	if (IS_ERR(res->hdmiphy)) {
-		DRM_ERROR("failed to get clock 'hdmiphy'\n");
-		goto fail;
-	}
 	res->mout_hdmi = devm_clk_get(dev, "mout_hdmi");
 	if (IS_ERR(res->mout_hdmi)) {
 		DRM_ERROR("failed to get clock 'mout_hdmi'\n");
-- 
1.7.9.5
