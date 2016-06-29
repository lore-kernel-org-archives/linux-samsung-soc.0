From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 0/6] ASoC: samsung: Sound support for Exynos5433 TM2(E)
 boards
Date: Wed, 29 Jun 2016 13:26:33 +0200
Message-ID: <1467199599-6892-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59745 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751407AbcF2L1F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 07:27:05 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, ideal.song@samsung.com, inki.dae@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch series adds sound support for the Exynos 5433 based TM2 and
TM2E board.  It includes minimal drivers for the Low Power Audio Subsystem
(LPASS) and the MAX98504 class D speaker amplifier as well as the actual
asoc machine driver.
The changes since v2 are listed in individual patches, I didn't add any
Acked-by tag to the max98504 DT binding patch as there was significant
change since v2.

Inha Song (1):
  ASoC: samsung: Add Samsung Low Power Audio Subsystem driver

Sylwester Nawrocki (5):
  ASoC: samsung: Add DT bindings documentation for LPASS
  ASoC: Add DT bindings documentation for max98504 amplifier
  ASoC: max98504: Add max98504 speaker amplifier driver
  ASoC: samsung: Add DT bindings documentation for TM2 sound subsystem
  ASoC: samsung: Add machine driver for Exynos5433 based TM2 board

 .../devicetree/bindings/sound/max98504.txt         |  44 ++
 .../bindings/sound/samsung,exynos5433-lpass.txt    |   8 +
 .../bindings/sound/samsung,tm2-audio.txt           |  36 ++
 sound/soc/codecs/Kconfig                           |   4 +
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/max98504.c                        | 383 ++++++++++++++
 sound/soc/codecs/max98504.h                        |  59 +++
 sound/soc/samsung/Kconfig                          |  13 +
 sound/soc/samsung/Makefile                         |   4 +
 sound/soc/samsung/lpass.c                          | 162 ++++++
 sound/soc/samsung/lpass.h                          |  47 ++
 sound/soc/samsung/tm2_wm5110.c                     | 579 +++++++++++++++++++++
 12 files changed, 1341 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/max98504.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,exynos5433-lpass.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
 create mode 100644 sound/soc/codecs/max98504.c
 create mode 100644 sound/soc/codecs/max98504.h
 create mode 100644 sound/soc/samsung/lpass.c
 create mode 100644 sound/soc/samsung/lpass.h
 create mode 100644 sound/soc/samsung/tm2_wm5110.c

--
1.9.1
