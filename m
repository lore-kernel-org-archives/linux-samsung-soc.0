From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] soc: samsung: Exynos for v5.4
Date: Fri, 16 Aug 2019 18:30:40 +0200
Message-ID: <20190816163042.6604-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.4

for you to fetch changes up to 40d8aff614f71ab3cab20785b4f213e3802d4e87:

  soc: samsung: chipid: Convert exynos-chipid driver to use the regmap API (2019-08-15 20:25:25 +0200)

----------------------------------------------------------------
Samsung soc drivers changes for v5.4

Add Exynos Chipid driver for identification of product IDs and SoC
revisions.  The driver also exposes chipid regmap, later to be used by
Exynos Adaptive Supply Voltage driver (adjusting voltages to different
revisions of same SoC).

----------------------------------------------------------------
Pankaj Dubey (1):
      soc: samsung: Add exynos chipid driver support

Sylwester Nawrocki (1):
      soc: samsung: chipid: Convert exynos-chipid driver to use the regmap API

 drivers/soc/samsung/Kconfig               |   5 ++
 drivers/soc/samsung/Makefile              |   2 +
 drivers/soc/samsung/exynos-chipid.c       | 101 ++++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-chipid.h |  52 +++++++++++++++
 4 files changed, 160 insertions(+)
 create mode 100644 drivers/soc/samsung/exynos-chipid.c
 create mode 100644 include/linux/soc/samsung/exynos-chipid.h
