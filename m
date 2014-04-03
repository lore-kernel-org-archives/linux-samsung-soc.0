From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 4/7] drm/exynos: hdmi: remove unnecessary memset
Date: Thu, 03 Apr 2014 20:41:01 +0530
Message-ID: <1396537864-29291-5-git-send-email-rahul.sharma@samsung.com>
References: <1396537864-29291-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56595 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752525AbaDCPMQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Apr 2014 11:12:16 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N3G00JJ7NKER1D0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Apr 2014 00:12:14 +0900 (KST)
In-reply-to: <1396537864-29291-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, joshi@samsung.com, Daniel Kurtz <djkurtz@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>

From: Daniel Kurtz <djkurtz@chromium.org>

Our resources were just zalloc'ed as part of hdata.
They are already 0.

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 5ed8973..539e603 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2151,8 +2151,6 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 
 	DRM_DEBUG_KMS("HDMI resource init\n");
 
-	memset(res, 0, sizeof(*res));
-
 	/* get clocks, power */
 	res->hdmi = devm_clk_get(dev, "hdmi");
 	if (IS_ERR(res->hdmi)) {
-- 
1.7.9.5
