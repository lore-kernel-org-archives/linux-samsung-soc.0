From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 00/10] Basic sound support for Arndale board / wm8994
 updates
Date: Fri, 20 Sep 2019 15:02:09 +0200
Message-ID: <20190920130218.32690-1-s.nawrocki@samsung.com>
References: <CGME20190920130238eucas1p147fca337fa84592ac7f83760449e26a1@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: broonie@kernel.org, krzk@kernel.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch series adds basic audio support for Exynos5250 SoC based Arndale 
board, the Bluetooth receiver source and HDMI output are not covered yet.

There is also one fix for wm8994 driver related to WM1811 CODEC and wm8994
updates to handle MCLK clocks, similar to patches:
 ae1ea48c5c59 ("ASoC: arizona: Add gating for source clocks of the FLLs")
 7a4413d0dc96 ("ASoC: arizona: Add gating for clock when used for direct MCLK")

The main changes since v1:
 - Fixed bug in "ASoC: wm8994: Add support for MCLKn clock gating" patch
   (thanks to Charles),
 - dropped the MFD part patch and moved getting of clocks to the CODEC driver,
 - Added missing Kconfig entries to patch "ASoC: samsung: arndale: Add 
   support for WM1811 CODEC",
 - Added a patch renaming the driver and a patch for exynos_defconfig.

Sylwester Nawrocki (10):
  ASoC: wm8994: Do not register inapplicable controls for WM1811
  ASoC: samsung: arndale: Add missing OF node dereferencing
  ASoC: wm8994: Add support for setting MCLK clock rate
  ASoC: wm8994: Add support for MCLKn clock gating
  ASoC: samsung: arndale: Simplify DAI link initialization
  ASoC: dt-bindings: Document "samsung,arndale-wm1811" compatible
  ASoC: samsung: arndale: Add support for WM1811 CODEC
  ASoC: samsung: Rename Arndale card driver
  ARM: dts: arndale: Add audio support (WM1811 CODEC boards)
  ARM: exynos_defconfig: Enable Arndale audio driver

 .../devicetree/bindings/sound/arndale.txt     |   5 +-
 arch/arm/boot/dts/exynos5250-arndale.dts      |  27 ++-
 arch/arm/configs/exynos_defconfig             |   1 +
 sound/soc/codecs/wm8994.c                     | 199 +++++++++++++---
 sound/soc/codecs/wm8994.h                     |  10 +-
 sound/soc/samsung/Kconfig                     |  12 +-
 sound/soc/samsung/Makefile                    |   4 +-
 sound/soc/samsung/arndale.c                   | 217 ++++++++++++++++++
 sound/soc/samsung/arndale_rt5631.c            | 138 -----------
 9 files changed, 438 insertions(+), 175 deletions(-)
 create mode 100644 sound/soc/samsung/arndale.c
 delete mode 100644 sound/soc/samsung/arndale_rt5631.c

-- 
2.17.1
