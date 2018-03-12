From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: i2s: Fix rclk_srcrate
	handling" to the asoc tree
Date: Mon, 12 Mar 2018 18:07:41 +0000 (GMT)
Message-ID: <20180312180741.D40BF44007A@finisterre.ee.mobilebroadband>
References: <20180307170120.13943-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180307170120.13943-1-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: samsung: i2s: Fix rclk_srcrate handling

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 995e73e55f46dcfae863d72de674447008a85887 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 9 Mar 2018 18:48:55 +0100
Subject: [PATCH] ASoC: samsung: i2s: Fix rclk_srcrate handling

As the RCLK clock may be updated through the common clk API before each
snd_soc_dai_ops::trigger call, it is not enough to update i2s->rclk_srcrate
only once after it has been initially set to 0. To avoid wrong PSR values
we always get RCLK frequency from the CLK_I2S_RCLK_SRC clock, when that
clock is available.

Fixes: e1417fdf3011 "ASoC: samsung: i2s: Ensure the RCLK rate is properly determined"
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.16.2
