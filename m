From: k.konieczny@partner.samsung.com
Subject: [PATCH v3 0/5] add coupled regulators for Exynos5422/5800
Date: Fri, 19 Jul 2019 17:05:30 +0200
Message-ID: <20190719150535.15501-1-k.konieczny@partner.samsung.com>
References: <CGME20190719150553eucas1p142b965afae13224712d51f9c28162165@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

The main purpose of this patch series is to add coupled regulators for
Exynos5422/5800 to keep constrain on voltage difference between vdd_arm
and vdd_int to be at most 300mV. In exynos-bus instead of using
regulator_set_voltage_tol() with default voltage tolerance it should be
used regulator_set_voltage_triplet() with volatege range, and this is
already present in opp/core.c code, so it can be reused. While at this,
move setting regulators into opp/core.

This patchset was tested on Odroid XU3.

The DTS coupled regulators patch depends on 2nd and 3rd patches.

Changes:
v3:
- added new exynos-bus patch to correct clock and regulator enabling
  and disabling sequence as suggested by Chanwoo Choi
- corrected error path in enable and improved commit message in opp/core
- improve comment in devfreq/exynos-bus.c before devfreq_recommended_opp()
- change cover letter as there is new patch
- added note before Signed-off-by in 4th patch
v2:
- improve regulators enable/disable code in opp/core as suggested by
  Viresh Kumar
- add new patch for remove unused dt-bindings as suggested by Krzysztof
  Kozlowski

Regards,
Kamil

Kamil Konieczny (4):
  devfreq: exynos-bus: correct clock enable sequence
  opp: core: add regulators enable and disable
  devfreq: exynos-bus: convert to use dev_pm_opp_set_rate()
  dt-bindings: devfreq: exynos-bus: remove unused property

Marek Szyprowski (1):
  ARM: dts: exynos: add initial data for coupled regulators for
    Exynos5422/5800

 .../bindings/devfreq/exynos-bus.txt           |   2 -
 arch/arm/boot/dts/exynos5420.dtsi             |  34 ++--
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |   4 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts     |   4 +
 arch/arm/boot/dts/exynos5800.dtsi             |  32 ++--
 drivers/devfreq/exynos-bus.c                  | 181 ++++++------------
 drivers/opp/core.c                            |  16 +-
 7 files changed, 113 insertions(+), 160 deletions(-)

-- 
2.22.0
