From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 3/5] drm/exynos: remove unnecessary read for phy configuration
 values
Date: Wed, 02 Apr 2014 22:43:44 +0530
Message-ID: <1396458826-3051-4-git-send-email-rahul.sharma@samsung.com>
References: <1396458826-3051-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34097 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932383AbaDBRO3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Apr 2014 13:14:29 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N3E005UMYK4OF90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Apr 2014 02:14:28 +0900 (KST)
In-reply-to: <1396458826-3051-1-git-send-email-rahul.sharma@samsung.com>
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
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |   10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 47b8c06..5b2cfe7 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1518,7 +1518,6 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 	const u8 *hdmiphy_data;
 	u8 buffer[32];
 	u8 operation[2];
-	u8 read_buffer[32] = {0, };
 	int ret;
 	int i;
 
@@ -1558,15 +1557,6 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
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
