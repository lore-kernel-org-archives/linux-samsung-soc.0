From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: samsung: Check to see if we managed to
	allocate a channel
Date: Mon, 19 Aug 2013 20:34:47 +0100
Message-ID: <1376940887-26938-1-git-send-email-broonie@kernel.org>
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
To: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Mark Brown <broonie@linaro.org>

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 sound/soc/samsung/dma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/samsung/dma.c b/sound/soc/samsung/dma.c
index 6e2b2b4..d54df85 100644
--- a/sound/soc/samsung/dma.c
+++ b/sound/soc/samsung/dma.c
@@ -183,6 +183,10 @@ static int dma_hw_params(struct snd_pcm_substream *substream,
 		prtd->params->ch = prtd->params->ops->request(
 				prtd->params->channel, &req, rtd->cpu_dai->dev,
 				prtd->params->ch_name);
+		if (!prtd->params->ch) {
+			pr_err("Failed to allocate DMA channel\n");
+			return -ENXIO;
+		}
 		prtd->params->ops->config(prtd->params->ch, &config);
 	}
 
-- 
1.8.4.rc3
