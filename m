From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 2/2] drm/exynos: dp: fix wrong return type
Date: Wed, 02 Dec 2015 20:57:52 +0900
Message-ID: <1449057472-4389-2-git-send-email-inki.dae@samsung.com>
References: <1449057472-4389-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49895 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757998AbbLBL54 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Dec 2015 06:57:56 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NYQ02Y0QBWIUIE0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Dec 2015 20:57:54 +0900 (KST)
In-reply-to: <1449057472-4389-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, javier@osg.samsung.com, Inki Dae <inki.dae@samsung.com>

This patch fixes wrong return type when dt binding of bridge device
failed.

If a board has a bridge device then of_graph_get_remote_port_parent
function shouldn't be NULL. So this patch will return a proper error
type so that the deferred probe isn't triggered.

Changelog v2:
- return -EINVAL if getting a port node failed.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 0b53045..c77fb83 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1436,8 +1436,10 @@ static int exynos_dp_probe(struct platform_device *pdev)
 			of_node_put(bridge_node);
 			if (!dp->ptn_bridge)
 				return -EPROBE_DEFER;
-		} else
-			return -EPROBE_DEFER;
+		} else {
+			DRM_ERROR("no port node for bridge device.\n");
+			return -EINVAL;
+		}
 	}
 
 	pm_runtime_enable(dev);
-- 
1.9.1
