From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2] clk: samsung: clk-exynos-audss: Fix module autoload
Date: Sun, 16 Oct 2016 10:45:07 -0300
Message-ID: <1476625507-21377-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:32787
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754862AbcJPNpi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Oct 2016 09:45:38 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org

If the driver is built as a module, autoload won't work because the module
alias information is not filled. So user-space can't match the registered
device with the corresponding module.

Export the module alias information using the MODULE_DEVICE_TABLE() macro.

Before this patch:

$ modinfo drivers/clk/samsung/clk-exynos-audss.ko | grep alias
alias:          platform:exynos-audss-clk

After this patch:

$ modinfo drivers/clk/samsung/clk-exynos-audss.ko | grep alias
alias:          platform:exynos-audss-clk
alias:          of:N*T*Csamsung,exynos5420-audss-clockC*
alias:          of:N*T*Csamsung,exynos5420-audss-clock
alias:          of:N*T*Csamsung,exynos5410-audss-clockC*
alias:          of:N*T*Csamsung,exynos5410-audss-clock
alias:          of:N*T*Csamsung,exynos5250-audss-clockC*
alias:          of:N*T*Csamsung,exynos5250-audss-clock
alias:          of:N*T*Csamsung,exynos4210-audss-clockC*
alias:          of:N*T*Csamsung,exynos4210-audss-clock

Fixes: 4d252fd5719b ("clk: samsung: Allow modular build of the Audio Subsystem CLKCON driver")
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes in v2:
- Add fixes tag. Suggested by Krzysztof Kozlowski.
- Add Krzysztof Kozlowski's Reviewed-by and Tested-by tags.

 drivers/clk/samsung/clk-exynos-audss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index 51d152f735cc..17e68a724945 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -106,6 +106,7 @@ static const struct of_device_id exynos_audss_clk_of_match[] = {
 	},
 	{ },
 };
+MODULE_DEVICE_TABLE(of, exynos_audss_clk_of_match);
 
 static void exynos_audss_clk_teardown(void)
 {
-- 
2.7.4
