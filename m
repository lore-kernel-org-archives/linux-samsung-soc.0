From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH] ARM: Exynos4: Turn off clocks for NAND, OneNAND and TSI controllers
Date: Fri, 24 Aug 2012 20:22:16 +0530
Message-ID: <1345819936-6503-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:58401 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753375Ab2HXOw2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Aug 2012 10:52:28 -0400
Received: by pbbrr13 with SMTP id rr13so3608940pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Aug 2012 07:52:27 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

The clocks for NAND, OneNAND and Transport Stream Interface(TSI)
controllers could be either enabled or disabled at boot. To ensure
that these are turned off until used, add them to the list of clocks
to be turned off during boot.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
---
 arch/arm/mach-exynos/clock-exynos4.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-exynos/clock-exynos4.c
index 2f51293..7cc5491 100644
--- a/arch/arm/mach-exynos/clock-exynos4.c
+++ b/arch/arm/mach-exynos/clock-exynos4.c
@@ -501,6 +501,10 @@ static struct clk exynos4_init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_cam_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
+		.name		= "tsi",
+		.enable		= exynos4_clk_ip_fsys_ctrl,
+		.ctrlbit	= (1 << 4),
+	}, {
 		.name		= "hsmmc",
 		.devname	= "exynos4-sdhci.0",
 		.parent		= &exynos4_clk_aclk_133.clk,
@@ -530,6 +534,14 @@ static struct clk exynos4_init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 9),
 	}, {
+		.name		= "onenand",
+		.enable		= exynos4_clk_ip_fsys_ctrl,
+		.ctrlbit	= (1 << 15),
+	}, {
+		.name		= "nfcon",
+		.enable		= exynos4_clk_ip_fsys_ctrl,
+		.ctrlbit	= (1 << 16),
+	}, {
 		.name		= "dac",
 		.devname	= "s5p-sdo",
 		.enable		= exynos4_clk_ip_tv_ctrl,
-- 
1.7.9.5
