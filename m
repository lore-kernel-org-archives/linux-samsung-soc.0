From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 00/13] ASoC: dmaengine updates,
 secondary CPU DAI for Odroid boards
Date: Wed, 13 Feb 2019 19:41:59 +0100
Message-ID: <20190213184212.5473-1-s.nawrocki@samsung.com>
References: <CGME20190213184252epcas1p131e1023b7f6ec280e880b160a4a96345@epcas1p1.samsung.com>
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

This is a rebased version with the build break fixed and added Krzysztof's 
Acks. My apologies, I double checked there is no build errors between patches 
this time.

Below is cover letter text from v2.

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

Sylwester Nawrocki (13):
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

 include/sound/dmaengine_pcm.h         |   6 -
 sound/soc/samsung/dmaengine.c         |  12 +-
 sound/soc/samsung/i2s.c               | 297 +++++++++++++-------------
 sound/soc/samsung/odroid.c            | 131 ++++++++----
 sound/soc/samsung/s3c2412-i2s.c       |   4 +-
 sound/soc/samsung/s3c24xx-i2s.c       |   4 +-
 sound/soc/soc-generic-dmaengine-pcm.c |  21 +-
 7 files changed, 250 insertions(+), 225 deletions(-)

-- 
2.17.1
