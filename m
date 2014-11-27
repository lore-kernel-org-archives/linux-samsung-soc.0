From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 1/4] Samsung 3rd round of PM updates for v3.19
Date: Thu, 27 Nov 2014 16:06:26 +0900
Message-ID: <5476CD72.2010203@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:36229 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750866AbaK0HGc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Nov 2014 02:06:32 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit c645a598f99768e6cc82129081458dfdd0c273b7:

  ARM: EXYNOS: Call regulator core suspend prepare and finish functions
(2014-11-21 22:49:47 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-pm-3

for you to fetch changes up to b04fa9f704aa818b87509ff4149bba810ef8bbd8:

  ARM: EXYNOS: use u8 for val[] in struct exynos_pmu_conf (2014-11-27
02:47:05 +0900)

----------------------------------------------------------------
Samsung PM 3rd updates for v3.19

- exynos3250
  : add PMU support

- PMU refactoring
  : move restart code into PMU driver
  : move restart code for exynos440 into clk driver

- use u8 for val[] in struct exynos_pmu_conf

Note that this branch is based on tags/samsung-exynos-v3.19

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (2):
      ARM: EXYNOS: add exynos3250 PMU support
      ARM: EXYNOS: use u8 for val[] in struct exynos_pmu_conf

Pankaj Dubey (2):
      clk: exynos5440: move restart code into clock driver
      ARM: EXYNOS: move restart code into pmu driver

 arch/arm/mach-exynos/common.h        |   1 -
 arch/arm/mach-exynos/exynos.c        |  23 -----
 arch/arm/mach-exynos/pmu.c           | 192
++++++++++++++++++++++++++++++++++-
 arch/arm/mach-exynos/regs-pmu.h      | 128 +++++++++++++++++++++++
 drivers/clk/samsung/clk-exynos5440.c |  29 +++++-
 5 files changed, 347 insertions(+), 26 deletions(-)
