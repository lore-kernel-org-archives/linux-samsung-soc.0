From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 2/3] clk: exynos5420: Add IDs for clocks used in PD mfc
Date: Fri, 23 May 2014 10:38:11 +0530
Message-ID: <1400821692-22370-3-git-send-email-arun.kk@samsung.com>
References: <1400821692-22370-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:47567 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750961AbaEWFIa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 01:08:30 -0400
In-Reply-To: <1400821692-22370-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: t.figa@samsung.com, kgene.kim@samsung.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, prathyush.k@samsung.com, abrestic@chromium.org, arunkk.samsung@gmail.com

Adds IDs for MUX clocks to be used by power domain for MFC
for doing re-parenting while pd on/off.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c   |    6 ++++--
 include/dt-bindings/clock/exynos5420.h |    2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 9d7d7ee..c899dbe 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -631,7 +631,8 @@ static struct samsung_mux_clock exynos5x_mux_clks[] __initdata = {
 			SRC_TOP4, 16, 1),
 	MUX(0, "mout_user_aclk266", mout_user_aclk266_p, SRC_TOP4, 20, 1),
 	MUX(0, "mout_user_aclk166", mout_user_aclk166_p, SRC_TOP4, 24, 1),
-	MUX(0, "mout_user_aclk333", mout_user_aclk333_p, SRC_TOP4, 28, 1),
+	MUX(CLK_MOUT_USER_ACLK333, "mout_user_aclk333", mout_user_aclk333_p,
+							SRC_TOP4, 28, 1),
 
 	MUX(0, "mout_user_aclk400_disp1", mout_user_aclk400_disp1_p,
 			SRC_TOP5, 0, 1),
@@ -684,7 +685,8 @@ static struct samsung_mux_clock exynos5x_mux_clks[] __initdata = {
 			SRC_TOP11, 12, 1),
 	MUX(0, "mout_sw_aclk266", mout_sw_aclk266_p, SRC_TOP11, 20, 1),
 	MUX(0, "mout_sw_aclk166", mout_sw_aclk166_p, SRC_TOP11, 24, 1),
-	MUX(0, "mout_sw_aclk333", mout_sw_aclk333_p, SRC_TOP11, 28, 1),
+	MUX(CLK_MOUT_SW_ACLK333, "mout_sw_aclk333", mout_sw_aclk333_p,
+						SRC_TOP11, 28, 1),
 
 	MUX(0, "mout_sw_aclk400_disp1", mout_sw_aclk400_disp1_p,
 			SRC_TOP12, 4, 1),
diff --git a/include/dt-bindings/clock/exynos5420.h b/include/dt-bindings/clock/exynos5420.h
index 97dcb89..3fc08ff 100644
--- a/include/dt-bindings/clock/exynos5420.h
+++ b/include/dt-bindings/clock/exynos5420.h
@@ -203,6 +203,8 @@
 #define CLK_MOUT_G3D		641
 #define CLK_MOUT_VPLL		642
 #define CLK_MOUT_MAUDIO0	643
+#define CLK_MOUT_USER_ACLK333	644
+#define CLK_MOUT_SW_ACLK333	645
 
 /* divider clocks */
 #define CLK_DOUT_PIXEL		768
-- 
1.7.9.5
