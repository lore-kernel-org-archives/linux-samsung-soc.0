From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH] drm/exynos: Avoid NULL pointer dereference in resume if bind failed
Date: Sun, 27 Sep 2015 17:11:46 +0100
Message-ID: <1443370306-15429-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:51463 "EHLO
	mx0a-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751124AbbI0QfW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Sep 2015 12:35:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jingoohan1@gmail.com, inki.dae@samsung.com
Cc: jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

If binding failed calling exynos_dp_enable in exynos_dp_resume will
result in several NULL pointer dereferences. It is much better to
simply skip suspend/resume handling if bind has failed, do so by
checking if a drm_dev exists.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index d66ade0..48baf07 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1388,6 +1388,9 @@ static int exynos_dp_suspend(struct device *dev)
 {
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
 
+	if (!dp->drm_dev)
+		return 0;
+
 	exynos_dp_disable(&dp->encoder);
 	return 0;
 }
@@ -1396,6 +1399,9 @@ static int exynos_dp_resume(struct device *dev)
 {
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
 
+	if (!dp->drm_dev)
+		return 0;
+
 	exynos_dp_enable(&dp->encoder);
 	return 0;
 }
-- 
1.7.2.5
