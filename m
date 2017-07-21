From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: samsung: odroid: Fix EPLL frequency values" to the asoc tree
Date: Fri, 21 Jul 2017 17:45:59 +0100
Message-ID: <E1dYb3v-0005ms-IX@debutante>
References: <1500654560-29516-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52692 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750849AbdGUQqI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jul 2017 12:46:08 -0400
In-Reply-To: <1500654560-29516-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, b.zolnierkie@samsung.comalsa-devel@alsa-project.org

The patch

   ASoC: samsung: odroid: Fix EPLL frequency values

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

>From 9d154e42a338a4142e7a656d662ebf98c4ceb26b Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 21 Jul 2017 18:29:20 +0200
Subject: [PATCH] ASoC: samsung: odroid: Fix EPLL frequency values

To prevent incorrect setting of the EPLL the clock frequency
values are changed to exact values as possible to obtain on
the EPLL output with given PLL coefficients.
This patch is required after recent change of the EPLL rate
table by patch
"clk: samsung: exynos5420: The EPLL rate table corrections".

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/odroid.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 0c0b00e40646..0834319ead42 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -42,17 +42,17 @@ static int odroid_card_hw_params(struct snd_pcm_substream *substream,
 	switch (params_rate(params)) {
 	case 32000:
 	case 64000:
-		pll_freq = 131072000U;
+		pll_freq = 131072006U;
 		break;
 	case 44100:
 	case 88200:
 	case 176400:
-		pll_freq = 180633600U;
+		pll_freq = 180633609U;
 		break;
 	case 48000:
 	case 96000:
 	case 192000:
-		pll_freq = 196608000U;
+		pll_freq = 196608001U;
 		break;
 	default:
 		return -EINVAL;
-- 
2.13.2
