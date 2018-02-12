From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 0/7] ASoC: samsung: Add HDMI sound support
	for tm2 board
Date: Mon, 12 Feb 2018 17:15:31 +0100
Message-ID: <20180212161538.22669-1-s.nawrocki@samsung.com>
References: <CGME20180212161554epcas2p26c19860d14006b0e1501699dc50d3f2f@epcas2p2.samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, jcsing.lee@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This series adds support for HDMI audio on exynos5433 tm2 board, it
includes a few fixes for the I2S driver and an extension of the existing
card driver to support the I2S1<->HDMI transmitter path.

In v2 only support for 48k/96k/192k samples rate is left, as adjusting
the AUD PLL output frequency might cause regressions.

Sylwester Nawrocki (7):
  ASoC: samsung: i2s: Update clock-output-names property documentation
  ASoC: samsung: i2s: Ensure names of supplied clocks are unique
  ASoC: samsung: i2s: Prevent external abort on exynos5433 I2S1 access
  ASoC: samsung: i2s: Define the parameters list for SAMSUNG_I2S_OPCLK
  ASoC: samsung,tm2-audio DT binding documentation update
  ASoC: samsung: Add support for HDMI audio on TM2 board
  ASoC: samsung: Add missing #sound-dai-cells property documentation

 .../bindings/sound/samsung,tm2-audio.txt           |  14 +-
 .../devicetree/bindings/sound/samsung-i2s.txt      |  22 +--
 sound/soc/samsung/i2s-regs.h                       |  11 +-
 sound/soc/samsung/i2s.c                            |  39 ++++--
 sound/soc/samsung/i2s.h                            |  11 +-
 sound/soc/samsung/tm2_wm5110.c                     | 152 +++++++++++++++++----
 6 files changed, 191 insertions(+), 58 deletions(-)

--
2.14.2
