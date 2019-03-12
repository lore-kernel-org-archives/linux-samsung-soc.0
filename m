From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: odroid: Fix clock configuration for 44100
 sample rate
Date: Tue, 12 Mar 2019 18:40:06 +0100
Message-ID: <20190312174006.32174-1-s.nawrocki@samsung.com>
References: <CGME20190312174023epcas1p32bc468e295974dadc7c6e510e467e665@epcas1p3.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: sbkim73@samsung.com, krzk@kernel.org, jcsing.lee@samsung.com, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

After commit fbeec965b8d1c ("ASoC: samsung: odroid: Fix 32000 sample rate
handling") the audio root clock frequency is configured improperly for
44100 sample rate. Due to clock rate rounding it's 20070401 Hz instead
of 22579000 Hz. This results in a too low value of the PSR clock divider
in the CPU DAI driver and too fast actual sample rate for fs=44100. E.g.
1 kHz tone has actual 1780 Hz frequency (1 kHz * 20070401/22579000 * 2).

Fix this by increasing the correction passed to clk_set_rate() to take
into account inaccuracy of the EPLL frequency properly.

Fixes: fbeec965b8d1c ("ASoC: samsung: odroid: Fix 32000 sample rate handling")
Reported-by: JaeChul Lee <jcsing.lee@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/odroid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 694512f980fd..1dc54c4206f0 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -91,11 +91,11 @@ static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	/*
-	 *  We add 1 to the rclk_freq value in order to avoid too low clock
+	 *  We add 2 to the rclk_freq value in order to avoid too low clock
 	 *  frequency values due to the EPLL output frequency not being exact
 	 *  multiple of the audio sampling rate.
 	 */
-	rclk_freq = params_rate(params) * rfs + 1;
+	rclk_freq = params_rate(params) * rfs + 2;
 
 	ret = clk_set_rate(priv->sclk_i2s, rclk_freq);
 	if (ret < 0)
-- 
2.17.1
