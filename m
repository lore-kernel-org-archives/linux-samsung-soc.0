From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v4 0/4] ASoC: samsung: Sound support for Exynos5433 TM2(E)
 boards
Date: Tue, 05 Jul 2016 19:12:14 +0200
Message-ID: <1467738734-31362-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32871 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752413AbcGERMr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 13:12:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, lee.jones@linaro.org
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, ideal.song@samsung.com, inki.dae@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch series adds a MFD driver for Samsung Exynos5433 SoC Low Power
Audio Subsystem and an ASoC machine driver for Exynos5433 based TM2/TM2E
boards.

The changes since v3 are listed in individual patches, the main change
was rewriting LPASS driver as a MFD driver. It seems much better now
as the dependencies between LPASS Top block and its IP sub-blocks are
properly taken care of.

Sylwester Nawrocki (4):
  mfd: Add DT bindings documentation for Samsung Exynos LPASS
  mfd: Add Samsung Exynos Low Power Audio Subsystem driver
  ASoC: samsung: Add DT bindings documentation for TM2 sound subsystem
  ASoC: samsung: Add machine driver for Exynos5433 based TM2 board

 .../bindings/mfd/samsung,exynos5433-lpass.txt      |  21 +
 .../bindings/sound/samsung,tm2-audio.txt           |  36 ++
 drivers/mfd/Kconfig                                |   8 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/exynos-lpass.c                         | 185 +++++++
 include/linux/mfd/syscon/exynos5-pmu.h             |   4 +-
 sound/soc/samsung/Kconfig                          |   9 +
 sound/soc/samsung/Makefile                         |   2 +
 sound/soc/samsung/tm2_wm5110.c                     | 579 +++++++++++++++++++++
 9 files changed, 844 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
 create mode 100644 drivers/mfd/exynos-lpass.c
 create mode 100644 sound/soc/samsung/tm2_wm5110.c

--
1.9.1
