From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH] clk: samsung: exynos3250: fix mout_cam_blk parent list
Date: Sat, 06 Sep 2014 18:33:33 +0530
Message-ID: <1410008613-20861-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53461 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750913AbaIFNH5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 6 Sep 2014 09:07:57 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

As per user manual of Exynos3250 SRC_CAM can select
div_cam_blk_320 if it's value is 0xC, so placing
div_cam_blk_320 at proper index in parent list of mout_cam_blk.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 drivers/clk/samsung/clk-exynos3250.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index e1cb464..ba8f073f 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -248,6 +248,7 @@ PNAME(group_sclk_cam_blk_p)	= { "xxti", "xusbxti",
 				    "none", "none", "none",
 				    "none", "div_mpll_pre",
 				    "mout_epll_user", "mout_vpll",
+				    "none", "none", "none",
 				    "div_cam_blk_320", };
 PNAME(group_sclk_fimd0_p)	= { "xxti", "xusbxti",
 				    "m_bitclkhsdiv4_2l", "none",
-- 
1.7.9.5
