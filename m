From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] ARM: dts: samsung: exynos and s5pv210 for v5.1
Date: Fri,  1 Feb 2019 20:17:20 +0100
Message-ID: <20190201191720.20464-2-krzk@kernel.org>
References: <20190201191720.20464-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201191720.20464-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.1

for you to fetch changes up to ec33745bccc8f336957c751f4153421cc9ef5a54:

  ARM: dts: exynos: Fix pinctrl definition for eMMC RTSN line on Odroid X2/U3 (2019-01-25 20:18:10 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.1

1. Extend support for Aries family of mobile devices (e.g. Samsung
   Galaxy S) based on S5Pv210 SoC: DRM Rotator, FIMD, PWM vibrator,
   power off, touchscreen, Broadcom BCM4329 Bluetooth and cpufreq.
2. Remove hardcoded bootargs on Galaxy S family (proper support in
   U-Boot).
3. Fix minor DTC warnings.
4. Fix Exynos4412 Odroid X2/U3 conflicting eMMC GPIO settings and regulator
   properties.
5. Fix the eMMC RTSN pin breaking proper reboot on X2.

----------------------------------------------------------------
Jonathan Bakker (1):
      ARM: dts: s5pv210: Add support for more devices present on Aries

Krzysztof Kozlowski (2):
      ARM: dts: s5pv210: Fix onenand's unit address format warning
      ARM: dts: s3c2416: Fix xti node's missing reg property warning

Marek Szyprowski (3):
      ARM: dts: exynos: Fix conflicting fixed-regulator GPIO flags and properties
      ARM: dts: exynos: Fix eMMC regulator properties on Odroid U3 boards
      ARM: dts: exynos: Fix pinctrl definition for eMMC RTSN line on Odroid X2/U3

Paweł Chmiel (5):
      ARM: dts: s5pv210: Add node for exynos-rotator
      ARM: dts: s5pv210: Use correct fimd variant
      ARM: dts: s5pv210: Remove hardcoded bootargs on Galaxy S and Fascinate 4G
      ARM: dts: s5pv210: Add reserved memory for MFC on Aries
      ARM: dts: s5pv210: Add DMC nodes

 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 14 ++--
 arch/arm/boot/dts/exynos4412-odroidx.dts        |  2 +-
 arch/arm/boot/dts/exynos5250-arndale.dts        |  2 +-
 arch/arm/boot/dts/s3c2416-smdk2416.dts          |  5 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi            | 90 +++++++++++++++++++++++++
 arch/arm/boot/dts/s5pv210-fascinate4g.dts       |  7 --
 arch/arm/boot/dts/s5pv210-galaxys.dts           |  7 --
 arch/arm/boot/dts/s5pv210.dtsi                  | 25 ++++++-
 8 files changed, 125 insertions(+), 27 deletions(-)
