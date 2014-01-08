From: Tomasz Figa <t.figa@samsung.com>
Subject: [GIT PULL] Samsung Clock changes for v3.14
Date: Wed, 08 Jan 2014 20:13:38 +0100
Message-ID: <3518820.nAXoIq2LQG@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34441 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756115AbaAHTNq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jan 2014 14:13:46 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MZ300L1OK2WT970@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Jan 2014 19:13:44 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Mike,

Please consider pulling following Samsung Clock changes for v3.14.

The following changes since commit 2bb00c68e094271b79deac993893461cc051b721:

  Merge branch 'samsung-fixes' into samsung-next-base (2013-12-30 18:15:23 +0100)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/tfiga/samsung-clk.git tags/for_3.14/samsung-clk

for you to fetch changes up to 59d711e9ddd2f68822a2a99fc939e11a9288b73e:

  ARM: dts: exynos5420: add input clocks to audss clock controller (2014-01-08 18:02:43 +0100)

----------------------------------------------------------------
(A bit late) first round of Samsung clock patches for v3.14.

----------------------------------------------------------------
Andrew Bresticker (7):
      clk: exynos5250: register APLL rate table
      clk: exynos-audss: convert to platform device
      clk: exynos-audss: allow input clocks to be specified in device tree
      clk: exynos5250: add clock ID for div_pcm0
      ARM: dts: exynos5250: add input clocks to audss clock controller
      clk: exynos-audss: add support for Exynos 5420
      ARM: dts: exynos5420: add input clocks to audss clock controller

Andrzej Hajda (8):
      ARM: exynos4: create a DT header defining CLK IDs
      clk: exynos4: replace clock ID private enums with IDs from DT header
      ARM: exynos5250: create a DT header defining CLK IDs
      clk: exynos5250: replace clock ID private enums with IDs from DT header
      ARM: exynos5420: create a DT header defining CLK IDs
      clk: exynos5420: replace clock ID private enums with IDs from DT header
      ARM: exynos5440: create a DT header defining CLK IDs
      clk: exynos5440: replace clock ID private enums with IDs from DT header

Sachin Kamat (1):
      clk: exynos5250: Add CLK_SET_RATE_PARENT flag to mout_apll

Tomasz Figa (7):
      clk: samsung: exynos5250: Sort definitions by registers and bitfield
      clk: samsung: exynos5250: Make names of mux and div clocks consistent
      clk: samsung: exynos5250: Fix parents of gate clocks from GSCL domain
      clk: samsung: exynos5250: Fix parent of gate clocks from DISP1 domain
      clk: samsung: exynos5250: Add missing unpopulated mux parents
      clk: samsung: exynos5250: Correct parent list of audio muxes
      clk: samsung: exynos5250: Fix parents of gate clocks from MFC domain

 .../devicetree/bindings/clock/clk-exynos-audss.txt |  39 +-
 .../devicetree/bindings/clock/exynos5250-clock.txt |   1 +
 arch/arm/boot/dts/exynos5250.dtsi                  |   2 +
 arch/arm/boot/dts/exynos5420.dtsi                  |   4 +-
 drivers/clk/samsung/clk-exynos-audss.c             | 159 +++-
 drivers/clk/samsung/clk-exynos4.c                  | 857 ++++++++++-----------
 drivers/clk/samsung/clk-exynos5250.c               | 699 ++++++++++-------
 drivers/clk/samsung/clk-exynos5420.c               | 648 ++++++++--------
 drivers/clk/samsung/clk-exynos5440.c               |  81 +-
 include/dt-bindings/clk/exynos-audss-clk.h         |   3 +-
 include/dt-bindings/clock/exynos4.h                | 244 ++++++
 include/dt-bindings/clock/exynos5250.h             | 160 ++++
 include/dt-bindings/clock/exynos5420.h             | 188 +++++
 include/dt-bindings/clock/exynos5440.h             |  42 +
 14 files changed, 1957 insertions(+), 1170 deletions(-)
 create mode 100644 include/dt-bindings/clock/exynos4.h
 create mode 100644 include/dt-bindings/clock/exynos5250.h
 create mode 100644 include/dt-bindings/clock/exynos5420.h
 create mode 100644 include/dt-bindings/clock/exynos5440.h
