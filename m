From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/5] ARM: soc: samsung: exynos for v4.12
Date: Sat,  8 Apr 2017 16:10:01 +0200
Message-ID: <20170408141004.386-3-krzk@kernel.org>
References: <20170408141004.386-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:36804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752699AbdDHOKp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 8 Apr 2017 10:10:45 -0400
In-Reply-To: <20170408141004.386-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>


The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-4.12

for you to fetch changes up to a0ebf66267ebab093cd7e230e70d29249768d249:

  soc: samsung: Do not build ARMv7 PMU drivers on ARMv8 (2017-03-21 19:03:39 +0200)

----------------------------------------------------------------
Samsung SoC drivers update for v4.12 - split building of the PMU driver between
ARMv7 and ARMv8.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      soc: samsung: Do not build ARMv7 PMU drivers on ARMv8

 drivers/soc/samsung/Kconfig      |  8 +++++++-
 drivers/soc/samsung/Makefile     |  4 +++-
 drivers/soc/samsung/exynos-pmu.c | 22 ++++++++++++++++------
 drivers/soc/samsung/exynos-pmu.h |  3 +++
 4 files changed, 29 insertions(+), 8 deletions(-)
