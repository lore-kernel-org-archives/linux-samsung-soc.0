From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 3/3] Samsung CPUIdle updates for v3.20
Date: Wed, 04 Feb 2015 23:31:42 +0900
Message-ID: <54D22D4E.3080703@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:36649 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933819AbbBDObr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Feb 2015 09:31:47 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>

Hi,

This is cpuidle update for v3.20.
Please pull.

Thanks,
Kukjin

The following changes since commit 97bf6af1f928216fd6c5a66e8a57bfa95a659672:

  Linux 3.19-rc1 (2014-12-20 17:08:50 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-cpuidle

for you to fetch changes up to 712eddf70225ab5ae65e946e22d2dfe6b93e8dd1:

  cpuidle: exynos: add coupled cpuidle support for exynos4210
(2015-01-30 08:39:15 +0900)

----------------------------------------------------------------
Samsung CPUIdle updates for v3.20

- adds coupled cpuidle support for exynos4210
  : fix for Exynos platform PM code preparing it for the coupled
  cpuidle support and adds coupled cpuidle AFTR mode on exynos4210

Note this is mostrly based on earlier cpuidle-exynos4210 driver
from Daniel Lezcano and Bart updated.

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (2):
      ARM: EXYNOS: apply S5P_CENTRAL_SEQ_OPTION fix only when necessary
      cpuidle: exynos: add coupled cpuidle support for exynos4210

 arch/arm/mach-exynos/common.h                |   4 +
 arch/arm/mach-exynos/exynos.c                |   4 +
 arch/arm/mach-exynos/platsmp.c               |   2 +-
 arch/arm/mach-exynos/pm.c                    | 133
++++++++++++++++++++++++++-
 arch/arm/mach-exynos/suspend.c               |   4 +
 drivers/cpuidle/Kconfig.arm                  |   1 +
 drivers/cpuidle/cpuidle-exynos.c             |  76 ++++++++++++++-
 include/linux/platform_data/cpuidle-exynos.h |  20 ++++
 8 files changed, 234 insertions(+), 10 deletions(-)
 create mode 100644 include/linux/platform_data/cpuidle-exynos.h
