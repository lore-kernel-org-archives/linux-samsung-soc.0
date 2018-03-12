From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: Drop uneeded RCLKSRC setting
	in the Snow driver" to the asoc tree
Date: Mon, 12 Mar 2018 18:07:41 +0000 (GMT)
Message-ID: <20180312180741.46D55440079@finisterre.ee.mobilebroadband>
References: <20180307170417.14126-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180307170417.14126-1-s.nawrocki@samsung.com>
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, lgirdwood@gmail.com, Krzysztof Kozlowski <krzk@kernel.org>, broonie@kernel.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: samsung: Drop uneeded RCLKSRC setting in the Snow driver

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

>From ca7796683ff63fb1917d205d4e0173c5dadfb37d Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 9 Mar 2018 18:48:57 +0100
Subject: [PATCH] ASoC: samsung: Drop uneeded RCLKSRC setting in the Snow
 driver

The RCLKSRC mux input 0 is a default configuration after reset, so
there is no need for this explicit snd_soc_dai_set_sysclk() call.
Also, this static mux clock configuration can be specified in DT.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/snow.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index d8ac907bbb0d..fc62110f500f 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -50,11 +50,6 @@ static int snow_late_probe(struct snd_soc_card *card)
 	if (ret < 0)
 		return ret;
 
-	/* Select I2S Bus clock to set RCLK and BCLK */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_RCLKSRC_0,
-					0, SND_SOC_CLOCK_IN);
-	if (ret < 0)
-		return ret;
 
 	return 0;
 }
-- 
2.16.2
