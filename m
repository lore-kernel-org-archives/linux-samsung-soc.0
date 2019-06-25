From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/4] ARM: defconfig: Samsung/Exynos for v5.3
Date: Tue, 25 Jun 2019 21:34:48 +0200
Message-ID: <20190625193451.7696-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-5.3

for you to fetch changes up to dd50a69b5697532666023766688c6ea642e5a443:

  ARM: exynos_defconfig: Enable Panfrost and Lima drivers (2019-06-19 19:23:35 +0200)

----------------------------------------------------------------
Samsung defconfig changes for v5.3

1. Trim several configs with savedefconfig.
2. Enable Lima and Panfrost drivers for Mali GPU.

----------------------------------------------------------------
Krzysztof Kozlowski (4):
      ARM: exynos_defconfig: Trim and reorganize with savedefconfig
      ARM: defconfig: samsung: Cleanup with savedefconfig
      ARM: multi_v7_defconfig: Enable Panfrost and Lima drivers
      ARM: exynos_defconfig: Enable Panfrost and Lima drivers

 arch/arm/configs/exynos_defconfig   | 65 +++++++++++++++++--------------------
 arch/arm/configs/mini2440_defconfig | 43 ++++++++++--------------
 arch/arm/configs/multi_v7_defconfig |  3 +-
 arch/arm/configs/s3c2410_defconfig  | 24 +++++---------
 arch/arm/configs/s3c6400_defconfig  | 11 +++----
 5 files changed, 62 insertions(+), 84 deletions(-)
