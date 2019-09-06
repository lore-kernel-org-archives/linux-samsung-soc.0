From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH 0/3] Exynos5 DMC minor fixes
Date: Fri,  6 Sep 2019 12:13:41 +0200
Message-ID: <20190906101344.3535-1-l.luba@partner.samsung.com>
References: <CGME20190906101404eucas1p1d11e26276bfdacb7748f1391e29f45d0@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi all,

This is a follow up patch set for the Exynos5 Dynamic Memory Controller
driver v13 [1]. The patches are based on Krzysztof's 'for-next' branch [2].
There are a few minor fixes captured during static analysis and a new
binding for 'samsung,K3QF2F20DB' LPDDR3 memory.

Regards,
Lukasz Luba

[1] https://lkml.org/lkml/2019/8/21/283
[2] https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=for-next

Lukasz Luba (3):
  memory: Exynos5422: minor fixes in DMC
  ARM: dts: exynos: fix too long line in memory device
  dt-bindings: ddr: Add bindings for Samsung LPDDR3 memories

 .../devicetree/bindings/ddr/lpddr3.txt        | 29 +++++++++++++++++--
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  3 +-
 drivers/memory/samsung/exynos5422-dmc.c       |  4 +--
 3 files changed, 31 insertions(+), 5 deletions(-)

-- 
2.17.1
