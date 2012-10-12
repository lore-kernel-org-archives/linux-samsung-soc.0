From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 5/6] arm: exynos: add clocks for exynos5 hdmi
Date: Sat, 13 Oct 2012 02:12:34 +0530
Message-ID: <1350074555-26018-6-git-send-email-rahul.sharma@samsung.com>
References: <1350074555-26018-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:32881 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753276Ab2JLLSj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Oct 2012 07:18:39 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBS00H1U22D0470@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Oct 2012 20:18:38 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBS006L91SLP040@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Oct 2012 20:18:38 +0900 (KST)
In-reply-to: <1350074555-26018-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

This patch adds support for clocks for hdmi, hdmiphy and mixer.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 17e6c77..ec2a4da 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -201,6 +201,11 @@ static int exynos5_clk_ip_isp1_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(EXYNOS5_CLKGATE_IP_ISP1, clk, enable);
 }
 
+static int exynos5_clk_hdmiphy_ctrl(struct clk *clk, int enable)
+{
+	return s5p_gatectrl(S5P_HDMI_PHY_CONTROL, clk, enable);
+}
+
 /* Core list of CMU_CPU side */
 
 static struct clksrc_clk exynos5_clk_mout_apll = {
@@ -612,12 +617,17 @@ static struct clk exynos5_init_clocks_off[] = {
 		.ctrlbit	= (1 << 0),
 	}, {
 		.name		= "hdmi",
-		.devname	= "exynos4-hdmi",
+		.devname	= "exynos5-hdmi",
 		.enable		= exynos5_clk_ip_disp1_ctrl,
 		.ctrlbit	= (1 << 6),
 	}, {
+		.name		= "hdmiphy",
+		.devname	= "exynos5-hdmi",
+		.enable		= exynos5_clk_hdmiphy_ctrl,
+		.ctrlbit	= (1 << 0),
+	}, {
 		.name		= "mixer",
-		.devname	= "s5p-mixer",
+		.devname	= "exynos5-mixer",
 		.enable		= exynos5_clk_ip_disp1_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
-- 
1.7.0.4
