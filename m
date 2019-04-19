From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 00/27] ASoC: samsung: Convert to SPDX licence
	identifiers
Date: Fri, 19 Apr 2019 12:21:35 +0200
Message-ID: <20190419102202.4384-1-s.nawrocki@samsung.com>
References: <CGME20190419102218epcas1p25cd718c2fd6af8a5bb6408608dc87dd1@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch set converts remaining files under sound/asoc/samsung
to SPDX licence identifiers. While at it file paths are removed
from the comments header in some files.

If that's preferred I will squash and repost as one patch.

Sylwester Nawrocki (27):
  ASoC: samsung: arndale: Convert to SPDX License Identifier
  ASoC: samsung: bells: Convert to SPDX License Identifier
  ASoC: samsung: dmaengine: Convert to SPDX License Indentifier
  ASoC: samsung: h1940_uda1380: Convert to SPDX License Identifier
  ASoC: samsung: i2s: Convert to SPDX License Identifier
  ASoC: samsung: idma: Convert to SPDX License Identifier
  ASoC: samsung: jive_wm8750: Convert to SPDX License Identifier
  ASoC: samsung: littlemill: Convert to SPDX License Identifier
  ASoC: samsung: lowland: Convert to SPDX License Identifier
  ASoC: samsung: neo1973_wm8753: Convert to SPDX License Identifier
  ASoC: samsung: odroid: Convert to SPDX License Identifier
  ASoC: samsung: pcm: Convert to SPDX License Identifier
  ASoC: samsung: s3c-i2s-v2: Convert to SPDX License Identifier
  ASoC: samsung: s3c24xx-i2s: Convert to SPDX License Identifier
  ASoC: samsung: rx1950_uda1380: Convert to SPDX License Identifier
  ASoC: samsung: s3c2412-i2s: Convert to SPDX License Identifier
  ASoC: samsung: s3c24xx_simtec*: Convert to SPDX License Identifier
  ASoC: samsung: s3c24xx_uda134x: Convert to SPDX License Identifier
  ASoC: samsung: smartq_wm8987: Convert to SPDX License Identifier
  ASoC: samsung: smdk_spdif: Convert to SPDX License Identifier
  ASoC: samsung: smdk_wm8580: Convert to SPDX License Identifier
  ASoC: samsung: smdk_wm8994*: Convert to SPDX License Identifier
  ASoC: samsung: snow: Convert to SPDX License Identifier
  ASoC: samsung: spdif: Convert to SPDX License Identifier
  ASoC: samsung: speyside: Convert to SPDX License Identifier
  ASoC: samsung: tm2_wm5110: Convert to SPDX License Identifier
  ASoC: samsung: tobermory: Convert to SPDX License Identifier

 sound/soc/samsung/arndale_rt5631.c            | 17 ++++-------
 sound/soc/samsung/bells.c                     | 15 ++++------
 sound/soc/samsung/dma.h                       |  8 ++---
 sound/soc/samsung/dmaengine.c                 | 22 ++++----------
 sound/soc/samsung/h1940_uda1380.c             | 22 +++++---------
 sound/soc/samsung/i2s-regs.h                  |  8 +----
 sound/soc/samsung/i2s.h                       |  8 ++---
 sound/soc/samsung/idma.c                      | 20 +++++--------
 sound/soc/samsung/idma.h                      |  9 +-----
 sound/soc/samsung/jive_wm8750.c               | 19 +++++-------
 sound/soc/samsung/littlemill.c                | 15 ++++------
 sound/soc/samsung/lowland.c                   | 15 ++++------
 sound/soc/samsung/neo1973_wm8753.c            | 25 +++++++---------
 sound/soc/samsung/odroid.c                    | 10 ++-----
 sound/soc/samsung/pcm.c                       | 19 +++++-------
 sound/soc/samsung/pcm.h                       |  8 +----
 sound/soc/samsung/regs-i2s-v2.h               | 10 ++-----
 sound/soc/samsung/regs-iis.h                  |  7 ++---
 sound/soc/samsung/rx1950_uda1380.c            | 30 ++++++++-----------
 sound/soc/samsung/s3c-i2s-v2.c                | 26 +++++++---------
 sound/soc/samsung/s3c-i2s-v2.h                | 11 ++-----
 sound/soc/samsung/s3c2412-i2s.c               | 28 +++++++----------
 sound/soc/samsung/s3c2412-i2s.h               | 11 ++-----
 sound/soc/samsung/s3c24xx-i2s.c               | 25 +++++++---------
 sound/soc/samsung/s3c24xx-i2s.h               |  6 +---
 sound/soc/samsung/s3c24xx_simtec.c            | 11 ++-----
 sound/soc/samsung/s3c24xx_simtec.h            | 10 ++-----
 sound/soc/samsung/s3c24xx_simtec_hermes.c     | 11 ++-----
 .../soc/samsung/s3c24xx_simtec_tlv320aic23.c  | 11 ++-----
 sound/soc/samsung/s3c24xx_uda134x.c           | 20 +++++--------
 sound/soc/samsung/smartq_wm8987.c             | 21 +++++--------
 sound/soc/samsung/smdk_spdif.c                | 16 ++++------
 sound/soc/samsung/smdk_wm8580.c               | 15 +++-------
 sound/soc/samsung/smdk_wm8994.c               |  9 +-----
 sound/soc/samsung/smdk_wm8994pcm.c            | 16 ++++------
 sound/soc/samsung/snow.c                      | 15 ++--------
 sound/soc/samsung/spdif.c                     | 17 ++++-------
 sound/soc/samsung/spdif.h                     |  8 ++---
 sound/soc/samsung/speyside.c                  | 15 ++++------
 sound/soc/samsung/tm2_wm5110.c                | 17 ++++-------
 sound/soc/samsung/tobermory.c                 | 15 ++++------
 41 files changed, 200 insertions(+), 421 deletions(-)

-- 
2.17.1
