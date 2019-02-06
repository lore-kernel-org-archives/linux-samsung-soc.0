From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH] ASoC: dapm: Check for NULL widget in
	dapm_update_dai_unlocked
Date: Wed, 6 Feb 2019 10:05:49 +0000
Message-ID: <20190206100549.GO3837@imbe.wolfsonmicro.main>
References: <CGME20190205211638epcas3p409823d4acac8073473153d745151ea5f@epcas3p4.samsung.com>
 <20190205211622.GA5891@kozik-lap>
 <844c3f34-f7db-6b26-169a-994922367c78@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <844c3f34-f7db-6b26-169a-994922367c78@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

DAIs linked to the dummy will not have an associated playback/capture
widget, so we need to skip the update in that case.

Fixes: 078a85f2806f ("ASoC: dapm: Only power up active channels from a DAI")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Ok so that all makes sense, this patch is probably the best fix?

Thanks,
Charles

 sound/soc/soc-dapm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 482ddb825fb59..5235d8828758a 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2570,6 +2570,9 @@ static int dapm_update_dai_unlocked(struct snd_pcm_substream *substream,
 	else
 		w = dai->capture_widget;
 
+	if (!w)
+		return 0;
+
 	dev_dbg(dai->dev, "Update DAI routes for %s %s\n", dai->name,
 		dir == SNDRV_PCM_STREAM_PLAYBACK ? "playback" : "capture");
 
-- 
2.11.0
