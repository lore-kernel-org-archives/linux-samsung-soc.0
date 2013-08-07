From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3 0/7] Add i2s nodes on Exynos5420 and enable sound support on
 sdmk5420
Date: Wed, 07 Aug 2013 14:20:32 +0530
Message-ID: <1375865442-5323-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28527 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755786Ab3HGItT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 04:49:19 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: broonie@kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org

Changes since V2:
	- Seperated out driver side changes and dts changes in two
          patch sets
	- Added proper names for wm8994 regulators as commented by Mark
	- Moved common i2s nodes into the exynos5.dtsi
	- Added clock info in wm8994 node as requested by Mark.
	- Registered the 16.9MHz oscillator clock as fixed clock in the
	  machine file. Right now no user of this clock but as Mark requested
	  to add mclk info in wm8994 node, I added this part.

This patch set is dependent on the following i2c, dma and audio subsystem
clk controller patches.
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/20077
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/20661
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/20668

This patch set is made based on Kukjin Kim for-next branch.

Andrew Bresticker (1):
  ARM: dts: exynos5420: add i2s controllers

Padmavathi Venna (6):
  ARM: dts: Change i2s compatible string on exynos5250
  ARM: dts: Add i2c bus 1 and it's audio codec child node on smdk5420
  ARM: dts: exynos5250: move common i2s properties to exynos5 dtsi
  ARM: dts: Add osc clock node on smdk5420.
  ASoC: Samsung: wm8994: Register the osc clock.
  ARM: dts: Enable sound support on smdk5420

 arch/arm/boot/dts/exynos5.dtsi            |   21 ++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   17 +------
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   78 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi         |   32 ++++++++++++
 sound/soc/samsung/smdk_wm8994.c           |   12 +++++
 5 files changed, 144 insertions(+), 16 deletions(-)

-- 
1.7.4.4
