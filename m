From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH 5/6] clk: exynos-audss: add support for Exynos 5420
Date: Fri, 20 Sep 2013 14:13:56 -0700
Message-ID: <1379711637-5226-5-git-send-email-abrestic@chromium.org>
References: <1379711637-5226-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f74.google.com ([209.85.128.74]:41314 "EHLO
	mail-qe0-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754302Ab3ITVOJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Sep 2013 17:14:09 -0400
Received: by mail-qe0-f74.google.com with SMTP id a11so108745qen.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Sep 2013 14:14:09 -0700 (PDT)
In-Reply-To: <1379711637-5226-1-git-send-email-abrestic@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Jiri Kosina <jkosina@suse.cz>, Rahul Sharma <rahul.sharma@samsung.com>, Leela Krishna Amudala <l.krishna@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Padmavathi Venna <padma.v@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.orglinu

The AudioSS block on Exynos 5420 has an additional clock gate for the
ADMA bus clock.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
 Documentation/devicetree/bindings/clock/clk-exynos-audss.txt | 7 +++++--
 drivers/clk/samsung/clk-exynos-audss.c                       | 8 ++++++++
 include/dt-bindings/clk/exynos-audss-clk.h                   | 3 ++-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt b/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
index d51a2f9..a10c648 100644
--- a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
+++ b/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
@@ -8,8 +8,10 @@ Required Properties:
 
 - compatible: should be one of the following:
   - "samsung,exynos4210-audss-clock" - controller compatible with all Exynos4 SoCs.
-  - "samsung,exynos5250-audss-clock" - controller compatible with all Exynos5 SoCs.
-
+  - "samsung,exynos5250-audss-clock" - controller compatible with Exynos5250
+    SoCs.
+  - "samsung,exynos5420-audss-clock" - controller compatible with Exynos5420
+    SoCs.
 - reg: physical base address and length of the controller's register set.
 
 - #clock-cells: should be 1.
@@ -51,6 +53,7 @@ i2s_bus         6
 sclk_i2s        7
 pcm_bus         8
 sclk_pcm        9
+adma            10      Exynos5420
 
 Example 1: An example of a clock controller node using the default input
 	   clock names is listed below.
diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index aac5342..07c8dbd 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -145,6 +145,13 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 				sclk_pcm_p, CLK_SET_RATE_PARENT,
 				reg_base + ASS_CLK_GATE, 5, 0, &lock);
 
+	if (of_device_is_compatible(pdev->dev.of_node,
+					"samsung,exynos5420-audss-clock")) {
+		clk_table[EXYNOS_ADMA] = clk_register_gate(NULL, "adma",
+				"dout_srp", CLK_SET_RATE_PARENT,
+				reg_base + ASS_CLK_GATE, 9, 0, &lock);
+	}
+
 #ifdef CONFIG_PM_SLEEP
 	register_syscore_ops(&exynos_audss_clk_syscore_ops);
 #endif
@@ -164,6 +171,7 @@ static int exynos_audss_clk_remove(struct platform_device *pdev)
 static const struct of_device_id exynos_audss_clk_of_match[] = {
 	{ .compatible = "samsung,exynos4210-audss-clock", },
 	{ .compatible = "samsung,exynos5250-audss-clock", },
+	{ .compatible = "samsung,exynos5420-audss-clock", },
 	{},
 };
 
diff --git a/include/dt-bindings/clk/exynos-audss-clk.h b/include/dt-bindings/clk/exynos-audss-clk.h
index 8279f42..0ae6f5a 100644
--- a/include/dt-bindings/clk/exynos-audss-clk.h
+++ b/include/dt-bindings/clk/exynos-audss-clk.h
@@ -19,7 +19,8 @@
 #define EXYNOS_SCLK_I2S	7
 #define EXYNOS_PCM_BUS		8
 #define EXYNOS_SCLK_PCM	9
+#define EXYNOS_ADMA		10
 
-#define EXYNOS_AUDSS_MAX_CLKS	10
+#define EXYNOS_AUDSS_MAX_CLKS	11
 
 #endif
-- 
1.8.4
