From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 0/3] ARM: dts: Regulator changes and fuel gauge for
 exynos4412-trats2
Date: Thu, 15 Jan 2015 09:41:32 +0100
Message-ID: <1421311295-18960-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,


I grouped into one patchset already posted patches for Trats2 board:
1. Fuel gauge:
   https://lkml.org/lkml/2015/1/7/167
2. Suspend configuration for max77686 regulators:
   https://lkml.org/lkml/2014/10/29/262
3. GPIO control for max77686 regulators:
   https://lkml.org/lkml/2015/1/5/230


The necessary changes in max77686 regulator driver were already
applied by Mark Brown.

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  ARM: dts: exynos4412-trats2: Add Maxim 77693 fuel gauge node
  ARM: dts: exynos4412-trats2: Add suspend configuration for max77686
    regulators
  ARM: dts: exynos4412-trats: Switch max77686 regulators to GPIO control

 arch/arm/boot/dts/exynos4412-trats2.dts | 115 ++++++++++++++++++--------------
 1 file changed, 65 insertions(+), 50 deletions(-)

-- 
1.9.1
