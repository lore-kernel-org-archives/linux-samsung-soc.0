From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 0/3] arm64: exynos: Enable drivers for Exynos5433
Date: Tue, 14 Mar 2017 19:10:25 +0200
Message-ID: <20170314171028.20337-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:56892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751183AbdCNRL1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 13:11:27 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>

Hi,


Patches are independent but I organized them into one patchset
as they have common goal - enable more drivers for ARMv8 Exynos chips.

If there are no objections, I can take it through samsung-soc.

Changes since v1:
================
1. Patch 1/3: Do not enable entire DRM stack but only drivers
   supporting Exynos5433 and Exynos7 (suggested by Bartlomiej).
2. Add Bartlomiej's and Alim's reviews.


Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  arm64: defconfig: Enable video, DRM and LPASS drivers for Exynos5433
    and Exynos7
  soc: samsung: Do not build ARMv7 PMU drivers on ARMv8
  arm64: exynos: Enable Exynos PMU and PM domains drivers

 arch/arm64/Kconfig.platforms     |  2 ++
 arch/arm64/configs/defconfig     | 11 +++++++++++
 drivers/soc/samsung/Kconfig      |  8 +++++++-
 drivers/soc/samsung/Makefile     |  4 +++-
 drivers/soc/samsung/exynos-pmu.c | 22 ++++++++++++++++------
 drivers/soc/samsung/exynos-pmu.h |  3 +++
 6 files changed, 42 insertions(+), 8 deletions(-)

-- 
2.9.3
