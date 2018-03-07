From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/6] ASoC: samsung: i2s: Fix rclk_srcrate
	handling
Date: Wed, 07 Mar 2018 18:01:20 +0100
Message-ID: <20180307170120.13943-1-s.nawrocki@samsung.com>
References: <CGME20180307170131epcas1p3875d351d5469f8fbfb1135b3e41f62df@epcas1p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, lgirdwood@gmail.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

As the RCLK clock may be updated through the common clk API before each
snd_soc_dai_ops::trigger call, it is not enough to update i2s->rclk_srcrate
only once after it has been initially set to 0. To avoid wrong PSR values
we always get the RCLK frequency from the CLK_I2S_RCLK_SRC, when this clock
is available.

Fixes: e1417fdf3011 "ASoC: samsung: i2s: Ensure the RCLK rate is properly determined"
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index b6407fbabdd1..f914ed45db7d 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -887,7 +887,7 @@ static int config_setup(struct i2s_dai *i2s)
 	if (!(i2s->quirks & QUIRK_NO_MUXPSR)) {
 		struct clk *rclksrc = i2s->clk_table[CLK_I2S_RCLK_SRC];
 
-		if (i2s->rclk_srcrate == 0 && rclksrc && !IS_ERR(rclksrc))
+		if (rclksrc && !IS_ERR(rclksrc))
 			i2s->rclk_srcrate = clk_get_rate(rclksrc);
 
 		psr = i2s->rclk_srcrate / i2s->frmclk / rfs;
-- 
2.14.2
