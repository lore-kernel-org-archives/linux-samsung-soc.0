From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 00/22] ASoC: dmaengine updates,
 secondary CPU DAI for Odroid boards
Date: Thu, 07 Feb 2019 18:00:08 +0100
Message-ID: <20190207170028.720-1-s.nawrocki@samsung.com>
References: <CGME20190207170044epcas2p3d00762663b971845bc86db84af7d3b23@epcas2p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This series restores support for the secondary CPU DAI in samsung/i2s.c
driver and adds support for secondary CPU DAI on Odroid boards.

First two patches introduce changes in ASoC generic dmaengine driver
so as to use custom DMA config as introduced in commit
194c7dea00c6 "ASoC: dmaengine: add custom DMA config to snd_dmaengine_pcm_config"
for handling custom DMA channel names on all Samsung platforms.

Patches 7/22...16/22 are mostly clean up, following conversion to single
component with multiple DAIs in patch 5/22, allowing to reference both
primary/secondary DAI in DT.

I tried to avoid registering new platform device in probe() as it doesn't
play well with deferred probing but couldn't find a way to avoid that new
device, unique devices are needed to register "PCM" components for each
CPU DAI.

I am not entirely sure we should be removing the
SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag like this, it might all
be a bit more explicit with the flag.

The patch set has been tested on Odroid U3, XU3, XU4 and Mini2440
(s3c2440 non-DT) boards.

This series depends on patch
"ASoC: samsung: Prevent clk_get_rate() calls in atomic context"

Sylwester Nawrocki (22):
  ASoC: dmaengine: Improve of_node test in
    dmaengine_pcm_request_chan_of()
  ASoC: dmaengine: Extend use of chan_names provided in custom DMA
    config
  ASoC: samsung: dmaengine: Allow to specify custom DMA device
  ASoC: samsung: i2s: Fix prescaler setting for the secondary DAI
  ASoC: samsung: i2s: Convert to single component with multiple DAIs
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
  ARM: dts: exynos5422-odroidxu3: Add support for secondary DAI
  ARM: dts: exynos5422-odroidxu4: Add support for secondary DAI

 .../boot/dts/exynos5422-odroidxu3-audio.dtsi  |   6 +-
 arch/arm/boot/dts/exynos5422-odroidxu4.dts    |   4 +-
 include/sound/dmaengine_pcm.h                 |   6 -
 sound/soc/samsung/dma.h                       |   3 +-
 sound/soc/samsung/dmaengine.c                 |  16 +-
 sound/soc/samsung/i2s.c                       | 630 ++++++++++--------
 sound/soc/samsung/odroid.c                    | 132 +++-
 sound/soc/samsung/pcm.c                       |   2 +-
 sound/soc/samsung/s3c2412-i2s.c               |   4 +-
 sound/soc/samsung/s3c24xx-i2s.c               |   4 +-
 sound/soc/samsung/spdif.c                     |   2 +-
 sound/soc/soc-generic-dmaengine-pcm.c         |  13 +-
 12 files changed, 489 insertions(+), 333 deletions(-)

--
2.20.1
