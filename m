From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 0/2] ARM: dts: exynos: Fix port nodes names for Snow and Peach Pit DTS
Date: Mon,  6 Jun 2016 16:24:42 -0400
Message-ID: <1465244684-23612-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Marc Zyngier <marc.zyngier@arm.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

This small series fixes the lookup for the lvds-to-eDP bridge found in
the Exynos5250 Snow and Exynos5420 Peach Pit Chromebooks. The problem
was introduced by the commits that fixed the recent DTC warnings and
it was that the OF graph logic expects the nodes to always be called
'port'.

So the correct fix for the DTC warnings is to add a '#address-cells',
'#size-cells' and 'reg' properties when there is more than one port.

Best regards,
Javier


Javier Martinez Canillas (2):
  ARM: dts: exynos: Fix port nodes names for Exynos5250 Snow board
  ARM: dts: exynos: Fix port nodes names for Exynos5420 Peach Pit board

 arch/arm/boot/dts/exynos5250-snow-common.dtsi | 13 ++++++++++---
 arch/arm/boot/dts/exynos5420-peach-pit.dts    | 13 ++++++++++---
 2 files changed, 20 insertions(+), 6 deletions(-)

-- 
2.5.5
