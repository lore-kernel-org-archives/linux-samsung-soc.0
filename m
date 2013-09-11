From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH] ASoC: SAMSUNG: Allow mono in i2s driver
Date: Wed, 11 Sep 2013 15:27:29 +0100
Message-ID: <1378909649-8985-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
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
To: kgene.kim@samsung.com, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, lgirdwood@gmail.com, ben-linux@fluff.org, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
I can't see any reason to not allow mono playback in the
i2s driver and indeed it seems to work well on our test
system here. However, I am fairly unfamilar with the code
in this part of the tree so apologies if I am missing some
constraint.

Thanks,
Charles

 sound/soc/samsung/i2s.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 959c702..70d08d7 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -991,7 +991,7 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
 	i2s->i2s_dai_drv.ops = &samsung_i2s_dai_ops;
 	i2s->i2s_dai_drv.suspend = i2s_suspend;
 	i2s->i2s_dai_drv.resume = i2s_resume;
-	i2s->i2s_dai_drv.playback.channels_min = 2;
+	i2s->i2s_dai_drv.playback.channels_min = 1;
 	i2s->i2s_dai_drv.playback.channels_max = 2;
 	i2s->i2s_dai_drv.playback.rates = SAMSUNG_I2S_RATES;
 	i2s->i2s_dai_drv.playback.formats = SAMSUNG_I2S_FMTS;
-- 
1.7.2.5
