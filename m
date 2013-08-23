From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 3/5] clk/exynos5420: fix the order of parents of hdmi mux
Date: Fri, 23 Aug 2013 12:27:56 +0530
Message-ID: <1377241078-11808-4-git-send-email-rahul.sharma@samsung.com>
References: <1377241078-11808-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45448 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754754Ab3HWGgO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Aug 2013 02:36:14 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRZ00J3L0ZANIA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Aug 2013 15:36:13 +0900 (KST)
In-reply-to: <1377241078-11808-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Listing sclk_hdmiphy at 0th position in the list of parents is
causing wrong configuration in reg SRC_DISP10.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 4e0c13e..522c033 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -286,7 +286,7 @@ PNAME(audio2_p)	= { "fin_pll", "cdclk2", "sclk_dpll", "sclk_mpll",
 		  "sclk_spll", "sclk_ipll", "sclk_epll", "sclk_rpll" };
 PNAME(spdif_p)	= { "fin_pll", "dout_audio0", "dout_audio1", "dout_audio2",
 		  "spdif_extclk", "sclk_ipll", "sclk_epll", "sclk_rpll" };
-PNAME(hdmi_p)	= { "sclk_hdmiphy", "dout_hdmi_pixel" };
+PNAME(hdmi_p)	= { "dout_hdmi_pixel", "sclk_hdmiphy" };
 PNAME(maudio0_p)	= { "fin_pll", "maudio_clk", "sclk_dpll", "sclk_mpll",
 			  "sclk_spll", "sclk_ipll", "sclk_epll", "sclk_rpll" };
 
-- 
1.7.10.4
