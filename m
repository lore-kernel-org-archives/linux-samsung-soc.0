From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 0/6] Sound support for Exynos5433 TM2(E) boards
Date: Mon, 13 Jun 2016 12:52:34 +0200
Message-ID: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52807 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964910AbcFMKxS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jun 2016 06:53:18 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch series adds sound supoort for the Exynos 5433 based TM2(E)
boards.  It includes minimal drivers for the Low Power Audio Subsystem
(LPASS) and the MAX98504 class D speaker amplifier as well as the actual
asoc machine driver.

Inha Song (2):
  ASoC: samsung: Add Samsung Low Power Audio Subsystem driver
  ASoC: samsung: Add machine driver for Exynos5433 based TM2 board

Sylwester Nawrocki (4):
  ASoC: samsung: Add DT bindings documentation for LPASS
  ASoC: max98504: Add max98504 speaker amplifier driver
  ASoC: Add DT bindings documentation for max98504 amplifier
  ASoC: samsung: Add DT bindings documentation for TM2 sound subsystem

 .../devicetree/bindings/sound/max98504.txt         |  44 ++
 .../bindings/sound/samsung,exynos5433-lpass.txt    |   8 +
 .../bindings/sound/samsung,tm2-wm5110.txt          |  39 ++
 sound/soc/codecs/Kconfig                           |   4 +
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/max98504.c                        | 241 +++++++++
 sound/soc/codecs/max98504.h                        |  94 ++++
 sound/soc/samsung/Kconfig                          |  13 +
 sound/soc/samsung/Makefile                         |   4 +
 sound/soc/samsung/lpass.c                          | 162 ++++++
 sound/soc/samsung/lpass.h                          |  47 ++
 sound/soc/samsung/tm2_wm5110.c                     | 553 +++++++++++++++++++++
 12 files changed, 1211 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/max98504.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,exynos5433-lpass.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-wm5110.txt
 create mode 100644 sound/soc/codecs/max98504.c
 create mode 100644 sound/soc/codecs/max98504.h
 create mode 100644 sound/soc/samsung/lpass.c
 create mode 100644 sound/soc/samsung/lpass.h
 create mode 100644 sound/soc/samsung/tm2_wm5110.c

--
1.9.1
