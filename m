From: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC 0/2] Add support for Suspend and Resume for Exynos4412 on
Date: Wed, 13 Feb 2019 21:40:50 +0000
Message-ID: <20190213214052.2427-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add support to set the Odroid U3+ device into DEEP sleep mode
and is able to resume from suspend state.

Changes base on Krxk/next/dt and worked on 5.0.0-rc6+
TODO: fix the eMMC failuer.

Any input are welcome.

Best Regards
-Anand

Anand Moon (2):
  ARM: dts: exynos: Add proper regulator states for suspend-to-mem for
    odroid-u3
  soc: samsung: pmu: Add the PMU data of exynos4412 to support low-power
    state

 .../boot/dts/exynos4412-odroid-common.dtsi    | 63 ++++++++++++++
 arch/arm/boot/dts/exynos4412-odroidu3.dts     |  3 +
 drivers/soc/samsung/exynos4-pmu.c             | 83 +++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h   | 21 +++++
 4 files changed, 170 insertions(+)

-- 
2.20.1
