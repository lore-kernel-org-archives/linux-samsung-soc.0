From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 3/5] clk/exynos5420: fix the order of parents of hdmi mux
Date: Tue, 18 Jun 2013 20:03:16 +0530
Message-ID: <1371565998-3642-4-git-send-email-rahul.sharma@samsung.com>
References: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40272 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932855Ab3FROJu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 10:09:50 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOL00MGDE09HUL0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Jun 2013 23:09:49 +0900 (KST)
In-reply-to: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Listing sclk_hdmiphy at 0th position in the list of parents is
causing wrong configuration in reg SRC_DISP10.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index e8be481..193d25e 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -257,7 +257,7 @@ PNAME(audio2_p)	= { "fin_pll", "cdclk2", "sclk_dpll", "sclk_mpll",
 		  "sclk_spll", "sclk_ipll", "sclk_epll", "sclk_rpll" };
 PNAME(spdif_p)	= { "fin_pll", "dout_audio0", "dout_audio1", "dout_audio2",
 		  "spdif_extclk", "sclk_ipll", "sclk_epll", "sclk_rpll" };
-PNAME(hdmi_p)	= { "sclk_hdmiphy", "dout_hdmi_pixel" };
+PNAME(hdmi_p)	= { "dout_hdmi_pixel", "sclk_hdmiphy" };
 PNAME(maudio0_p)	= { "fin_pll", "maudio_clk", "sclk_dpll", "sclk_mpll",
 			  "sclk_spll", "sclk_ipll", "sclk_epll", "sclk_rpll" };
 
-- 
1.7.10.4
