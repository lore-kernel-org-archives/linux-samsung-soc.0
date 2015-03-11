From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] phy: exynos-mipi-video: Fix unbalanced lock on non-regmap
 path
Date: Wed, 11 Mar 2015 08:06:23 +0800
Message-ID: <1426032383.5707.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:41423 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750919AbbCKAG2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Mar 2015 20:06:28 -0400
Received: by pdjy10 with SMTP id y10so6228133pdj.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Mar 2015 17:06:28 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Remove the second lock on non-regmap path.

Fixes: 278270e39efa (phy: exynos-mipi-video: Use spin_lock to protct state->regmap rmw operations)
Reported-by: Julia Lawall <Julia.Lawall@lip6.fr>
Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/phy/phy-exynos-mipi-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/phy-exynos-mipi-video.c b/drivers/phy/phy-exynos-mipi-video.c
index 8d6d117..df7519a 100644
--- a/drivers/phy/phy-exynos-mipi-video.c
+++ b/drivers/phy/phy-exynos-mipi-video.c
@@ -75,7 +75,6 @@ static int __set_phy_state(struct exynos_mipi_video_phy *state,
 	} else {
 		addr = state->regs + EXYNOS_MIPI_PHY_CONTROL(id / 2);
 
-		spin_lock(&state->slock);
 		val = readl(addr);
 		if (on)
 			val |= reset;
-- 
1.9.1
