From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: odroid: Fix 32000 sample rate
	handling" to the asoc tree
Date: Mon, 19 Mar 2018 01:47:20 +0000 (GMT)
Message-ID: <20180319014721.0447A440079@finisterre.ee.mobilebroadband>
References: <20180314164115.22736-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180314164115.22736-1-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org, broonie@kernel.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: samsung: odroid: Fix 32000 sample rate handling

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

>From 1d22c337dc8f3a25638f7262e7bcb5729a34d140 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Wed, 14 Mar 2018 17:41:13 +0100
Subject: [PATCH] ASoC: samsung: odroid: Fix 32000 sample rate handling

In case of sample rates lower than 44100 currently there is too low MCLK
frequency set for the CODEC. Playback fails with following errors:

$ speaker-test -c2 -t sine -f 1500 -l2 -r 32000

Sine wave rate is 1500.0000Hz
Rate set to 32000Hz (requested 32000Hz)
Buffer size range from 128 to 131072
Period size range from 64 to 65536
Using max buffer size 131072
Periods = 4
Unable to set hw params for playback: Invalid argument
Setting of hwparams failed: Invalid argument

[  497.883700] max98090 1-0010: Invalid master clock frequency

To fix this the I2S root clock's frequency is increased, depending
on sampling rate.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/odroid.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 92d750806d1d..e698e67f5f84 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -36,23 +36,26 @@ static int odroid_card_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct odroid_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	unsigned int pll_freq, rclk_freq;
+	unsigned int pll_freq, rclk_freq, rfs;
 	int ret;
 
 	switch (params_rate(params)) {
-	case 32000:
 	case 64000:
-		pll_freq = 131072006U;
+		pll_freq = 196608001U;
+		rfs = 384;
 		break;
 	case 44100:
 	case 88200:
 	case 176400:
 		pll_freq = 180633609U;
+		rfs = 512;
 		break;
+	case 32000:
 	case 48000:
 	case 96000:
 	case 192000:
 		pll_freq = 196608001U;
+		rfs = 512;
 		break;
 	default:
 		return -EINVAL;
@@ -67,7 +70,7 @@ static int odroid_card_hw_params(struct snd_pcm_substream *substream,
 	 *  frequency values due to the EPLL output frequency not being exact
 	 *  multiple of the audio sampling rate.
 	 */
-	rclk_freq = params_rate(params) * 256 + 1;
+	rclk_freq = params_rate(params) * rfs + 1;
 
 	ret = clk_set_rate(priv->sclk_i2s, rclk_freq);
 	if (ret < 0)
-- 
2.16.2
