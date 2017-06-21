From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] clk: samsung: audss: Fix silent hang on Exynos4412 due to disabled EPLL
Date: Wed, 21 Jun 2017 21:08:06 +0200
Message-ID: <20170621190807.14850-2-krzk@kernel.org>
References: <20170621190807.14850-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170621190807.14850-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Similarly to commit f1e9203e2366 ("clk: samsung: Fix Exynos 5420 pinctrl
setup and clock disable failure due to domain being gated") for
Exynos5420, the Exynos4412 also requires that EPLL is not disabled.
Otherwise any access to MAUDIO block will silently halt.

This was not visible before because EPLL on Exynos4 could not be
disabled before commit 6edfa11cb396 ("clk: samsung:
Add enable/disable operation for PLL36XX clocks").  After this commit,
on Odroid U3 board one can see silent hang, usually with last (but
unrelated) messages:

	[    2.382741] input: gpio_keys as /devices/platform/gpio_keys/input/input0
	[    2.405686] usb 1-3: new high-speed USB device number 3 using exynos-ehci
	[    2.419843] max77686-rtc max77686-rtc: setting system clock to 2017-06-21 17:04:13 UTC (1498064653)

Mark Exynos4 variant as also needed EPLL to be enabled all the time.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/samsung/clk-exynos-audss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index 85edeb738853..1fab56f396d4 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -73,6 +73,7 @@ struct exynos_audss_clk_drvdata {
 
 static const struct exynos_audss_clk_drvdata exynos4210_drvdata = {
 	.num_clks	= EXYNOS_AUDSS_MAX_CLKS - 1,
+	.enable_epll	= 1,
 };
 
 static const struct exynos_audss_clk_drvdata exynos5410_drvdata = {
-- 
2.9.3
