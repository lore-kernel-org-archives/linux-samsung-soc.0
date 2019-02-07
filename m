From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 02/22] ASoC: dmaengine: Extend use of chan_names provided in
 custom DMA config
Date: Thu, 07 Feb 2019 18:00:10 +0100
Message-ID: <20190207170028.720-3-s.nawrocki@samsung.com>
References: <20190207170028.720-1-s.nawrocki@samsung.com>
        <CGME20190207170051epcas1p37a1acaef52cffb01af00c8d34dd9b1dd@epcas1p3.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190207170028.720-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

There are currently two ways to specify custom DMA channel names:
 - through the SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag and
   snd_dmaengine_dai_dma_data data structure,
 - through chan_names field of struct snd_dmaengine_pcm_config.

In order to replace the DAI DMA data method with the custom DMA config
one on non-DT platforms the dmaengine_pcm_new() function is extended
to also consider channel names specified in the custom DMA config.
If both config->chan_names and dma_data->chan_name are provided
the former will be used.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 6d7638c1233d..1b44e363c50c 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -288,9 +288,16 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
 		dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
 
 		if (!pcm->chan[i] &&
-		    (pcm->flags & SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME))
+		    ((pcm->flags & SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME) ||
+		     (config && config->chan_names[i]))) {
+			const char *chan_name = dma_data->chan_name;
+
+			if (config && config->chan_names[i])
+				chan_name = config->chan_names[i];
+
 			pcm->chan[i] = dma_request_slave_channel(dev,
-				dma_data->chan_name);
+				chan_name);
+		}
 
 		if (!pcm->chan[i] && (pcm->flags & SND_DMAENGINE_PCM_FLAG_COMPAT)) {
 			pcm->chan[i] = dmaengine_pcm_compat_request_channel(rtd,
-- 
2.20.1
