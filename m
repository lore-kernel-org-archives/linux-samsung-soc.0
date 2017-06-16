From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH] drm: exynos: dsi: fix to return -ENODEV when DSI_PORT_OUT is not found
Date: Fri, 16 Jun 2017 16:56:59 -0600
Message-ID: <20170616225659.23569-1-shuahkh@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:37199
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750873AbdFPW5F (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 18:57:05 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Fix exynos_dsi_parse_dt() to return -ENODEV when of_graph_get_remote_node()
doesn't find DSI_PORT_OUT. -ENODEV is the correct error code to return and
this change makes exynos behavior consistent with rest of the drm drivers.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e337cd2..cb99e82 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1652,7 +1652,7 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 
 	dsi->bridge_node = of_graph_get_remote_node(node, DSI_PORT_OUT, 0);
 	if (!dsi->bridge_node)
-		return -EINVAL;
+		return -ENODEV;
 
 	return 0;
 }
-- 
2.7.4
