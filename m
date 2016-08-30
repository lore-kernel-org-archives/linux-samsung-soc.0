From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 2/4] ARM: dts: exynos: DeviceTree for v4.9
Date: Tue, 30 Aug 2016 11:18:57 +0200
Message-ID: <1472548739-20050-3-git-send-email-k.kozlowski@samsung.com>
References: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.9

for you to fetch changes up to 05b01dd936b46f2c3cfbb10bc89c0ec79c745e5d:

  ARM: dts: exynos: Use 'hpd-gpios' instead of 'hpd-gpio' (2016-08-24 21:09:24 +0200)

----------------------------------------------------------------
Samsung DeviceTree update for v4.9:
1. Set chosen serial bitrate which allows proper serial output when
   bootloader does pass all the data in command line.
2. Cleanup.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: exynos: Use stdout non-deprecated property and add serial options to Odroid XU/XU3/XU4

Milo Kim (1):
      ARM: dts: exynos: Use 'hpd-gpios' instead of 'hpd-gpio'

 Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt | 4 ++--
 arch/arm/boot/dts/exynos4210-universal_c210.dts                  | 2 +-
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi                  | 2 +-
 arch/arm/boot/dts/exynos5250-arndale.dts                         | 2 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts                        | 2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi                    | 2 +-
 arch/arm/boot/dts/exynos5250-spring.dts                          | 2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts                        | 2 +-
 arch/arm/boot/dts/exynos5420-peach-pit.dts                       | 2 +-
 arch/arm/boot/dts/exynos5420-smdk5420.dts                        | 2 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi               | 4 ++--
 arch/arm/boot/dts/exynos5800-peach-pi.dts                        | 2 +-
 12 files changed, 14 insertions(+), 14 deletions(-)
