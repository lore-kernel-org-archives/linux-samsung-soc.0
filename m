From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH] drm/exynos: g2d: add exynos4212 as a compatible device.
Date: Sat, 19 Jul 2014 22:53:03 +0200
Message-ID: <1405803183-6280-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1405803183-6280-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:59068 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752442AbaGSU6m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jul 2014 16:58:42 -0400
In-Reply-To: <1405803183-6280-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, inki.dae@samsung.com, Alban Browaeys <prahal@yahoo.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

From: Alban Browaeys <prahal@yahoo.com>

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 8001587..5fa1bb6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1544,6 +1544,7 @@ static const struct dev_pm_ops g2d_pm_ops = {
 
 static const struct of_device_id exynos_g2d_match[] = {
 	{ .compatible = "samsung,exynos5250-g2d" },
+	{ .compatible = "samsung,exynos4212-g2d" },
 	{},
 };
 
-- 
1.8.5.5
