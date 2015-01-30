From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH] drm/exynos: don' disable hdmi clocks for exynos5420
Date: Fri, 30 Jan 2015 19:45:11 -0200
Message-ID: <1422654311-24984-1-git-send-email-gustavo@padovan.org>
References: <54CB4082.1000005@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:44689 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1763278AbbA3VrS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Jan 2015 16:47:18 -0500
Received: by mail-qc0-f169.google.com with SMTP id b13so22707395qcw.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jan 2015 13:47:18 -0800 (PST)
In-Reply-To: <54CB4082.1000005@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jy0922.shim@samsung.com, m.szyprowski@samsung.com, liquid.acid@gmx.net, kgene@kernel.org, inki.dae@samsung.com, Prathyush K <prathyush.k@samsung.com>

From: Prathyush K <prathyush.k@samsung.com>

When VPLL clock of less than 140 MHz was used and all the three
clocks - hdmiphy, hdmi, sclk_hdmi are disabled, the system hangs
during S2R when HDMI is connected. Since we want to use a vpll
clock of 70.5 MHz, we cannot disable these 3 clocks before suspending.
This patch moves the clk enable/disable of hdmi and sclk_hdmi
outside of the pm ops. Now system suspends and resumes with HDMI
connected with VPLL set at 70.5 MHz.

Signed-off-by: Prathyush K <prathyush.k@samsung.com>
Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 6aa0d65..0be6921 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2254,6 +2254,20 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 	} else
 		res->reg_hdmi_en = NULL;
 
+	/*
+	 * For these two clocks exynos5420 fails to suspend if VPLL clock of
+	 * 70.5 MHz is used and these clocks are disabled before suspend. So
+	 * enable them here.
+	 * Note that this will keep the clocks enabled for the entire
+	 * lifetime of the driver and waste energy when it is suspended.
+	 * However it prevents the system crash until a better solution is
+	 * found
+	 */
+	if (of_machine_is_compatible("samsung,exynos5420")) {
+		clk_prepare_enable(res->sclk_hdmi);
+		clk_prepare_enable(res->hdmi);
+	}
+
 	return ret;
 fail:
 	DRM_ERROR("HDMI resource init - failed\n");
@@ -2516,6 +2530,11 @@ static int hdmi_remove(struct platform_device *pdev)
 	if (hdata->res.reg_hdmi_en)
 		regulator_disable(hdata->res.reg_hdmi_en);
 
+	if (of_machine_is_compatible("samsung,exynos5420")) {
+		clk_disable_unprepare(hdata->res.sclk_hdmi);
+		clk_disable_unprepare(hdata->res.hdmi);
+	}
+
 	if (hdata->hdmiphy_port)
 		put_device(&hdata->hdmiphy_port->dev);
 	put_device(&hdata->ddc_adpt->dev);
-- 
1.9.3
