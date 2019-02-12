From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: dmaengine: Improve of_node test in dmaengine_pcm_request_chan_of()" to the asoc tree
Date: Tue, 12 Feb 2019 16:58:55 +0000 (GMT)
Message-ID: <20190212165855.957C61128113@debutante.sirena.org.uk>
References: <20190207170028.720-2-s.nawrocki@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-2-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>broonie@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.comkrzk@kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.comalsa-devel@alsa-project.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: dmaengine: Improve of_node test in dmaengine_pcm_request_chan_of()

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

>From 51256d348c9af1bf544a4432abc1d5f2fd3ef34b Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Thu, 7 Feb 2019 18:00:09 +0100
Subject: [PATCH] ASoC: dmaengine: Improve of_node test in
 dmaengine_pcm_request_chan_of()

Currently when of_node of the "PCM" device is null
dmaengine_pcm_request_chan_of() function will bail out, including cases
when custom DMA device is intended to be used.  To have the channels
properly requested when custom DMA device is provided extend the of_node
test to also consider dma_dev->of_node.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
