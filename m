From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: doc: Fix typos in dpcm.rst" to the asoc tree
Date: Fri,  8 Feb 2019 13:11:18 +0000 (GMT)
Message-ID: <20190208131118.691071127F30@debutante.sirena.org.uk>
References: <20190207172256.1972-1-s.nawrocki@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207172256.1972-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>broonie@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.comalsa-devel@alsa-project.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: doc: Fix typos in dpcm.rst

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

>From 511d53ac86746f397791e7c4bd47993244fc7420 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Thu, 7 Feb 2019 18:22:56 +0100
Subject: [PATCH] ASoC: doc: Fix typos in dpcm.rst

This patch fixes a few typos in the DPCM documentation.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/sound/soc/dpcm.rst | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index f6845b2278ea..77f67ded53de 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -13,7 +13,7 @@ drivers that expose several ALSA PCMs and can route to multiple DAIs.
 The DPCM runtime routing is determined by the ALSA mixer settings in the same
 way as the analog signal is routed in an ASoC codec driver. DPCM uses a DAPM
 graph representing the DSP internal audio paths and uses the mixer settings to
-determine the patch used by each ALSA PCM.
+determine the path used by each ALSA PCM.
 
 DPCM re-uses all the existing component codec, platform and DAI drivers without
 any modifications.
@@ -101,7 +101,7 @@ The audio driver processes this as follows :-
 
 4. Machine driver or audio HAL enables the speaker path.
 
-5. DPCM runs the PCM ops for startup(), hw_params(), prepapre() and
+5. DPCM runs the PCM ops for startup(), hw_params(), prepare() and
    trigger(start) for DAI1 Speakers since the path is enabled.
 
 In this example, the machine driver or userspace audio HAL can alter the routing
@@ -221,7 +221,7 @@ like a BT phone call :-
 This allows the host CPU to sleep while the DSP, MODEM DAI and the BT DAI are
 still in operation.
 
-A BE DAI link can also set the codec to a dummy device if the code is a device
+A BE DAI link can also set the codec to a dummy device if the codec is a device
 that is managed externally.
 
 Likewise a BE DAI can also set a dummy cpu DAI if the CPU DAI is managed by the
@@ -249,7 +249,7 @@ configuration.
 	struct snd_interval *channels = hw_param_interval(params,
 						SNDRV_PCM_HW_PARAM_CHANNELS);
 
-	/* The DSP will covert the FE rate to 48k, stereo */
+	/* The DSP will convert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
@@ -386,5 +386,3 @@ This means creating a new FE that is connected with a virtual path to both
 DAI links. The DAI links will be started when the FE PCM is started and stopped
 when the FE PCM is stopped. Note that the FE PCM cannot read or write data in
 this configuration.
-
-
-- 
2.20.1
