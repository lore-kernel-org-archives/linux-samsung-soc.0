From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v3 0/4] regulator: max77686/trats2: Disable some regulators in
 suspend
Date: Tue, 21 Oct 2014 15:19:51 +0200
Message-ID: <1413897595-28752-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,


Changes since v2
================
1. Patch 1/4: Fully describe different values used for controlling
   the regulators (low power modes, enable, disable). Remove "opmode"
   from new defines. Suggested by Javier.
2. Patch 2/4: minor nits after changing patch 1.
3. Add Javier's reviewed-by to 2, 3 and 4 patch.
4. Patch 3/4 (changes in documentation) should be picked up by Lee
   Jones but I'm resending it anyway.

Changes since v1
================
1. Add patch 1/4 and 3/4.
2. Patch 2/4: Extend existing set_suspend_disable (for bucks) with
   LDO support. Implement set_suspend_enable. Suggested by Javier.
3. Patch 4/4: Add regulator suspend properties only to regulators
   actually supporting this. Other regulators, not implementing
   suspend enable/disable, will warn ("VCC_1.8V_IO: No configuration").
4. Patch 4/4: In suspend enable VHSIC_1.0V and VHSIC_1.8V regulators.
   Suggested by Chanwoo Choi.


Description
===========
This patchset makes use of Javier Martinez Cainllas changes [1].
It allows disabling some of the regulators during suspend to RAM.

Javier's patchset is necessary only to test it.

[1] [PATCH v3 0/2] ARM: EXYNOS: Call regulator suspend prepare/finish
    https://lkml.org/lkml/2014/10/20/545


Best regards,
Krzysztof


Krzysztof Kozlowski (4):
  regulator: max77686: Replace hard-coded opmode values with defines
  regulator: max77686: Implement suspend disable for some LDOs
  mfd/regulator: dt-bindings: max77686: Document regulators off in
    suspend
  ARM: dts: exynos4412-trats: Add suspend configuration for max77686
    regulators

 Documentation/devicetree/bindings/mfd/max77686.txt |  6 ++
 arch/arm/boot/dts/exynos4412-trats2.dts            | 72 ++++++++++++---------
 drivers/regulator/max77686.c                       | 73 ++++++++++++++++++----
 3 files changed, 108 insertions(+), 43 deletions(-)

-- 
1.9.1
