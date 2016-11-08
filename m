From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] ARM: dts: exynos: DT for v4.10
Date: Tue,  8 Nov 2016 20:26:28 +0200
Message-ID: <1478629589-7520-3-git-send-email-krzk@kernel.org>
References: <1478629589-7520-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:54218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754188AbcKHS0x (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Nov 2016 13:26:53 -0500
In-Reply-To: <1478629589-7520-1-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

Hi,

Hurray! New board! ... Exynos4415 slowly is going away.

Best regards,
Krzysztof


The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.10

for you to fetch changes up to 05a3589f46f913fbe91704f12fdca46a0eb0a27b:

  ARM: dts: exynos: Add SCU device node to exynos4.dtsi (2016-11-05 17:39:50 +0200)

----------------------------------------------------------------
Samsung DeviceTree update for v4.10:
1. Add TOPEET itop core and Elite boards, based on Exynos4412.
2. Remove the Exynos4415 DTSI. We did not have any mainlined boards
   using it. I am also not aware of any popular out-of-tree boards using it.
3. Add Snoop Control Unit node for Exynos4.
4. Minor cleanups.

----------------------------------------------------------------
Javier Martinez Canillas (1):
      ARM: dts: exynos: Document eMMC/SD/SDIO devices in Snow and Peach boards

Krzysztof Kozlowski (1):
      ARM: dts: exynos: Remove exynos4415.dtsi

Pankaj Dubey (1):
      ARM: dts: exynos: Add SCU device node to exynos4.dtsi

Randy Li (2):
      ARM: dts: exynos: Add TOPEET itop core board SCP package version
      ARM: dts: exynos: Add TOPEET itop elite based board

Sylwester Nawrocki (2):
      ARM: dts: exynos: Remove "simple-bus" compatible from fimc-is node
      ARM: dts: exynos: Add entries for sound support on Odroid-XU board

 .../bindings/arm/samsung/samsung-boards.txt        |   3 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/exynos4.dtsi                     |   5 +
 arch/arm/boot/dts/exynos4412-itop-elite.dts        | 240 ++++++++
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi    | 501 ++++++++++++++++
 arch/arm/boot/dts/exynos4415-pinctrl.dtsi          | 575 ------------------
 arch/arm/boot/dts/exynos4415.dtsi                  | 650 ---------------------
 arch/arm/boot/dts/exynos4x12.dtsi                  |   2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi      |   4 +
 arch/arm/boot/dts/exynos5410-odroidxu.dts          |  69 +++
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi          |   9 +
 arch/arm/boot/dts/exynos5410.dtsi                  |  59 ++
 arch/arm/boot/dts/exynos5420-peach-pit.dts         |   3 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts          |   3 +
 14 files changed, 898 insertions(+), 1226 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4412-itop-elite.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
 delete mode 100644 arch/arm/boot/dts/exynos4415-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/exynos4415.dtsi
