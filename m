From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/4] ARM: mach/soc: exynos for v4.11, 2nd round
Date: Sun, 29 Jan 2017 22:06:30 +0200
Message-ID: <20170129200630.22083-5-krzk@kernel.org>
References: <20170129200630.22083-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:49398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751943AbdA2UH4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Jan 2017 15:07:56 -0500
In-Reply-To: <20170129200630.22083-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>


On top of previous pull request.


The following changes since commit cda1a52dab50340728e46601e6c9da9fc4beaf1f:

  ARM: s3c64xx: Constify wake_irqs (2016-12-29 15:41:44 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-4.11-2

for you to fetch changes up to 95ed41df129ca8f76eb190534d20f4a6dcd37213:

  dt-bindings: video: exynos7-decon: Remove obsolete samsung,power-domain property (2017-01-29 21:03:56 +0200)

----------------------------------------------------------------
Samsung mach/soc update for v4.11, second round:
1. Remove mach code for Exynos4415 as a continuation of removal
   of this SoC.
2. Remove obsolete property from the bindings documentation.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: EXYNOS: Remove Exynos4415 arch code (SoC not supported anymore)
      dt-bindings: video: exynos7-decon: Remove obsolete samsung,power-domain property

 Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt | 2 +-
 arch/arm/mach-exynos/Kconfig                                       | 5 -----
 arch/arm/mach-exynos/exynos.c                                      | 1 -
 arch/arm/mach-exynos/suspend.c                                     | 1 -
 4 files changed, 1 insertion(+), 8 deletions(-)
