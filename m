From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH] clk: samsung: Fix PLL35XX lock time
Date: Tue,  8 Oct 2013 12:26:39 +0530
Message-ID: <1381215399-25394-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:34976 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751591Ab3JHG4F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Oct 2013 02:56:05 -0400
Received: by mail-pb0-f52.google.com with SMTP id wz12so8225728pbc.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Oct 2013 23:56:03 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, dianders@chromium.org, yadi.brar@samsung.com, arunkk.samsung@gmail.com

PLL35XX lock factor is 250 as per the manual whereas its
wrongly set as 270 now.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 drivers/clk/samsung/clk-pll.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 529e11d..ad84be0 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -61,8 +61,8 @@ static long samsung_pll_round_rate(struct clk_hw *hw,
 /*
  * PLL35xx Clock Type
  */
-/* Maximum lock time can be 270 * PDIV cycles */
-#define PLL35XX_LOCK_FACTOR	(270)
+/* Maximum lock time can be 250 * PDIV cycles */
+#define PLL35XX_LOCK_FACTOR	(250)
 
 #define PLL35XX_MDIV_MASK       (0x3FF)
 #define PLL35XX_PDIV_MASK       (0x3F)
-- 
1.7.9.5
