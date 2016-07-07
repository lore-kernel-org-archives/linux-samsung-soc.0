From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v4 0/2] mark spi clocks as critical and enable spi3 clocks
Date: Thu, 07 Jul 2016 21:13:55 +0900
Message-ID: <1467893637-12573-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57169 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750947AbcGGMOF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Jul 2016 08:14:05 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>

Hi,

I managed to bring some confusion on these two patches, but
finally I managed to find the right solution (which is similar to
the patch version 2).

The real issue was hidden in the spi bus as reported in the
following patch:

  https://lkml.org/lkml/2016/7/7/81

This patch in principle replaces the clock_ignore_unused flags in
for the spi and enables the spi3 that in the tm2(e) board will be
connected to the IR remote controller.

Changelog:

V1 -> V2
 - the "sclk_spi3" doesn't need to be enabled in boot time as it
  is handled by the spi driver itself.

 - use the CLK_IS_CRITICAL flag for the ioclk

V2 -> V3
 - some more tests has confirmed taht "sclk_spi1,3" need to be
   enabled as critical!

 - added Chanwoo's review in the second commit.

V3 -> V4
 - patch V3 was wrong, back to patch v2.

 - reworded the commit of patch no. 1

Thanks,
Andi

Andi Shyti (2):
  clk: exynos5433: do not use CLK_IGNORE_UNUSED for SPI clocks
  clk: exynos5433: enable sclk_ioclk for SPI3

 drivers/clk/samsung/clk-exynos5433.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.8.1
