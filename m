From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] ASoC: SAMSUNG: i2s: use clk_prepare_enable and
	clk_disable_unprepare
Date: Wed,  3 Oct 2012 08:46:58 +0900
Message-ID: <1349221618-2943-1-git-send-email-thomas.abraham@linaro.org>
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
To: alsa-devel@alsa-project.org
Cc: kgene.kim@samsung.com, jassisinghbrar@gmail.com, broonie@opensource.wolfsonmicro.com, lrg@ti.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
calls as required by common clock framework.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 sound/soc/samsung/i2s.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 40b00a1..547b919 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -423,7 +423,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 			if (i2s->op_clk) {
 				if ((clk_id && !(mod & MOD_IMS_SYSMUX)) ||
 					(!clk_id && (mod & MOD_IMS_SYSMUX))) {
-					clk_disable(i2s->op_clk);
+					clk_disable_unprepare(i2s->op_clk);
 					clk_put(i2s->op_clk);
 				} else {
 					i2s->rclk_srcrate =
@@ -434,7 +434,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
 
 			i2s->op_clk = clk_get(&i2s->pdev->dev,
 						i2s->src_clk[clk_id]);
-			clk_enable(i2s->op_clk);
+			clk_prepare_enable(i2s->op_clk);
 			i2s->rclk_srcrate = clk_get_rate(i2s->op_clk);
 
 			/* Over-ride the other's */
@@ -880,7 +880,7 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 		iounmap(i2s->addr);
 		return -ENOENT;
 	}
-	clk_enable(i2s->clk);
+	clk_prepare_enable(i2s->clk);
 
 	if (other) {
 		other->addr = i2s->addr;
@@ -922,7 +922,7 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
 		if (i2s->quirks & QUIRK_NEED_RSTCLR)
 			writel(0, i2s->addr + I2SCON);
 
-		clk_disable(i2s->clk);
+		clk_disable_unprepare(i2s->clk);
 		clk_put(i2s->clk);
 
 		iounmap(i2s->addr);
-- 
1.7.4.1
