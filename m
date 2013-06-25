From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] Documentation: exynos5250-clock: Add div_i2s1 and div_i2s2
Date: Tue, 25 Jun 2013 15:45:59 +0530
Message-ID: <1372155359-20412-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, mturquette@linaro.org, padma.v@samsung.com, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

commit 79d743c177f9 ("clk: exynos5250: Add enum entries for divider
clock of i2s1 and i2s2") added two new clock entries. Add the clock
entry enum numbers to documentation.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 .../devicetree/bindings/clock/exynos5250-clock.txt |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
index b3700cf..b0ed429 100644
--- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
@@ -59,6 +59,8 @@ clock which they consume.
   sclk_spi0		154
   sclk_spi1		155
   sclk_spi2		156
+  div_i2s1		157
+  div_i2s2		158
 
 
    [Peripheral Clock Gates]
-- 
1.7.9.5

