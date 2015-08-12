From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH RESEND] clk: s5pv210: add missing call to
 samsung_clk_of_add_provider()
Date: Wed, 12 Aug 2015 10:58:22 +0200
Message-ID: <1439369908-17665-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Mike Turquette <mturquette@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Commit d5e136a21b2028fb1f45143ea7112d5869bfc6c7 ("clk: samsung: Register
clk provider only after registering its all clocks", merged to v3.17-rc1)
modified a way that driver registers registers to core framework. This
change has not been applied to s5pv210 clocks driver, which has been
merged in parallel to that commit. This patch adds a missing call to
samsung_clk_of_add_provider(), so the driver is operational again.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
CC: stable@vger.kernel.org  # v3.17+
---
 drivers/clk/samsung/clk-s5pv210.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-s5pv210.c b/drivers/clk/samsung/clk-s5pv210.c
index d270a20..f41b017 100644
--- a/drivers/clk/samsung/clk-s5pv210.c
+++ b/drivers/clk/samsung/clk-s5pv210.c
@@ -828,6 +828,8 @@ static void __init __s5pv210_clk_init(struct device_node *np,
 
 	s5pv210_clk_sleep_init();
 
+	samsung_clk_of_add_provider(np, ctx);
+
 	pr_info("%s clocks: mout_apll = %ld, mout_mpll = %ld\n"
 		"\tmout_epll = %ld, mout_vpll = %ld\n",
 		is_s5p6442 ? "S5P6442" : "S5PV210",
-- 
1.9.2
