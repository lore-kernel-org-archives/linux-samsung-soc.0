From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 16/21] ASoC: samsung: i2s: Simplify pri_dai, sec_dai
 pointers usage
Date: Tue, 12 Feb 2019 19:03:37 +0100
Message-ID: <20190212180342.32040-17-s.nawrocki@samsung.com>
References: <20190212180342.32040-1-s.nawrocki@samsung.com>
        <CGME20190212180535epcas2p3aaa1c3d8fd9fcfb5a30bc6d132aba70a@epcas2p3.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190212180342.32040-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

If the probe call is on the primary DAI we can use 'other' in place of
i2s->sec_dai, if the probe call is on the secondary DAI we can use 'i2s'
in place of other->sec_dai.

While at it fix one whitespace issue.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index f438558c4d21..097c641fc1b9 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1057,18 +1057,17 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	pm_runtime_get_sync(dai->dev);
 
 	if (is_secondary(i2s)) { /* If this is probe on the secondary DAI */
-		snd_soc_dai_init_dma_data(dai, &other->sec_dai->dma_playback,
-					   NULL);
+		snd_soc_dai_init_dma_data(dai, &i2s->dma_playback, NULL);
 	} else {
 		snd_soc_dai_init_dma_data(dai, &i2s->dma_playback,
-					   &i2s->dma_capture);
+					  &i2s->dma_capture);
 
 		if (priv->quirks & QUIRK_NEED_RSTCLR)
 			writel(CON_RSTCLR, priv->addr + I2SCON);
 
 		if (priv->quirks & QUIRK_SUPPORTS_IDMA)
 			idma_reg_addr_init(priv->addr,
-					i2s->sec_dai->idma_playback.addr);
+					   other->idma_playback.addr);
 	}
 
 	/* Reset any constraint on RFS and BFS */
-- 
2.20.1
