From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: Use
	snd_soc_of_put_dai_link_codecs() in odroid.c" to the asoc tree
Date: Mon, 19 Mar 2018 01:47:12 +0000 (GMT)
Message-ID: <20180319014712.9BFB9440079@finisterre.ee.mobilebroadband>
References: <20180314164115.22736-3-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180314164115.22736-3-s.nawrocki@samsung.com>
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

   ASoC: samsung: Use snd_soc_of_put_dai_link_codecs() in odroid.c

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

>From 4718840e76f74e5868d2001f0ca3a0e5c4292ea0 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Wed, 14 Mar 2018 17:41:15 +0100
Subject: [PATCH] ASoC: samsung: Use snd_soc_of_put_dai_link_codecs() in
 odroid.c

Now when a helper for unreferencing device nodes is available
we can get rid of the local implementation.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/odroid.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index e1b59457a327..e7b371b07230 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -91,18 +91,6 @@ static const struct snd_soc_ops odroid_card_ops = {
 	.hw_params = odroid_card_hw_params,
 };
 
-static void odroid_put_codec_of_nodes(struct snd_soc_dai_link *link)
-{
-	struct snd_soc_dai_link_component *component = link->codecs;
-	int i;
-
-	for (i = 0; i < link->num_codecs; i++, component++) {
-		if (!component->of_node)
-			break;
-		of_node_put(component->of_node);
-	}
-}
-
 static int odroid_audio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -197,7 +185,7 @@ static int odroid_audio_probe(struct platform_device *pdev)
 err_put_i2s_n:
 	of_node_put(link->cpu_of_node);
 err_put_codec_n:
-	odroid_put_codec_of_nodes(link);
+	snd_soc_of_put_dai_link_codecs(link);
 	return ret;
 }
 
@@ -206,7 +194,7 @@ static int odroid_audio_remove(struct platform_device *pdev)
 	struct odroid_priv *priv = platform_get_drvdata(pdev);
 
 	of_node_put(priv->dai_link.cpu_of_node);
-	odroid_put_codec_of_nodes(&priv->dai_link);
+	snd_soc_of_put_dai_link_codecs(&priv->dai_link);
 	clk_put(priv->sclk_i2s);
 	clk_put(priv->clk_i2s_bus);
 
-- 
2.16.2
