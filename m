From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 0/8] regulator: max77686: Add GPIO control
Date: Wed, 29 Oct 2014 16:06:38 +0100
Message-ID: <1414595206-1437-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,


Patch 2/8: not tested on hardware. I am kindly asking for testing it
because I don't have the board with Maxim 77802.

Changes since v1
================
1. Add patch: 1/8 "regulator: max77686: Consistently index opmode
   array by rdev id".
2. Remove patch "regulator: max77686: Make regulator_desc array
   const" (applied).
3. Re-work patches removing from regulators board file support (2/8
   and 3/8). Parse regulators with of_regulator_match() at once, remove
   num_regulators.
4. Patch 4/8: Add depends on OF to mfd/Kconfig. Add Javier's
   reviewed-by.
5. Patch 5/8: Add Javier's reviewed-by.
6. Patch 6/8: Add depends on GPIOLIB to regulator/Kconfig. Rename
   "external control" to "GPIO control" and "ext_control_gpios" to
   simpler "gpios".
   I tried to use new GPIO API but it ended with more problems
   https://lkml.org/lkml/2014/10/29/239


Description
===========
This patch helps in proper description of max77686 regulators in DTS by
allowing to control them over GPIO. This allows removal of
fixed regulators from DTS which duplicate the description of hardware.

The first five patches are cleanups, including board support removal.

The whole patchset should be taken at once.

Patchset is rebased on next-20141023 AND:
1. ARM: EXYNOS: Call regulator suspend prepare/finish
   https://lkml.org/lkml/2014/10/20/545
2. regulator: max77686/trats2: Disable some regulators in suspend
   https://lkml.org/lkml/2014/10/27/280


Best regards,
Krzysztof

Krzysztof Kozlowski (8):
  regulator: max77686: Consistently index opmode array by rdev id
  regulator: max77802: Remove support for board files
  regulator: max77686: Remove support for board files
  mfd: max77686/802: Remove support for board files
  regulator: max77686: Initialize opmode explicitly to normal mode
  regulator: max77686: Add GPIO control
  mfd/regulator: dt-bindings: max77686: Document gpio property
  ARM: dts: exynos4412-trats: Switch max77686 regulators to GPIO control

 Documentation/devicetree/bindings/mfd/max77686.txt |   3 +
 arch/arm/boot/dts/exynos4412-trats2.dts            |  25 +--
 drivers/mfd/Kconfig                                |   1 +
 drivers/mfd/max77686.c                             |  23 ---
 drivers/regulator/Kconfig                          |   1 +
 drivers/regulator/max77686.c                       | 179 ++++++++++++++-------
 drivers/regulator/max77802.c                       |  87 ++++------
 include/linux/mfd/max77686-private.h               |   1 -
 include/linux/mfd/max77686.h                       |  28 ----
 9 files changed, 166 insertions(+), 182 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
