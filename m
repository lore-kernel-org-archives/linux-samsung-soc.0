From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: dai: Provide interface for setting
	DMA data at probe time
Date: Thu, 17 Oct 2013 22:34:12 +0100
Message-ID: <1382045653-14807-1-git-send-email-broonie@kernel.org>
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
To: Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Mark Brown <broonie@linaro.org>

Allow DMA data to be set at probe time for devices that can do that,
avoiding the need to do it every time we start a stream and supporting
non-DT dmaengine users using the helpers.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 include/sound/soc-dai.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 1ce3685..800c101 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -286,6 +286,13 @@ static inline void snd_soc_dai_set_dma_data(struct snd_soc_dai *dai,
 		dai->capture_dma_data = data;
 }
 
+static inline void snd_soc_dai_init_dma_data(struct snd_soc_dai *dai,
+					     void *playback, void *capture)
+{
+	dai->playback_dma_data = playback;
+	dai->capture_dma_data = capture;
+}
+
 static inline void snd_soc_dai_set_drvdata(struct snd_soc_dai *dai,
 		void *data)
 {
-- 
1.8.4.rc3
