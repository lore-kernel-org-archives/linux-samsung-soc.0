From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [RFC 4/4] drm: exynos: add MDNIE and IELCD to FIMD pp list
Date: Wed, 19 Mar 2014 19:52:55 +0530
Message-ID: <1395238975-24600-5-git-send-email-ajaykumar.rs@samsung.com>
References: <1395238975-24600-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64770 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965309AbaCSOWp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Mar 2014 10:22:45 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N2O00B2ST9W1O50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Mar 2014 23:22:45 +0900 (KST)
In-reply-to: <1395238975-24600-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, marcheu@chromium.org, Ajay Kumar <ajaykumar.rs@samsung.com>, Shirish S <s.shirish@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>

This patch adds code to add MDNIE and IELCD onto the
list of FIMD PP.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Signed-off-by: Shirish S <s.shirish@samsung.com>
Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 17 +++++++++++++++++
 drivers/gpu/drm/exynos/exynos_fimd_pp.h  |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index a584d8e..d5a32fb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -160,8 +160,25 @@ static int fimd_mgr_initialize(struct exynos_drm_manager *mgr,
 {
 	struct fimd_context *ctx = mgr->ctx;
 	struct exynos_drm_private *priv;
+	struct exynos_fimd_pp *mdnie_pp = NULL, *ielcd_pp = NULL;
+	int ret;
+
 	priv = drm_dev->dev_private;
 
+	ret = exynos_mdnie_init(ctx->dev, &mdnie_pp);
+	if (!ret && mdnie_pp) {
+		ret = exynos_ielcd_init(ctx->dev, &ielcd_pp);
+		if (!ret && ielcd_pp) {
+			fimd_add_pp_to_list(ctx, mdnie_pp);
+			fimd_add_pp_to_list(ctx, ielcd_pp);
+			ctx->enable_pp = true;
+			ctx->pp_running = false;
+		} else {
+			DRM_INFO("No ielcd node present, "
+					"MDNIE feature will be disabled\n");
+		}
+	}
+
 	mgr->drm_dev = ctx->drm_dev = drm_dev;
 	mgr->pipe = ctx->pipe = priv->pipe++;
 
diff --git a/drivers/gpu/drm/exynos/exynos_fimd_pp.h b/drivers/gpu/drm/exynos/exynos_fimd_pp.h
index 528d3cb..b980742 100644
--- a/drivers/gpu/drm/exynos/exynos_fimd_pp.h
+++ b/drivers/gpu/drm/exynos/exynos_fimd_pp.h
@@ -49,4 +49,6 @@ struct exynos_fimd_pp {
 	void *ctx;
 };
 
+extern int exynos_mdnie_init(struct device *dev, struct exynos_fimd_pp **pp);
+extern int exynos_ielcd_init(struct device *dev, struct exynos_fimd_pp **pp);
 #endif
-- 
1.8.1.2
