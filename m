From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC 00/14] ASoC: samsung: Add clk provider for I2S internal
 clocks
Date: Thu, 11 Dec 2014 18:45:38 +0100
Message-ID: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42857 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932412AbaLKRqZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Dec 2014 12:46:25 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NGF00MTXIPBDP40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Dec 2014 02:46:23 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: broonie@kernel.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This series is an attempt to resolve the CDCLK clock gating issue on Odroid
X2/U3 reported by Daniel Drake [1], by exposing the CDCLK gate clock through
clk API.  The remaining clocks (mux and divider) are also exposed, so the
clk API could be already used instead of the set_sysclk() calls in the machine
drivers.

I need some more thought about interaction between the clk API calls on the
clocks being exposed and the ASoC calls into sound/soc/samsung/i2s.c.
I'm sending teh patches for review though to avoid any waste of time should
it turn out the direction taken is wrong.

This whole series definitely needs more testing, so far I only tested it
on Odroid X2, with the I2S working in slave mode.

[1] http://mailman.alsa-project.org/pipermail/alsa-devel/2014-September/081753.html

Sylwester Nawrocki (14):
  ASoC: samsung: i2s: Remove unused gpios field from struct i2s
  ASoC: samsung: i2s: samsung_i2s_get_driver_data() cleanup
  ASoC: samsung: i2s: Add return value checks in probe()
  ASoC: samsung: i2s: Request memory region in driver probe()
  ASoC: samsung: i2s: Move clk_get() to platform driver probe()
  ASoC: samsung: i2s: Move clk enable to the platform driver probe()
  ASoC: samsung: i2s: Add get_other_dai helper function
  ASoC: samsung: i2s: Remove an unneeded goto usage
  ASoC: samsung: i2s: Add spinlock in place of local_irq_* calls
  ASoC: samsung: i2s: Protect access to more registers with a spinlock
  ASoC: samsung: odroidx2: Handle I2S CDCLK clock conditionally
  ASoC: samsung: i2s: Add clock provider for the I2S internal clocks
  ARM: dts: Exynos4 and Odroid X2/U3 sound device nodes update
  ARM: dts: Switch Odroid X2/U2 to simple-audio-card

 .../devicetree/bindings/sound/samsung-i2s.txt      |   18 +-
 arch/arm/boot/dts/exynos4.dtsi                     |    9 +
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    |   26 +-
 arch/arm/boot/dts/exynos4412-odroidu3.dts          |    8 +-
 arch/arm/boot/dts/exynos4412-odroidx2.dts          |    8 +-
 sound/soc/samsung/i2s.c                            |  365 ++++++++++++--------
 sound/soc/samsung/odroidx2_max98090.c              |    6 +-
 7 files changed, 282 insertions(+), 158 deletions(-)

--
1.7.9.5
