From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 2/9] dt-bindings: Add the clock id of UART2 and MMC2 for
 Exynos3250
Date: Thu, 31 Mar 2016 11:47:58 +0900
Message-ID: <1459392485-11327-3-git-send-email-cw00.choi@samsung.com>
References: <1459392485-11327-1-git-send-email-cw00.choi@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1459392485-11327-1-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds the new clock id for both UART2 and MM2 device
for Exynos3250 SoC.

Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 include/dt-bindings/clock/exynos3250.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/exynos3250.h b/include/dt-bindings/clock/exynos3250.h
index 63d01c15d2b3..c796ff02ceeb 100644
--- a/include/dt-bindings/clock/exynos3250.h
+++ b/include/dt-bindings/clock/exynos3250.h
@@ -79,6 +79,8 @@
 #define CLK_MOUT_CORE			58
 #define CLK_MOUT_APLL			59
 #define CLK_MOUT_ACLK_266_SUB		60
+#define CLK_MOUT_UART2			61
+#define CLK_MOUT_MMC2			62
 
 /* Dividers */
 #define CLK_DIV_GPL			64
@@ -127,6 +129,9 @@
 #define CLK_DIV_CORE			107
 #define CLK_DIV_HPM			108
 #define CLK_DIV_COPY			109
+#define CLK_DIV_UART2			110
+#define CLK_DIV_MMC2_PRE		111
+#define CLK_DIV_MMC2			112
 
 /* Gates */
 #define CLK_ASYNC_G3D			128
@@ -223,6 +228,8 @@
 #define CLK_BLOCK_MFC			219
 #define CLK_BLOCK_CAM			220
 #define CLK_SMIES			221
+#define CLK_UART2			222
+#define CLK_SDMMC2			223
 
 /* Special clocks */
 #define CLK_SCLK_JPEG			224
@@ -249,12 +256,14 @@
 #define CLK_SCLK_SPI0			245
 #define CLK_SCLK_UART1			246
 #define CLK_SCLK_UART0			247
+#define CLK_SCLK_UART2			248
+#define CLK_SCLK_MMC2			249
 
 /*
  * Total number of clocks of main CMU.
  * NOTE: Must be equal to last clock ID increased by one.
  */
-#define CLK_NR_CLKS			248
+#define CLK_NR_CLKS			250
 
 /*
  * CMU DMC
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
