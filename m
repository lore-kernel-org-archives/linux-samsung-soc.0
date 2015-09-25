From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 10/16] drm/exynos/hdmi: simplify clock re-parenting
Date: Fri, 25 Sep 2015 14:48:23 +0200
Message-ID: <1443185309-13827-11-git-send-email-a.hajda@samsung.com>
References: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:41335 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932234AbbIYMtJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Sep 2015 08:49:09 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NV80092LGXQIY20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Sep 2015 13:49:02 +0100 (BST)
In-reply-to: <1443185309-13827-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Driver tries to disable sclk_hdmi during re-parenting, to avoid possible
glitches. It is ineffective as the clock is used also by other devices (mixer).
Anyway driver works without disabling sclk_hdmi.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 583dd5e..475341f 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1569,9 +1569,7 @@ static void hdmi_mode_apply(struct hdmi_context *hdata)
 
 	hdmiphy_wait_for_pll(hdata);
 
-	clk_disable_unprepare(hdata->res.sclk_hdmi);
 	clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_hdmiphy);
-	clk_prepare_enable(hdata->res.sclk_hdmi);
 
 	/* enable HDMI and timing generator */
 	hdmi_start(hdata, true);
@@ -1579,9 +1577,7 @@ static void hdmi_mode_apply(struct hdmi_context *hdata)
 
 static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 {
-	clk_disable_unprepare(hdata->res.sclk_hdmi);
 	clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_pixel);
-	clk_prepare_enable(hdata->res.sclk_hdmi);
 
 	/* reset hdmiphy */
 	hdmi_reg_writemask(hdata, HDMI_PHY_RSTOUT, ~0, HDMI_PHY_SW_RSTOUT);
-- 
1.9.1
