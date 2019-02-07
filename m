From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 01/22] ASoC: dmaengine: Improve of_node test in
 dmaengine_pcm_request_chan_of()
Date: Thu, 07 Feb 2019 18:00:09 +0100
Message-ID: <20190207170028.720-2-s.nawrocki@samsung.com>
References: <20190207170028.720-1-s.nawrocki@samsung.com>
        <CGME20190207170047epcas1p42d7ec4acfd976871c676efa5aecb33bc@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190207170028.720-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Currently when of_node of the "PCM" device is null
dmaengine_pcm_request_chan_of() function will bail out, including cases
when custom DMA device is intended to be used.  To have the channels
properly requested when custom DMA device is provided extend the of_node
test to also consider dma_dev->of_node.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 30e791a53352..6d7638c1233d 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -415,7 +415,8 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 
 	if ((pcm->flags & (SND_DMAENGINE_PCM_FLAG_NO_DT |
 			   SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME)) ||
-	    !dev->of_node)
+	     (!dev->of_node && !(config && config->dma_dev &&
+				config->dma_dev->of_node)))
 		return 0;
 
 	if (config && config->dma_dev) {
-- 
2.20.1
