From: Tomasz Figa <t.figa@samsung.com>
Subject: [GIT PULL] Samsung Clock fixes for v3.13
Date: Thu, 02 Jan 2014 17:14:41 +0100
Message-ID: <3900474.uee5rn6pUr@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35626 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751372AbaABQOp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jan 2014 11:14:45 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MYS00FMR7SJNS70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Jan 2014 16:14:43 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: mturquette@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Mike,

Please consider the following Samsung Clock fixes for v3.13.

The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:

  Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tfiga/samsung-clk.git tags/samsung-clk-fixes

for you to fetch changes up to 3fd68c99f3026f4fe3a1b7b6fb75e5638b2032fd:

  clk: exynos: File scope reg_save array should depend on PM_SLEEP (2013-12-30 18:01:09 +0100)

----------------------------------------------------------------
Samsung Clock fixes for v3.13-rc7

* Several patches fixing up incorrectly defined register addresses and
  bitfield offsets that could lead to undefined operation when accessing
  respective registers or bitfields.

 1) clk: exynos5250: fix sysmmu_mfc{l,r} gate clocks

 2a) clk: samsung: exynos5250: Fix ACP gate register offset
 2b) clk: samsung: exynos5250: Add MDMA0 clocks
 2c) ARM: dts: exynos5250: Fix MDMA0 clock number

 3) clk: samsung: exynos4: Correct SRC_MFC register

   All three issues have been present since Exynos5250 and Exynos4 clock
   drivers were added by commits 6e3ad26816b72 ("clk: exynos5250:
   register clocks using common clock framework") and e062b571777f5
   ("clk: exynos4: register clocks using common clock framework")
   respectively.

* Patch to fix automatic disabling of Exynos5250 sysreg clock that could
  cause undefined operation of several peripherals, such as USB, I2C,
  MIPI or display block.

 4) clk: samsung: exynos5250: Add CLK_IGNORE_UNUSED flag for the sysreg
    clock

   Present since Exynos5250 clock drivers was added by commits
   6e3ad26816b72 ("clk: exynos5250: register clocks using common clock
   framework").

* Patch fixing compilation warning in clk-exynos-audss driver when
  CONFIG_PM_SLEEP is disabled.

 5) clk: exynos: File scope reg_save array should depend on PM_SLEEP

   Present since the driver was added by commit 1241ef94ccc3 ("clk:
   samsung: register audio subsystem clocks using common clock
   framework").

----------------------------------------------------------------
Abhilash Kesavan (4):
      clk: samsung: exynos5250: Fix ACP gate register offset
      clk: samsung: exynos5250: Add MDMA0 clocks
      ARM: dts: exynos5250: Fix MDMA0 clock number
      clk: samsung: exynos5250: Add CLK_IGNORE_UNUSED flag for the sysreg clock

Andrew Bresticker (1):
      clk: exynos5250: fix sysmmu_mfc{l,r} gate clocks

Krzysztof Kozlowski (1):
      clk: exynos: File scope reg_save array should depend on PM_SLEEP

Seung-Woo Kim (1):
      clk: samsung: exynos4: Correct SRC_MFC register

 .../devicetree/bindings/clock/exynos5250-clock.txt         |  2 ++
 arch/arm/boot/dts/exynos5250.dtsi                          |  2 +-
 drivers/clk/samsung/clk-exynos-audss.c                     | 10 +++++-----
 drivers/clk/samsung/clk-exynos4.c                          |  2 +-
 drivers/clk/samsung/clk-exynos5250.c                       | 14 +++++++++-----
 5 files changed, 18 insertions(+), 12 deletions(-)
