From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 00/21] ASoC: dmaengine updates, secondary CPU DAI for
 Odroid boards
Date: Tue, 12 Feb 2019 19:03:21 +0100
Message-ID: <20190212180342.32040-1-s.nawrocki@samsung.com>
References: <CGME20190212180438epcas1p3ae9da367bddb639b15638886f43f69e5@epcas1p3.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This series restores support for the secondary CPU DAI in samsung/i2s.c
driver and adds support for secondary CPU DAI on Odroid boards.

I have added 4 more clean up patches comparing to first version of the
patch set (16/22...19/22).

The first patch adds new platform device for the secondary PCM, I tried to
avoid registering new platform device in probe() as it doesn't play well
with deferred probing but couldn't find a way to avoid that new device,
unique devices are needed to register "PCM" components for each CPU DAI.

Patches 2/21...11/21 are mostly a clean up, following conversion to single
component with multiple DAIs, allowing to reference both primary/secondary
DAI in DT.

The patch set has been tested on Odroid U3, XU3, XU4 and Mini2440
(s3c2440 non-DT) boards.

Changes since v1 ((addressing Krzysztof's review comments):
 - added a comment, whitespace change in patch 1/21
 - dropped unnecessary new line addition from patch 1/21

Sylwester Nawrocki (21):
  ASoC: samsung: i2s: Restore support for the secondary PCM
  ASoC: samsung: i2s: Move clk supplier data to common driver data
    structure
  ASoC: samsung: i2s: Add widgets and routes for DPCM support
  ASoC: samsung: i2s: Move core clk to the driver common data structure
  ASoC: samsung: i2s: Move opclk data to common driver data structure
  ASoC: samsung: i2s: Move registers cache to common driver data
    structure
  ASoC: samsung: i2s: Move SFR pointer to common driver data structure
  ASoC: samsung: i2s: Drop spinlock pointer from i2s_dai data structure
  ASoC: samsung: i2s: Move IP variant data to common driver data
    structure
  ASoC: samsung: i2s: Move quirks data to common driver data structure
  ASoC: samsung: i2s: Get rid of a static spinlock
  ASoC: samsung: odroid: Add support for secondary CPU DAI
  ASoC: samsung: Specify DMA channel names through custom DMA config
  ASoC: samsung: Drop DAI DMA data chan_name assignments
  ASoC: dmaengine: Remove unused
    SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag
  ASoC: samsung: i2s: Simplify pri_dai, sec_dai pointers usage
  ASoC: samsung: i2s: Change indentation in SAMSUNG_I2S_FMTS definition
  ASoC: samsung: i2s: Comments clean up
  ASoC: samsung: i2s: Convert to SPDX License Indentifier
  ARM: dts: exynos5422-odroidxu3: Add support for secondary DAI
  ARM: dts: exynos5422-odroidxu4: Add support for secondary DAI

 .../boot/dts/exynos5422-odroidxu3-audio.dtsi  |   6 +-
 arch/arm/boot/dts/exynos5422-odroidxu4.dts    |   4 +-
 include/sound/dmaengine_pcm.h                 |   6 -
 sound/soc/samsung/dmaengine.c                 |  12 +-
 sound/soc/samsung/i2s.c                       | 543 ++++++++++--------
 sound/soc/samsung/odroid.c                    | 131 +++--
 sound/soc/samsung/s3c2412-i2s.c               |   4 +-
 sound/soc/samsung/s3c24xx-i2s.c               |   4 +-
 sound/soc/soc-generic-dmaengine-pcm.c         |  21 +-
 9 files changed, 413 insertions(+), 318 deletions(-)

--
2.20.1
