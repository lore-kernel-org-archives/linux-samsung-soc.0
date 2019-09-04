From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/5] ARM: defconfig: exynos for v5.4
Date: Wed,  4 Sep 2019 19:49:58 +0200
Message-ID: <20190904175002.10487-2-krzk@kernel.org>
References: <20190904175002.10487-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904175002.10487-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-5.4

for you to fetch changes up to 86759eeb32f70193ca7ebd50cc9b70ccb73d3d89:

  ARM: multi_v7_defconfig: Make MAX77802 regulator driver built-in (2019-09-02 17:38:20 +0200)

----------------------------------------------------------------
Samsung defconfig changes for v5.4

1. Enable AHCI platform driver on exynos defconfig for Exynos5250-based
   Arndale board,
2. Make Max77802 PMIC regulator driver a built-in on multi_v7 defconfig
   as it is essential early during boot.

----------------------------------------------------------------
Marek Szyprowski (2):
      ARM: exynos_defconfig: Enable AHCI-platform SATA driver
      ARM: multi_v7_defconfig: Make MAX77802 regulator driver built-in

 arch/arm/configs/exynos_defconfig   | 5 ++++-
 arch/arm/configs/multi_v7_defconfig | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)
