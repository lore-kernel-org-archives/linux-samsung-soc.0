From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/8] ASoC: samsung: i2s: Ensure the RCLK rate is properly
 determined
Date: Mon, 05 Feb 2018 16:43:56 +0100
Message-ID: <20180205154403.13520-2-s.nawrocki@samsung.com>
References: <20180205154403.13520-1-s.nawrocki@samsung.com>
        <CGME20180205154453epcas1p10046e1103497692c86c0899a5ef11781@epcas1p1.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20180205154403.13520-1-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jcsing.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

If the RCLK mux clock configuration is specified in DT and no set_sysclk()
callback is used in the sound card driver the sclk_srcrate field will remain
set to 0, leading to an incorrect PSR divider setting.
To fix this the frequency value is retrieved from the CLK_I2S_RCLK_SRC clock,
so the actual RCLK mux selection is taken into account.

Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 sound/soc/samsung/i2s.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 233f1c9a4b6c..aeba0ae890ea 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -656,8 +656,12 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
 		tmp |= mod_slave;
 		break;
 	case SND_SOC_DAIFMT_CBS_CFS:
-		/* Set default source clock in Master mode */
-		if (i2s->rclk_srcrate == 0)
+		/*
+		 * Set default source clock in Master mode, only when the
+		 * CLK_I2S_RCLK_SRC clock is not exposed so we ensure any
+		 * clock configuration assigned in DT is not overwritten.
+		 */
+		if (i2s->rclk_srcrate == 0 && i2s->clk_data.clks == NULL)
 			i2s_set_sysclk(dai, SAMSUNG_I2S_RCLKSRC_0,
 							0, SND_SOC_CLOCK_IN);
 		break;
@@ -881,6 +885,11 @@ static int config_setup(struct i2s_dai *i2s)
 		return 0;
 
 	if (!(i2s->quirks & QUIRK_NO_MUXPSR)) {
+		struct clk *rclksrc = i2s->clk_table[CLK_I2S_RCLK_SRC];
+
+		if (i2s->rclk_srcrate == 0 && rclksrc && !IS_ERR(rclksrc))
+			i2s->rclk_srcrate = clk_get_rate(rclksrc);
+
 		psr = i2s->rclk_srcrate / i2s->frmclk / rfs;
 		writel(((psr - 1) << 8) | PSR_PSREN, i2s->addr + I2SPSR);
 		dev_dbg(&i2s->pdev->dev,
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
