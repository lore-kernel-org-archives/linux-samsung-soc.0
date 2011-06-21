From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH v2 2/3] ARM: EXYNOS4: Add sclk_spdif clocks.
Date: Tue, 21 Jun 2011 16:54:22 +0530
Message-ID: <1308655463-8787-3-git-send-email-ch.naveen@samsung.com>
References: <1308655463-8787-1-git-send-email-ch.naveen@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11866 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782Ab1FUL2z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 07:28:55 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN5003O917SSGV0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Jun 2011 20:28:54 +0900 (KST)
Received: from Hawshines.sisodomain.com ([107.108.83.161])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LN500MT817XCL@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Jun 2011 20:28:54 +0900 (KST)
In-reply-to: <1308655463-8787-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, jassisinghbrar@gmail.com, sbkim73@samsung.com, sw.youn@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Add the sclk_spdif clock is of type 'struct clksrc_clk' clock.
Also, add clk_spdifextclk clocks of type 'struct clk' clock.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
 arch/arm/mach-exynos4/clock.c |   35 +++++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 937335a..feeb27e 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -64,6 +64,11 @@ static struct clk clk_audiocdclk2 = {
 	.name		= "audiocdclk",
 };
 
+static struct clk clk_spdifextclk = {
+	.name		= "spdif_extclk",
+	.id		= -1,
+};
+
 static int exynos4_clksrc_mask_top_ctrl(struct clk *clk, int enable)
 {
 	return s5p_gatectrl(S5P_CLKSRC_MASK_TOP, clk, enable);
@@ -550,6 +555,11 @@ static struct clk init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_peril_ctrl,
 		.ctrlbit	= (1 << 21),
 	}, {
+		.name		= "spdif",
+		.id		= -1,
+		.enable		= exynos4_clk_ip_peril_ctrl,
+		.ctrlbit	= (1 << 26),
+	}, {
 		.name		= "ac97",
 		.id		= -1,
 		.enable		= exynos4_clk_ip_peril_ctrl,
@@ -801,6 +811,30 @@ static struct clk init_clocks[] = {
 	}
 };
 
+static struct clk *clkset_sclk_spdif_list[] = {
+	[0] = &clk_sclk_audio0.clk,
+	[1] = &clk_sclk_audio1.clk,
+	[2] = &clk_sclk_audio2.clk,
+	[3] = &clk_spdifextclk,
+};
+
+static struct clksrc_sources clkset_sclk_spdif = {
+	.sources	= clkset_sclk_spdif_list,
+	.nr_sources	= ARRAY_SIZE(clkset_sclk_spdif_list),
+};
+
+static struct clksrc_clk clk_sclk_spdif = {
+	.clk	= {
+		.name		= "sclk_spdif",
+		.id		= -1,
+		.enable		= exynos4_clksrc_mask_peril1_ctrl,
+		.ctrlbit	= (1 << 8),
+		.ops		= &s5p_sclk_spdif_ops,
+	},
+		.sources = &clkset_sclk_spdif,
+		.reg_src = { .reg = S5P_CLKSRC_PERIL1, .shift = 8, .size = 2 },
+};
+
 static struct clk *clkset_group_list[] = {
 	[0] = &clk_ext_xtal_mux,
 	[1] = &clk_xusbxti,
@@ -1206,6 +1240,7 @@ static struct clksrc_clk *sysclks[] = {
 	&clk_sclk_audio0,
 	&clk_sclk_audio1,
 	&clk_sclk_audio2,
+	&clk_sclk_spdif,
 };
 
 static int xtal_rate;
-- 
1.7.2.3
