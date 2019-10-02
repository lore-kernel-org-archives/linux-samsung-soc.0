From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v3 0/4] Exynos5 DMC interrupt mode
Date: Wed,  2 Oct 2019 08:04:51 +0200
Message-ID: <20191002060455.3834-1-l.luba@partner.samsung.com>
References: <CGME20191002060503eucas1p25fb14ebbf05a5599f8faeacbd3a15887@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, robh+dt@kernel.org, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi all,

This is a v3 patch set for the Exynos5 Dynamic Memory Controller
driver which could be found in Krzysztof's for-next branch [1].

It adds interrupt mode which does not relay on devfreq polling.
Instead of checking the device state by the framework, driver uses local
performance event counters which could trigger interrupt when overflow.
Thanks to this approach the driver avoids issues present in devfreq framework,
when default polling check does not occur.
The algorithm calculates 'busy_time' and 'total_time' needed for devfreq
governors (simple_ondemand) based on requests transactions traffic.

Changes:
v3:
- added information in bindings about interrupt names, since the code is
  sensitive for it as pointed out by Krzysztof
v2:
  changes suggested by Krzysztof
- added interrupt line for the channel 1
- added description for bindings with interrupt lines
- fixed fallback path in probe function
- added comments, blank lines, removed unneeded dev_dbg() in irq handler

Regards,
Lukasz Luba

[1] https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=for-next

Lukasz Luba (4):
  dt-bindings: memory-controllers: Add Exynos5422 DMC interrupts
    description
  ARM: dts: exynos: Add interrupt to DMC controller in Exynos5422
  ARM: dts: exynos: map 0x10000 SFR instead of 0x100 in DMC Exynos5422
  memory: samsung: exynos5422-dmc: Add support for interrupt from
    performance counters

 .../memory-controllers/exynos5422-dmc.txt     |  11 +
 arch/arm/boot/dts/exynos5420.dtsi             |   5 +-
 drivers/memory/samsung/exynos5422-dmc.c       | 345 ++++++++++++++++--
 3 files changed, 335 insertions(+), 26 deletions(-)

-- 
2.17.1
