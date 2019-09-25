From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH 0/3] Exynos5 DMC interrupt mode
Date: Wed, 25 Sep 2019 18:18:10 +0200
Message-ID: <20190925161813.21117-1-l.luba@partner.samsung.com>
References: <CGME20190925161841eucas1p12b3b798020b3493e9a4804d98b422f17@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, robh+dt@kernel.org, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi all,

This is a patch set for the Exynos5 Dynamic Memory Controller
driver which could be found in Krzysztof's tree [1]. It is on top of a
merge of the two branches [1][2].

It adds interrupt mode which does not relay on devfreq polling.
Instead of checking the device state by the framework, driver uses local
performance events counters which could trigger interrupt when overflow.
Thanks to this approach the driver avoids issues present in devfreq framework,
when default polling check does not occur.
The algorithm calculates 'busy_time' and 'total_time' needed for devfreq
governors (simple_ondemand) based on requests transactions traffic.

Regards,
Lukasz Luba

[1] https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=for-v5.4-5.5/memory-samsung-dmc
[2] https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=for-v5.4-5.5/memory-samsung-dmc-dt

Lukasz Luba (3):
  ARM: dts: exynos: Add interrupt to DMC controller in Exynos5422
  ARM: dts: exynos: map 0x10000 SFR instead of 0x100 in DMC Exynos5422
  memory: samsung: exynos5422-dmc: Add support for interrupt from
    performance counters

 arch/arm/boot/dts/exynos5420.dtsi       |   4 +-
 drivers/memory/samsung/exynos5422-dmc.c | 297 ++++++++++++++++++++++--
 2 files changed, 275 insertions(+), 26 deletions(-)

-- 
2.17.1
