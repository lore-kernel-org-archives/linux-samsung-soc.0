From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: doc: Fix typos in dpcm.rst
Date: Thu, 07 Feb 2019 18:22:56 +0100
Message-ID: <20190207172256.1972-1-s.nawrocki@samsung.com>
References: <CGME20190207172309epcas1p411f0d5d58ee8aee8d47bd836641d07fe@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch fixes a few typos in the DPCM documentation.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
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
