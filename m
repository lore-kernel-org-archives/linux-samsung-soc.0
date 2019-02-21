From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: odroid: Prevent uninitialized variable use" to the asoc tree
Date: Thu, 21 Feb 2019 11:42:04 +0000 (GMT)
Message-ID: <20190221114204.61F641122744@debutante.sirena.org.uk>
References: <20190221094228.3778-1-s.nawrocki@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221094228.3778-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, linux-kernel@vger.kernel.org, krzk@kernel.orgalsa-devel@alsa-project.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: samsung: odroid: Prevent uninitialized variable use

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

>From 3af8160028bfac4116d80edcb7eb04095323d112 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Thu, 21 Feb 2019 10:42:28 +0100
Subject: [PATCH] ASoC: samsung: odroid: Prevent uninitialized variable use
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This addresses an issue pointed out by compiler warning:

sound/soc/samsung/odroid.c: In function ‘odroid_audio_probe’:
sound/soc/samsung/odroid.c:298:22: warning: ‘cpu_dai’ may be used
uninitialized in this function [-Wmaybe-uninitialized]
  priv->clk_i2s_bus = of_clk_get_by_name(cpu_dai, "iis");
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/odroid.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index c3b0f6c612cb..694512f980fd 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -194,7 +194,8 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 static int odroid_audio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *cpu, *cpu_dai, *codec;
+	struct device_node *cpu_dai = NULL;
+	struct device_node *cpu, *codec;
 	struct odroid_priv *priv;
 	struct snd_soc_card *card;
 	struct snd_soc_dai_link *link, *codec_link;
@@ -271,8 +272,11 @@ static int odroid_audio_probe(struct platform_device *pdev)
 		if (ret < 0)
 			break;
 	}
-	if (ret == 0)
+	if (ret == 0) {
 		cpu_dai = of_parse_phandle(cpu, "sound-dai", 0);
+		if (!cpu_dai)
+			ret = -EINVAL;
+	}
 
 	of_node_put(cpu);
 	of_node_put(codec);
-- 
2.20.1
