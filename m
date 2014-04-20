From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 1/3] drm/exynos: remove unnecessary read for phy
 configuration values
Date: Sun, 20 Apr 2014 15:51:15 +0530
Message-ID: <1397989277-29602-2-git-send-email-rahul.sharma@samsung.com>
References: <1397989277-29602-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26565 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755311AbaDTKWM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Apr 2014 06:22:12 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4B005XORGQJF30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 20 Apr 2014 19:22:02 +0900 (KST)
In-reply-to: <1397989277-29602-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Cleaning up unnecessary i2c read call after hdmiphy configuration.
This check is redundant since check for hdmiphy pll lock status
confirms the correct settings for phy.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |   10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index ef1cdd0..438eeda 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1517,7 +1517,6 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 	const u8 *hdmiphy_data;
 	u8 buffer[32];
 	u8 operation[2];
-	u8 read_buffer[32] = {0, };
 	int ret;
 	int i;
 
@@ -1557,15 +1556,6 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 		return;
 	}
 
-	ret = i2c_master_recv(hdata->hdmiphy_port, read_buffer, 32);
-	if (ret < 0) {
-		DRM_ERROR("failed to read hdmiphy config\n");
-		return;
-	}
-
-	for (i = 0; i < ret; i++)
-		DRM_DEBUG_KMS("hdmiphy[0x%02x] write[0x%02x] - "
-			"recv [0x%02x]\n", i, buffer[i], read_buffer[i]);
 }
 
 static void hdmi_conf_apply(struct hdmi_context *hdata)
-- 
1.7.9.5
