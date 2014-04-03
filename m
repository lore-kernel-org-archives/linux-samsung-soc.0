From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 1/7] drm/exynos: Don't reset hdmiphy on hdmi off
Date: Thu, 03 Apr 2014 20:40:58 +0530
Message-ID: <1396537864-29291-2-git-send-email-rahul.sharma@samsung.com>
References: <1396537864-29291-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37028 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752283AbaDCPMM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Apr 2014 11:12:12 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N3G00E0CNKAHPD0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Apr 2014 00:12:10 +0900 (KST)
In-reply-to: <1396537864-29291-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, joshi@samsung.com, Sean Paul <seanpaul@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>

From: Sean Paul <seanpaul@chromium.org>

This patch removes the hdmiphy reset in hdmi_poweroff. The hdmiphy reset
was added to take advantage of exynos clockgating, doing it would gate
the entire TV domain. Unfortunately, mixer is included in the TV domain
and its vsync interrupts are stopped when TV is gated.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index f3189af..79f98ac 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2056,11 +2056,6 @@ static void hdmi_poweroff(struct exynos_drm_display *display)
 		goto out;
 	mutex_unlock(&hdata->hdmi_mutex);
 
-	/*
-	 * The TV power domain needs any condition of hdmiphy to turn off and
-	 * its reset state seems to meet the condition.
-	 */
-	hdmiphy_conf_reset(hdata);
 	hdmiphy_poweroff(hdata);
 
 	clk_disable_unprepare(res->sclk_hdmi);
-- 
1.7.9.5
