From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk: more Exynos7 clock tree definitions
Date: Fri, 16 Jan 2015 19:36:52 +0100
Message-ID: <54B95A44.50105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:53418 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751896AbbAPSg7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jan 2015 13:36:59 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NIA008WB98AGV40@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Jan 2015 18:40:58 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>


Hi Mike,

Please find below a few clk updates for exynos7 SoC. I kept them on
a separate branch as there will likely be depending dts patches.
Please pull for 3.20.

The following changes since commit 97bf6af1f928216fd6c5a66e8a57bfa95a659672:

  Linux 3.19-rc1 (2014-12-20 17:08:50 -0800)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/for-v3.20-exynos7-clk

for you to fetch changes up to 9f930a39e135d370d17e7a1ab73ddebcfb896f98:

  clk: samsung: exynos7: add clocks for audio block (2015-01-15 15:18:51 +0100)

----------------------------------------------------------------
- Clock definitions for Exynos7 SoC peripheral devices:
  video scaler, USB, DMA, SPI and the audio subsystem.

----------------------------------------------------------------
Padmavathi Venna (3):
      clk: samsung: exynos7: add gate clock for DMA block
      clk: samsung: exynos7: add clocks for SPI block
      clk: samsung: exynos7: add clocks for audio block

Tony K Nadackal (1):
      clk: samsung: exynos7: Add clocks for MSCL block

Vivek Gautam (1):
      clk: samsung: exynos7: Add required clock tree for USB

 .../devicetree/bindings/clock/exynos7-clock.txt    |   15 +
 drivers/clk/samsung/clk-exynos7.c                  |  408 +++++++++++++++++++-
 include/dt-bindings/clock/exynos7-clk.h            |   88 ++++-
 3 files changed, 505 insertions(+), 6 deletions(-)

Thanks,
Sylwester
