From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/5] Runtime PM support for Exynos I2S driver
Date: Thu, 29 Dec 2016 12:34:02 +0100
Message-ID: <1483011247-21613-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20161229113425eucas1p2f95b915a9a66df3e3ff8431b5625b926@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35877 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751315AbcL2Lea (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 06:34:30 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OIY00BVL2TES400@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2016 11:34:27 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

Exynos I2S audio controller was missing proper runtime PM implementation
and this patchset addresses this issue.

This patchset is a another step to add support for audio power domain on
Exynos5 SoCs.

Audio power domain on Exynos5 SoCs contains following hardware modules:
1. clock controller
2. pin controller
3. PL330 DMA controller
4. I2S audio controller

The other patches related to enabling full support for audio power domain
can be found here:
1. PL330 ADMA controller non-irqsafe runtime PM:
   https://www.spinics.net/lists/arm-kernel/msg550008.html
2. Runtime PM for clock controllers (Exynos Audio subsystem will be added
   in v4 soon): https://www.spinics.net/lists/arm-kernel/msg538122.html
3. Runtime PM support for pin controller:
   https://www.spinics.net/lists/linux-samsung-soc/msg56674.html

Patches are based on linux-next from 2016.12.24. Tested on Odroid U3
(Exynos4412), Odroid XU3 (Exynos5422) and TM2 (Exynos5433) boards.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (5):
  ASoC: samsung: i2s: Remove virtual device for secondary DAI
  ASoC: samsung: i2s: Ensure proper runtime PM state of I2S device
  ASoC: samsung: i2s: Move saving and restoring regs to runtime pm
    operations
  ASoC: samsung: i2s: Let runtime PM operations to control op_clk too
  ASoC: samsung: i2s: Provide I2S device for registered clocks

 sound/soc/samsung/i2s.c | 193 +++++++++++++++++++++++-------------------------
 1 file changed, 92 insertions(+), 101 deletions(-)

-- 
1.9.1
