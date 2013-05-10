From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] clk: samsung: Add CLK_IGNORE_UNUSED flag for the sysreg clocks
Date: Fri, 10 May 2013 18:38:09 +0200
Message-ID: <1368203889-12547-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64355 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754157Ab3EJQig (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 May 2013 12:38:36 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: mturquette@linaro.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Currently no driver *) handles the sysreg clock, with an assumption
that this clock is always left in its default state (enabled).

Before commit 6e6aac7590f902d14d90bace3fd499
ARM: EXYNOS: Migrate clock support to common clock framework

the sysreg clock was not even defined and hence wasn't handled
explicitly in the kernel.

To restore the previous behaviour disable masking the sysreg clock
off in the clock core by default.

*) Except the Exynos4x12 FIMC-IS driver, which will be modified
   to not touch the sysreg clock.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 070bbeb..0f2f5e5 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -797,7 +797,8 @@ struct samsung_gate_clock exynos4210_gate_clks[] __initdata = {
 	GATE(smmu_pcie, "smmu_pcie", "aclk133", GATE_IP_FSYS, 18, 0, 0),
 	GATE(modemif, "modemif", "aclk100", GATE_IP_PERIL, 28, 0, 0),
 	GATE(chipid, "chipid", "aclk100", E4210_GATE_IP_PERIR, 0, 0, 0),
-	GATE(sysreg, "sysreg", "aclk100", E4210_GATE_IP_PERIR, 0, 0, 0),
+	GATE(sysreg, "sysreg", "aclk100", E4210_GATE_IP_PERIR, 0,
+			CLK_IGNORE_UNUSED, 0),
 	GATE(hdmi_cec, "hdmi_cec", "aclk100", E4210_GATE_IP_PERIR, 11, 0, 0),
 	GATE(smmu_rotator, "smmu_rotator", "aclk200",
 			E4210_GATE_IP_IMAGE, 4, 0, 0),
@@ -826,7 +827,8 @@ struct samsung_gate_clock exynos4x12_gate_clks[] __initdata = {
 	GATE(smmu_mdma, "smmu_mdma", "aclk200", E4X12_GATE_IP_IMAGE, 5, 0, 0),
 	GATE(mipi_hsi, "mipi_hsi", "aclk133", GATE_IP_FSYS, 10, 0, 0),
 	GATE(chipid, "chipid", "aclk100", E4X12_GATE_IP_PERIR, 0, 0, 0),
-	GATE(sysreg, "sysreg", "aclk100", E4X12_GATE_IP_PERIR, 1, 0, 0),
+	GATE(sysreg, "sysreg", "aclk100", E4X12_GATE_IP_PERIR, 1,
+			CLK_IGNORE_UNUSED, 0),
 	GATE(hdmi_cec, "hdmi_cec", "aclk100", E4X12_GATE_IP_PERIR, 11, 0, 0),
 	GATE(sclk_mdnie0, "sclk_mdnie0", "div_mdnie0",
 			SRC_MASK_LCD0, 4, CLK_SET_RATE_PARENT, 0),
--
1.7.9.5
