From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [RESEND PATCH v2 0/6] ARM: dts: Use correct CD properties for SDIO and eMMC in Snow and Peach
Date: Wed, 18 Nov 2015 10:23:48 -0300
Message-ID: <1447853034-22508-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof and Kukjin,

This is a resend of a series posted a month ago [0] that use the correct
card detection properties in the DTS for Exynos Chromebooks but that was
never picked.

The patches have no changed, the only difference is that I'm including
all the Reviewed-by and Tested-by tags that were previously collected.

[0]: https://lkml.org/lkml/2015/10/15/640

Best regards,
Javier


Javier Martinez Canillas (6):
  ARM: dts: Mark SDIO as non-removable in exynos5800-peach-pi
  ARM: dts: Mark SDIO as non-removable in exynos5420-peach-pit
  ARM: dts: Mark SDIO as non-removable in exynos5250-snow-common
  ARM: dts: Remove broken-cd from eMMC node in exynos5800-peach-pi
  ARM: dts: Remove broken-cd from eMMC node in exynos5420-peach-pi
  ARM: dts: Mark eMMC as non-removable in exynos5250-snow-common

 arch/arm/boot/dts/exynos5250-snow-common.dtsi | 6 ++----
 arch/arm/boot/dts/exynos5420-peach-pit.dts    | 5 +----
 arch/arm/boot/dts/exynos5800-peach-pi.dts     | 5 +----
 3 files changed, 4 insertions(+), 12 deletions(-)

-- 
2.4.3
