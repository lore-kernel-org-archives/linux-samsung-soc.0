From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] clk: exynos5250: Fix divider values for sclk_mmc{0,1,2,3}
Date: Tue,  2 Apr 2013 13:50:40 +0530
Message-ID: <1364890840-20052-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:54660 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760231Ab3DBIcT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 04:32:19 -0400
Received: by mail-pb0-f49.google.com with SMTP id um15so116476pbc.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Apr 2013 01:32:19 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, patches@linaro.org, Thomas Abraham <thomas.abraham@linaro.org>

In legacy setup, sclk_mmc{0,1,2,3} used PRE_RATIO bit-field (8-bit wide)
instead of RATIO bit-field (4-bit wide) for dividing clock rate.

With current common clock setup, we are using RATIO bit-field which
is creating FIFO read errors while accessing eMMC. Changing over to
use PRE_RATIO bit-field fixes this issue.

dwmmc_exynos 12200000.dwmmc0: data FIFO error (status=00008020)
mmcblk0: error -5 transferring data, sector 1, nr 7, cmd response 0x900, card status 0x0
end_request: I/O error, dev mmcblk0, sector 1

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
CC: Thomas Abraham <thomas.abraham@linaro.org>
---

Based on Kukjin's for-next branch.
commit d58f6a153f40 ("Merge branch 'next/clk-exynos-2' into for-next")

 drivers/clk/samsung/clk-exynos5250.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 1152125..2c46fbd 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -274,10 +274,10 @@ struct samsung_div_clock exynos5250_div_clks[] __initdata = {
 	DIV(none, "div_pcm0", "sclk_audio0", DIV_MAU, 4, 8),
 	DIV(none, "div_sata", "mout_sata", DIV_FSYS0, 20, 4),
 	DIV(none, "div_usb3", "mout_usb3", DIV_FSYS0, 24, 4),
-	DIV(none, "div_mmc0", "mout_mmc0", DIV_FSYS1, 0, 4),
-	DIV(none, "div_mmc1", "mout_mmc1", DIV_FSYS1, 16, 4),
-	DIV(none, "div_mmc2", "mout_mmc2", DIV_FSYS2, 0, 4),
-	DIV(none, "div_mmc3", "mout_mmc3", DIV_FSYS2, 16, 4),
+	DIV(none, "div_mmc0", "mout_mmc0", DIV_FSYS1, 8, 8),
+	DIV(none, "div_mmc1", "mout_mmc1", DIV_FSYS1, 24, 8),
+	DIV(none, "div_mmc2", "mout_mmc2", DIV_FSYS2, 8, 8),
+	DIV(none, "div_mmc3", "mout_mmc3", DIV_FSYS2, 24, 8),
 	DIV(none, "div_uart0", "mout_uart0", DIV_PERIC0, 0, 4),
 	DIV(none, "div_uart1", "mout_uart1", DIV_PERIC0, 4, 4),
 	DIV(none, "div_uart2", "mout_uart2", DIV_PERIC0, 8, 4),
-- 
1.7.9.5
