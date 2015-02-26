From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] phy: exynos-mipi-video: Fixup the test for state->regmap
Date: Thu, 26 Feb 2015 11:48:08 +0800
Message-ID: <1424922488.2076.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:38075 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752401AbbBZDsO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Feb 2015 22:48:14 -0500
Received: by pdbfp1 with SMTP id fp1so9817878pdb.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Feb 2015 19:48:13 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

syscon_regmap_lookup_by_phandle() returns ERR_PTR on error.
Thus don't use null test against state->regmap.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/phy/phy-exynos-mipi-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-exynos-mipi-video.c b/drivers/phy/phy-exynos-mipi-video.c
index f017b2f..d196493 100644
--- a/drivers/phy/phy-exynos-mipi-video.c
+++ b/drivers/phy/phy-exynos-mipi-video.c
@@ -59,7 +59,7 @@ static int __set_phy_state(struct exynos_mipi_video_phy *state,
 	else
 		reset = EXYNOS4_MIPI_PHY_SRESETN;
 
-	if (state->regmap) {
+	if (!IS_ERR(state->regmap)) {
 		mutex_lock(&state->mutex);
 		regmap_read(state->regmap, offset, &val);
 		if (on)
-- 
1.9.1
