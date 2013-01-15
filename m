From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 3/4] drm/exynos: mixer: set correct mode for range of
 resolutions
Date: Tue, 15 Jan 2013 08:11:07 -0500
Message-ID: <1358255468-14287-4-git-send-email-rahul.sharma@samsung.com>
References: <1358255468-14287-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52216 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751016Ab3AOMw2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jan 2013 07:52:28 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGO001XD3RDBG10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Jan 2013 21:52:27 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGO00A5V3M1A810@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Jan 2013 21:52:27 +0900 (KST)
In-reply-to: <1358255468-14287-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com

With this patch, mixer driver find the correct resolution mode for
the range of resolutions, upto 1080 vertical lines. Resolution will
be categorized to NTSC SD, PAL SD or HD and the correct mode is
set to the mixer configuration register.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index e569395..b0e82b8 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -284,13 +284,13 @@ static void mixer_cfg_scan(struct mixer_context *ctx, unsigned int height)
 				MXR_CFG_SCAN_PROGRASSIVE);
 
 	/* choosing between porper HD and SD mode */
-	if (height == 480)
+	if (height <= 480)
 		val |= MXR_CFG_SCAN_NTSC | MXR_CFG_SCAN_SD;
-	else if (height == 576)
+	else if (height <= 576)
 		val |= MXR_CFG_SCAN_PAL | MXR_CFG_SCAN_SD;
-	else if (height == 720)
+	else if (height <= 720)
 		val |= MXR_CFG_SCAN_HD_720 | MXR_CFG_SCAN_HD;
-	else if (height == 1080)
+	else if (height <= 1080)
 		val |= MXR_CFG_SCAN_HD_1080 | MXR_CFG_SCAN_HD;
 	else
 		val |= MXR_CFG_SCAN_HD_720 | MXR_CFG_SCAN_HD;
-- 
1.8.0
