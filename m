From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/3] ARM: dts: exynos: Add missing dt data to bring up kernel
 feature
Date: Thu, 10 Oct 2013 09:30:04 +0900
Message-ID: <1381365007-1782-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, kyungmin.park@samsung.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patchset add missing dt data to bring up kernel feature
- MAUDIO/GPS_ALIVE power domain
- PMU 
- Clock data for Multi core timer

Chanwoo Choi (2):
  ARM: dts: exynos4212: Add PMU dt data for pmu-irq
  ARM: dts: exynos4x12: Add maudio/gps_alive power domain for exynos4x12

Marek Szyprowski (1):
  ARM: dts: exynos4212: Add missing clock for multi core timer

 arch/arm/boot/dts/exynos4212.dtsi |  8 ++++++++
 arch/arm/boot/dts/exynos4x12.dtsi | 10 ++++++++++
 2 files changed, 18 insertions(+)

-- 
1.8.0
