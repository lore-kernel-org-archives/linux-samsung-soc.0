From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: odroid: Drop sample rates that
	cannot be supported from hw_params()" to the asoc tree
Date: Mon, 19 Mar 2018 01:47:16 +0000 (GMT)
Message-ID: <20180319014716.C7BCF440079@finisterre.ee.mobilebroadband>
References: <20180314164115.22736-2-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180314164115.22736-2-s.nawrocki@samsung.com>
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

   ASoC: samsung: odroid: Drop sample rates that cannot be supported from hw_params()

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

>From 23952006ace5a54caddcda3de6f7676dfe520e86 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Wed, 14 Mar 2018 17:41:14 +0100
Subject: [PATCH] ASoC: samsung: odroid: Drop sample rates that cannot be
 supported from hw_params()

The I2S controller can handle sample rates only up to 96000 and the CPU DAI
has already related constraint set so drop the impossible 176400, 192000
switch cases.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/odroid.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index e698e67f5f84..e1b59457a327 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -46,14 +46,12 @@ static int odroid_card_hw_params(struct snd_pcm_substream *substream,
 		break;
 	case 44100:
 	case 88200:
-	case 176400:
 		pll_freq = 180633609U;
 		rfs = 512;
 		break;
 	case 32000:
 	case 48000:
 	case 96000:
-	case 192000:
 		pll_freq = 196608001U;
 		rfs = 512;
 		break;
-- 
2.16.2
