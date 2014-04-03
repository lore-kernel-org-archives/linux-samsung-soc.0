From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 3/7] drm/exynos: check for null pointers in error handling
Date: Thu, 03 Apr 2014 20:41:00 +0530
Message-ID: <1396537864-29291-4-git-send-email-rahul.sharma@samsung.com>
References: <1396537864-29291-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10241 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752407AbaDCPMN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Apr 2014 11:12:13 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N3G00H2TNKCPZB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Apr 2014 00:12:12 +0900 (KST)
In-reply-to: <1396537864-29291-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, joshi@samsung.com, Paul Taysom <taysom@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>

From: Paul Taysom <taysom@chromium.org>

Smatch error from arm build: drivers/gpu/drm/exynos/
exynos_hdmi.c:2374 hdmi_probe() error: potential NULL
dereference 'hdata->hdmiphy_port'.

Added check for hdata->hdmiphy_port that it is not NULL.

Signed-off-by: Paul Taysom <taysom@chromium.org>
Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index f6d4435..5ed8973 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2356,7 +2356,8 @@ static int hdmi_probe(struct platform_device *pdev)
 	return 0;
 
 err_hdmiphy:
-	put_device(&hdata->hdmiphy_port->dev);
+	if (hdata->hdmiphy_port)
+		put_device(&hdata->hdmiphy_port->dev);
 err_ddc:
 	put_device(&hdata->ddc_adpt->dev);
 	return ret;
-- 
1.7.9.5
