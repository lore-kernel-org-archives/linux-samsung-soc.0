From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/4] ARM: defconfig: Exynos for v4.21
Date: Sun,  9 Dec 2018 12:49:08 +0100
Message-ID: <20181209114911.25194-2-krzk@kernel.org>
References: <20181209114911.25194-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181209114911.25194-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-4.21

for you to fetch changes up to 24c8e4b85399b00f4ae96e7957b0eeaa374e9380:

  ARM: multi_v7_defconfig: Add TOSHIBA TC358764 bridge driver (2018-12-07 20:18:47 +0100)

----------------------------------------------------------------
Samsung defconfig changes for v4.21

Enable drivers in exynos and multi_v7 defconfigs for MAX8952, MAX8998
(Samsung UniversalC210 board) and TC358764 (Arndale board).

----------------------------------------------------------------
Marek Szyprowski (5):
      ARM: exynos_defconfig: Add MAX8998 RTC and charger drivers
      ARM: exynos_defconfig: Add MAX8952 regulator driver
      ARM: exynos_defconfig: Add TOSHIBA TC358764 bridge driver
      ARM: multi_v7_defconfig: Add MAX8952 regulator driver
      ARM: multi_v7_defconfig: Add TOSHIBA TC358764 bridge driver

 arch/arm/configs/exynos_defconfig   | 4 ++++
 arch/arm/configs/multi_v7_defconfig | 2 ++
 2 files changed, 6 insertions(+)
