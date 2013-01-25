From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/2] drm/exynos: add support for dt based search to exynos4
 mixer
Date: Fri, 25 Jan 2013 05:55:46 -0500
Message-ID: <1359111346-12908-3-git-send-email-rahul.sharma@samsung.com>
References: <1359111346-12908-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15095 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753619Ab3AYKeU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 05:34:20 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH6009FOG0W12U0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jan 2013 19:34:19 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MH600I57G0W88B0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jan 2013 19:34:19 +0900 (KST)
In-reply-to: <1359111346-12908-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index c414584..67f50b5 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1131,6 +1131,9 @@ static struct of_device_id mixer_match_types[] = {
 		.compatible = "samsung,exynos5-mixer",
 		.data	= &exynos5_mxr_drv_data,
 	}, {
+		.compatible = "samsung,exynos4-mixer",
+		.data	= &exynos4_mxr_drv_data,
+	}, {
 		/* end node */
 	}
 };
-- 
1.8.0
