From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 4/7] ASoC: samsung: i2s: Fix rclk_srcrate
	handling
Date: Fri, 09 Mar 2018 18:48:55 +0100
Message-ID: <20180309174858.24017-4-s.nawrocki@samsung.com>
References: <20180309174858.24017-1-s.nawrocki@samsung.com>
 <CGME20180309175007epcas1p47d08eaa5611bf2f686065ca681ffde52@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20180309174858.24017-1-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, javierm@redhat.com, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

As the RCLK clock may be updated through the common clk API before each
snd_soc_dai_ops::trigger call, it is not enough to update i2s->rclk_srcrate
only once after it has been initially set to 0. To avoid wrong PSR values
we always get RCLK frequency from the CLK_I2S_RCLK_SRC clock, when that
clock is available.

Fixes: e1417fdf3011 "ASoC: samsung: i2s: Ensure the RCLK rate is properly determined"
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - none.
---
 sound/soc/samsung/i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index c65227e2561c..97fe3f9352c5 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -897,7 +897,7 @@ static int config_setup(struct i2s_dai *i2s)
 	if (!(i2s->quirks & QUIRK_NO_MUXPSR)) {
 		struct clk *rclksrc = i2s->clock[CLK_I2S_RCLK_SRC];
 
-		if (i2s->rclk_srcrate == 0 && rclksrc && !IS_ERR(rclksrc))
+		if (rclksrc && !IS_ERR(rclksrc))
 			i2s->rclk_srcrate = clk_get_rate(rclksrc);
 
 		psr = i2s->rclk_srcrate / i2s->frmclk / rfs;
-- 
2.14.2
