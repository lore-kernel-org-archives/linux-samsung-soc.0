From: Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/3] clk: exynos5420: Add IDs for clocks used in PD mfc
Date: Mon, 26 May 2014 17:26:23 +0530
Message-ID: <1401105384-8678-3-git-send-email-shaik.ameer@samsung.com>
References: <1401105384-8678-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1401105384-8678-1-git-send-email-shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, prathyush.k-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, arunkk.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Adds IDs for MUX clocks to be used by power domain for MFC
for doing re-parenting while pd on/off.

Signed-off-by: Arun Kumar K <arun.kk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/clk/samsung/clk-exynos5420.c   |    6 ++++--
 include/dt-bindings/clock/exynos5420.h |    2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 9d7d7ee..f74f882f 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -631,7 +631,8 @@ static struct samsung_mux_clock exynos5x_mux_clks[] __initdata = {
 			SRC_TOP4, 16, 1),
 	MUX(0, "mout_user_aclk266", mout_user_aclk266_p, SRC_TOP4, 20, 1),
 	MUX(0, "mout_user_aclk166", mout_user_aclk166_p, SRC_TOP4, 24, 1),
-	MUX(0, "mout_user_aclk333", mout_user_aclk333_p, SRC_TOP4, 28, 1),
+	MUX(CLK_MOUT_USER_ACLK333, "mout_user_aclk333", mout_user_aclk333_p,
+			SRC_TOP4, 28, 1),
 
 	MUX(0, "mout_user_aclk400_disp1", mout_user_aclk400_disp1_p,
 			SRC_TOP5, 0, 1),
@@ -684,7 +685,8 @@ static struct samsung_mux_clock exynos5x_mux_clks[] __initdata = {
 			SRC_TOP11, 12, 1),
 	MUX(0, "mout_sw_aclk266", mout_sw_aclk266_p, SRC_TOP11, 20, 1),
 	MUX(0, "mout_sw_aclk166", mout_sw_aclk166_p, SRC_TOP11, 24, 1),
-	MUX(0, "mout_sw_aclk333", mout_sw_aclk333_p, SRC_TOP11, 28, 1),
+	MUX(CLK_MOUT_SW_ACLK333, "mout_sw_aclk333", mout_sw_aclk333_p,
+			SRC_TOP11, 28, 1),
 
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
