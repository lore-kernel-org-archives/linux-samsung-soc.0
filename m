From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH] ASoC: samsung-i2s: Check secondary DAI exists
	before referencing
Date: Tue,  9 Sep 2014 16:51:49 +0100
Message-ID: <1410277909-27922-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
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
Cc: sbkim73@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, lgirdwood@gmail.com, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

In a couple of places the driver is missing a check to ensure there is a
secondary DAI before it de-references the pointer to it, causing a null
pointer de-reference. This patch adds a check to avoid this.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 sound/soc/samsung/i2s.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 03eec22..9d51347 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -462,7 +462,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 		if (dir == SND_SOC_CLOCK_IN)
 			rfs = 0;
 
-		if ((rfs && other->rfs && (other->rfs != rfs)) ||
+		if ((rfs && other && other->rfs && (other->rfs != rfs)) ||
 				(any_active(i2s) &&
 				(((dir == SND_SOC_CLOCK_IN)
 					&& !(mod & MOD_CDCLKCON)) ||
@@ -762,7 +762,8 @@ static void i2s_shutdown(struct snd_pcm_substream *substream,
 	} else {
 		u32 mod = readl(i2s->addr + I2SMOD);
 		i2s->cdclk_out = !(mod & MOD_CDCLKCON);
-		other->cdclk_out = i2s->cdclk_out;
+		if (other)
+			other->cdclk_out = i2s->cdclk_out;
 	}
 	/* Reset any constraint on RFS and BFS */
 	i2s->rfs = 0;
-- 
1.7.2.5
