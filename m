From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v3 5/5] clk: samsung: exynos7: add gate clock for ADC block
Date: Tue, 28 Oct 2014 16:48:55 +0530
Message-ID: <1414495135-25588-6-git-send-email-a.kesavan@samsung.com>
References: <1414495135-25588-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10223 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757145AbaJ1LWF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Oct 2014 07:22:05 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NE500AN5JKSS650@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Oct 2014 20:22:04 +0900 (KST)
In-reply-to: <1414495135-25588-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, s.nawrocki@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com

Add clock support for the ADC interface in Exynos7.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c       |    2 ++
 include/dt-bindings/clock/exynos7-clk.h |    3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 17e5cf4..ea4483b 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -486,6 +486,8 @@ static struct samsung_gate_clock peric0_gate_clks[] __initdata = {
 		ENABLE_PCLK_PERIC0, 14, 0, 0),
 	GATE(PCLK_UART0, "pclk_uart0", "mout_aclk_peric0_66_user",
 		ENABLE_PCLK_PERIC0, 16, 0, 0),
+	GATE(PCLK_ADCIF, "pclk_adcif", "mout_aclk_peric0_66_user",
+		ENABLE_PCLK_PERIC0, 20, 0, 0),
 	GATE(PCLK_PWM, "pclk_pwm", "mout_aclk_peric0_66_user",
 		ENABLE_PCLK_PERIC0, 21, 0, 0),
 
diff --git a/include/dt-bindings/clock/exynos7-clk.h b/include/dt-bindings/clock/exynos7-clk.h
index f255bb7..8e4681b0 100644
--- a/include/dt-bindings/clock/exynos7-clk.h
+++ b/include/dt-bindings/clock/exynos7-clk.h
@@ -55,7 +55,8 @@
 #define PCLK_HSI2C11			9
 #define PCLK_PWM			10
 #define SCLK_PWM			11
-#define PERIC0_NR_CLK			12
+#define PCLK_ADCIF			12
+#define PERIC0_NR_CLK			13
 
 /* PERIC1 */
 #define PCLK_UART1			1
-- 
1.7.9.5
