From: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Subject: [RFC 1/3] clk: samsung: pll: Add support for PLL6545a and PLL6522x
Date: Wed, 28 Aug 2013 18:29:15 +0200
Message-ID: <1377707357-4902-2-git-send-email-m.krawczuk@partner.samsung.com>
References: <1377707357-4902-1-git-send-email-m.krawczuk@partner.samsung.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1377707357-4902-1-git-send-email-m.krawczuk@partner.samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: kgene.kim@samsung.com
Cc: mturquette@linaro.org, tomasz.figa@gmail.com, yadi.brar@samsung.com, dianders@chromium.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, rob@landley.net, thomas.abraham@linaro.org, s.nawrocki@samsung.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux@arm.linux.org.uk, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
---
 drivers/clk/samsung/clk-pll.c | 2 ++
 drivers/clk/samsung/clk-pll.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 7572d1d..c62ddfc 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -644,6 +644,8 @@ static void __init _samsung_clk_register_pll(struct samsung_pll_clock *pll_clk,
 			init.ops = &samsung_pll36xx_clk_ops;
 		break;
 	case pll_6552:
+	case pll_6545a:
+	case pll_6522x:
 		init.ops = &samsung_pll6552_clk_ops;
 		break;
 	case pll_6553:
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index cd11037..7679c4c 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -19,6 +19,8 @@ enum samsung_pll_type {
 	pll_2650,
 	pll_6552,
 	pll_6553,
+	pll_6545a,
+	pll_6522x,
 };
 
 #define PLL_35XX_RATE(_rate, _m, _p, _s)			\
-- 
1.8.1.2

