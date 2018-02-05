From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/8] ASoC: samsung: Add HDMI sound support for tm2 board
Date: Mon, 05 Feb 2018 16:43:55 +0100
Message-ID: <20180205154403.13520-1-s.nawrocki@samsung.com>
References: <CGME20180205154421epcas2p16072f713ea81f72b3f8230f6a9d412cf@epcas2p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, jcsing.lee@samsung.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This series adds support for HDMI audio on exynos5433 tm2 board, it
includes a few fixes for the I2S driver and an extension of the existing
card driver to support the I2S1<->HDMI transmitter path.

Sylwester Nawrocki (8):
  ASoC: samsung: i2s: Ensure the RCLK rate is properly determined
  ASoC: samsung: i2s: Ensure names of supplied clocks are unique
  ASoC: samsung: i2s: Prevent external abort on exynos5433 I2S1 access
  ASoC: samsung: i2s: Define the parameters list for SAMSUNG_I2S_OPCLK
  ASoC: samsung: Add support for HDMI audio on TM2 board
  ASoC: samsung: i2s: Update clock-output-names property documentation
  ASoC: samsung: Add missing #sound-dai-cells property documentation
  ASoC: samsung,tm2-audio DT binding documentation update

 .../bindings/sound/samsung,tm2-audio.txt           |  14 +-
 .../devicetree/bindings/sound/samsung-i2s.txt      |  22 +--
 sound/soc/samsung/i2s-regs.h                       |  11 +-
 sound/soc/samsung/i2s.c                            |  50 ++++--
 sound/soc/samsung/i2s.h                            |  11 +-
 sound/soc/samsung/tm2_wm5110.c                     | 180 ++++++++++++++++++---
 6 files changed, 229 insertions(+), 59 deletions(-)

--
2.14.2
