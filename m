From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/2] regualtors: Fix suspend/resume issues since v4.16
Date: Mon, 03 Sep 2018 16:49:35 +0200
Message-ID: <20180903144937.16507-1-m.szyprowski@samsung.com>
References: <CGME20180903144947eucas1p2039e13961d8bfd21edcf1f1d152a5a12@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Chunyan Zhang <zhang.chunyan@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi All,

While working on suspend/resume support for Samsung Exynos5433-based TM2
board (arch/arm64/boot/dts/exynos/exynos5433-tm2.dts), I've noticed that
v4.16 kernel release introduced some serious problems with regulator
configuration in system suspend state. Further investigation revealed
that the following 2 commits are responsible for my issues:

1. f7efad10b5c4: regulator: add PM suspend and resume hooks
2. 72069f9957a1: regulator: leave one item to record whether regulator is enabled

I've been really surprised that no-one noticed those issues for almost
4 kernel releases. Please review my fixes and apply to v4.19-rcX if
possible.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (2):
  regulator: Fix useless O^2 complexity in suspend/resume
  regulator: Fix 'do-nothing' value for regulators without suspend state

 drivers/regulator/core.c          | 41 +++++++++----------------------
 drivers/regulator/of_regulator.c  |  2 --
 include/linux/regulator/machine.h |  6 ++---
 3 files changed, 15 insertions(+), 34 deletions(-)

-- 
2.17.1
