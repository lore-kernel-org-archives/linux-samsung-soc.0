From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v3 0/2] Exynos5 DMC minor fixes
Date: Thu, 19 Sep 2019 11:26:39 +0200
Message-ID: <20190919092641.4407-1-l.luba@partner.samsung.com>
References: <CGME20190919092652eucas1p2715611db7a0b0c4cc79956311e01c35a@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com, dan.carpenter@oracle.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi all,

This is a follow up patch set for the Exynos5 Dynamic Memory Controller
driver v13 [1]. The patches are for Krzysztof's branch [2]
for-v5.4-5.5/memory-samsung-dmc
and/or linux-next where Dan Carpenter reported the issue (patch 1/2).
There are a few fixes captured during static analysis and a new
binding for 'samsung,K3QF2F20DB' LPDDR3 memory.

Regards,
Lukasz Luba

[1] https://lkml.org/lkml/2019/8/21/283
[2] https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=for-v5.4-5.5/memory-samsung-dmc

Lukasz Luba (2):
  memory: samsung: exynos5422-dmc: Fix kfree() of devm-allocated memory
    and missing static
  dt-bindings: ddr: Add bindings for Samsung LPDDR3 memories

 Documentation/devicetree/bindings/ddr/lpddr3.txt | 10 +++++++---
 drivers/memory/samsung/exynos5422-dmc.c          |  6 ++----
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.17.1
