From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v5 02/13] clk: samsung: exynos5433: Add clocks using common
 clock framework
Date: Wed, 04 Feb 2015 19:08:25 +0100
Message-ID: <54D26019.6060109@samsung.com>
References: <1422887047-30911-1-git-send-email-cw00.choi@samsung.com>
 <1422887047-30911-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39973 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161227AbbBDSIb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Feb 2015 13:08:31 -0500
In-reply-to: <1422887047-30911-3-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, pankaj.dubey@samsung.com, sangbae90.lee@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

Hi Chanwoo,

On 02/02/15 15:23, Chanwoo Choi wrote:
> +/*
> + * ATLAS_PLL & APOLLO_PLL & MEM0_PLL & MEM1_PLL & BUS_PLL & MFC_PLL
> + * & MPHY_PLL & G3D_PLL & DISP_PLL & ISP_PLL
> + */
> +static struct samsung_pll_rate_table exynos5443_pll_rates[] = {
> +	PLL_35XX_RATE(2500000000, 625, 6,  0),
> +	PLL_35XX_RATE(2400000000, 500, 5,  0),
> +	PLL_35XX_RATE(2300000000, 575, 6,  0),
> +	PLL_35XX_RATE(2200000000, 550, 6,  0),
> +	PLL_35XX_RATE(2100000000, 350, 4,  0),
> +	PLL_35XX_RATE(2000000000, 500, 6,  0),
> +	PLL_35XX_RATE(1900000000, 475, 6,  0),
> +	PLL_35XX_RATE(1800000000, 375, 5,  0),
> +	PLL_35XX_RATE(1700000000, 425, 6,  0),
> +	PLL_35XX_RATE(1600000000, 400, 6,  0),
> +	PLL_35XX_RATE(1500000000, 250, 4,  0),
> +	PLL_35XX_RATE(1400000000, 350, 6,  0),
> +	PLL_35XX_RATE(1332000000, 222, 4,  0),
> +	PLL_35XX_RATE(1300000000, 325, 6,  0),
> +	PLL_35XX_RATE(1200000000, 500, 5,  1),
> +	PLL_35XX_RATE(1100000000, 550, 6,  1),
> +	PLL_35XX_RATE(1086000000, 362, 4,  1),
> +	PLL_35XX_RATE(1066000000, 533, 6,  1),
> +	PLL_35XX_RATE(1000000000, 500, 6,  1),
> +	PLL_35XX_RATE(933000000,  311, 4,  1),
> +	PLL_35XX_RATE(921000000,  307, 4,  1),
> +	PLL_35XX_RATE(900000000,  375, 5,  1),
> +	PLL_35XX_RATE(825000000,  275, 4,  1),
> +	PLL_35XX_RATE(800000000,  400, 6,  1),
> +	PLL_35XX_RATE(733000000,  733, 12, 1),
> +	PLL_35XX_RATE(700000000,  360, 6,  1),
> +	PLL_35XX_RATE(667000000,  222, 4,  1),
> +	PLL_35XX_RATE(633000000,  211, 4,  1),
> +	PLL_35XX_RATE(600000000,  500, 5,  2),
> +	PLL_35XX_RATE(552000000,  460, 5,  2),
> +	PLL_35XX_RATE(550000000,  550, 6,  2),
> +	PLL_35XX_RATE(543000000,  362, 4,  2),
> +	PLL_35XX_RATE(533000000,  533, 6,  2),
> +	PLL_35XX_RATE(500000000,  500, 6,  2),
> +	PLL_35XX_RATE(444000000,  370, 5,  2),
> +	PLL_35XX_RATE(420000000,  350, 5,  2),
> +	PLL_35XX_RATE(400000000,  400, 6,  2),
> +	PLL_35XX_RATE(350000000,  360, 6,  2),
> +	PLL_35XX_RATE(333000000,  222, 4,  2),
> +	PLL_35XX_RATE(300000000,  500, 5,  3),
> +	PLL_35XX_RATE(266000000,  532, 6,  3),
> +	PLL_35XX_RATE(200000000,  400, 6,  3),
> +	PLL_35XX_RATE(166000000,  332, 6,  3),
> +	PLL_35XX_RATE(160000000,  320, 6,  3),
> +	PLL_35XX_RATE(133000000,  552, 6,  4),
> +	PLL_35XX_RATE(100000000,  400, 6,  4),
> +	{ /* sentinel */ }
> +};
> +
> +/* AUD_PLL */
> +static struct samsung_pll_rate_table exynos5443_aud_pll_rates[] = {
> +	PLL_36XX_RATE(400000000, 200, 3, 2,      0),
> +	PLL_36XX_RATE(393216000, 197, 3, 2, -25690),
> +	PLL_36XX_RATE(384000000, 128, 2, 2,      0),
> +	PLL_36XX_RATE(368640000, 246, 4, 2, -15729),
> +	PLL_36XX_RATE(361507200, 181, 3, 2, -16148),
> +	PLL_36XX_RATE(338688000, 113, 2, 2,  -6816),
> +	PLL_36XX_RATE(294912000,  98, 1, 3,  19923),
> +	PLL_36XX_RATE(288000000,  96, 1, 3,      0),
> +	PLL_36XX_RATE(252000000,  84, 1, 3,      0),
> +	{ /* sentinel */ }
> +};

To avoid issues pointed out by these build warnings:

drivers/clk/samsung/clk-exynos5433.c:726:2: warning: this decimal constant is unsigned only in ISO C90 [enabled by default]
drivers/clk/samsung/clk-exynos5433.c:727:2: warning: this decimal constant is unsigned only in ISO C90 [enabled by default]
drivers/clk/samsung/clk-exynos5433.c:728:2: warning: this decimal constant is unsigned only in ISO C90 [enabled by default]
drivers/clk/samsung/clk-exynos5433.c:729:2: warning: this decimal constant is unsigned only in ISO C90 [enabled by default]

I have squashed following change to the $subject patch:

---8<---
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index bdd4113..7a024cd 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -723,66 +723,66 @@ static struct samsung_gate_clock top_gate_clks[] __initdata = {
  * & MPHY_PLL & G3D_PLL & DISP_PLL & ISP_PLL
  */
 static struct samsung_pll_rate_table exynos5443_pll_rates[] = {
-       PLL_35XX_RATE(2500000000, 625, 6,  0),
-       PLL_35XX_RATE(2400000000, 500, 5,  0),
-       PLL_35XX_RATE(2300000000, 575, 6,  0),
-       PLL_35XX_RATE(2200000000, 550, 6,  0),
-       PLL_35XX_RATE(2100000000, 350, 4,  0),
-       PLL_35XX_RATE(2000000000, 500, 6,  0),
-       PLL_35XX_RATE(1900000000, 475, 6,  0),
-       PLL_35XX_RATE(1800000000, 375, 5,  0),
-       PLL_35XX_RATE(1700000000, 425, 6,  0),
-       PLL_35XX_RATE(1600000000, 400, 6,  0),
-       PLL_35XX_RATE(1500000000, 250, 4,  0),
-       PLL_35XX_RATE(1400000000, 350, 6,  0),
-       PLL_35XX_RATE(1332000000, 222, 4,  0),
-       PLL_35XX_RATE(1300000000, 325, 6,  0),
-       PLL_35XX_RATE(1200000000, 500, 5,  1),
-       PLL_35XX_RATE(1100000000, 550, 6,  1),
-       PLL_35XX_RATE(1086000000, 362, 4,  1),
-       PLL_35XX_RATE(1066000000, 533, 6,  1),
-       PLL_35XX_RATE(1000000000, 500, 6,  1),
-       PLL_35XX_RATE(933000000,  311, 4,  1),
-       PLL_35XX_RATE(921000000,  307, 4,  1),
-       PLL_35XX_RATE(900000000,  375, 5,  1),
-       PLL_35XX_RATE(825000000,  275, 4,  1),
-       PLL_35XX_RATE(800000000,  400, 6,  1),
-       PLL_35XX_RATE(733000000,  733, 12, 1),
-       PLL_35XX_RATE(700000000,  360, 6,  1),
-       PLL_35XX_RATE(667000000,  222, 4,  1),
-       PLL_35XX_RATE(633000000,  211, 4,  1),
-       PLL_35XX_RATE(600000000,  500, 5,  2),
-       PLL_35XX_RATE(552000000,  460, 5,  2),
-       PLL_35XX_RATE(550000000,  550, 6,  2),
-       PLL_35XX_RATE(543000000,  362, 4,  2),
-       PLL_35XX_RATE(533000000,  533, 6,  2),
-       PLL_35XX_RATE(500000000,  500, 6,  2),
-       PLL_35XX_RATE(444000000,  370, 5,  2),
-       PLL_35XX_RATE(420000000,  350, 5,  2),
-       PLL_35XX_RATE(400000000,  400, 6,  2),
-       PLL_35XX_RATE(350000000,  360, 6,  2),
-       PLL_35XX_RATE(333000000,  222, 4,  2),
-       PLL_35XX_RATE(300000000,  500, 5,  3),
-       PLL_35XX_RATE(266000000,  532, 6,  3),
-       PLL_35XX_RATE(200000000,  400, 6,  3),
-       PLL_35XX_RATE(166000000,  332, 6,  3),
-       PLL_35XX_RATE(160000000,  320, 6,  3),
-       PLL_35XX_RATE(133000000,  552, 6,  4),
-       PLL_35XX_RATE(100000000,  400, 6,  4),
+       PLL_35XX_RATE(2500000000U, 625, 6,  0),
+       PLL_35XX_RATE(2400000000U, 500, 5,  0),
+       PLL_35XX_RATE(2300000000U, 575, 6,  0),
+       PLL_35XX_RATE(2200000000U, 550, 6,  0),
+       PLL_35XX_RATE(2100000000U, 350, 4,  0),
+       PLL_35XX_RATE(2000000000U, 500, 6,  0),
+       PLL_35XX_RATE(1900000000U, 475, 6,  0),
+       PLL_35XX_RATE(1800000000U, 375, 5,  0),
+       PLL_35XX_RATE(1700000000U, 425, 6,  0),
+       PLL_35XX_RATE(1600000000U, 400, 6,  0),
+       PLL_35XX_RATE(1500000000U, 250, 4,  0),
+       PLL_35XX_RATE(1400000000U, 350, 6,  0),
+       PLL_35XX_RATE(1332000000U, 222, 4,  0),
+       PLL_35XX_RATE(1300000000U, 325, 6,  0),
+       PLL_35XX_RATE(1200000000U, 500, 5,  1),
+       PLL_35XX_RATE(1100000000U, 550, 6,  1),
+       PLL_35XX_RATE(1086000000U, 362, 4,  1),
+       PLL_35XX_RATE(1066000000U, 533, 6,  1),
+       PLL_35XX_RATE(1000000000U, 500, 6,  1),
+       PLL_35XX_RATE(933000000U,  311, 4,  1),
+       PLL_35XX_RATE(921000000U,  307, 4,  1),
+       PLL_35XX_RATE(900000000U,  375, 5,  1),
+       PLL_35XX_RATE(825000000U,  275, 4,  1),
+       PLL_35XX_RATE(800000000U,  400, 6,  1),
+       PLL_35XX_RATE(733000000U,  733, 12, 1),
+       PLL_35XX_RATE(700000000U,  360, 6,  1),
+       PLL_35XX_RATE(667000000U,  222, 4,  1),
+       PLL_35XX_RATE(633000000U,  211, 4,  1),
+       PLL_35XX_RATE(600000000U,  500, 5,  2),
+       PLL_35XX_RATE(552000000U,  460, 5,  2),
+       PLL_35XX_RATE(550000000U,  550, 6,  2),
+       PLL_35XX_RATE(543000000U,  362, 4,  2),
+       PLL_35XX_RATE(533000000U,  533, 6,  2),
+       PLL_35XX_RATE(500000000U,  500, 6,  2),
+       PLL_35XX_RATE(444000000U,  370, 5,  2),
+       PLL_35XX_RATE(420000000U,  350, 5,  2),
+       PLL_35XX_RATE(400000000U,  400, 6,  2),
+       PLL_35XX_RATE(350000000U,  360, 6,  2),
+       PLL_35XX_RATE(333000000U,  222, 4,  2),
+       PLL_35XX_RATE(300000000U,  500, 5,  3),
+       PLL_35XX_RATE(266000000U,  532, 6,  3),
+       PLL_35XX_RATE(200000000U,  400, 6,  3),
+       PLL_35XX_RATE(166000000U,  332, 6,  3),
+       PLL_35XX_RATE(160000000U,  320, 6,  3),
+       PLL_35XX_RATE(133000000U,  552, 6,  4),
+       PLL_35XX_RATE(100000000U,  400, 6,  4),
        { /* sentinel */ }
 };
 
 /* AUD_PLL */
 static struct samsung_pll_rate_table exynos5443_aud_pll_rates[] = {
-       PLL_36XX_RATE(400000000, 200, 3, 2,      0),
-       PLL_36XX_RATE(393216000, 197, 3, 2, -25690),
-       PLL_36XX_RATE(384000000, 128, 2, 2,      0),
-       PLL_36XX_RATE(368640000, 246, 4, 2, -15729),
-       PLL_36XX_RATE(361507200, 181, 3, 2, -16148),
-       PLL_36XX_RATE(338688000, 113, 2, 2,  -6816),
-       PLL_36XX_RATE(294912000,  98, 1, 3,  19923),
-       PLL_36XX_RATE(288000000,  96, 1, 3,      0),
-       PLL_36XX_RATE(252000000,  84, 1, 3,      0),
+       PLL_36XX_RATE(400000000U, 200, 3, 2,      0),
+       PLL_36XX_RATE(393216000U, 197, 3, 2, -25690),
+       PLL_36XX_RATE(384000000U, 128, 2, 2,      0),
+       PLL_36XX_RATE(368640000U, 246, 4, 2, -15729),
+       PLL_36XX_RATE(361507200U, 181, 3, 2, -16148),
+       PLL_36XX_RATE(338688000U, 113, 2, 2,  -6816),
+       PLL_36XX_RATE(294912000U,  98, 1, 3,  19923),
+       PLL_36XX_RATE(288000000U,  96, 1, 3,      0),
+       PLL_36XX_RATE(252000000U,  84, 1, 3,      0),
        { /* sentinel */ }
 };
---8<---
