From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v2 2/3] ARM: dts: exynos: fix too long line in memory device
Date: Mon, 16 Sep 2019 12:07:03 +0200
Message-ID: <20190916100704.26692-3-l.luba@partner.samsung.com>
References: <20190916100704.26692-1-l.luba@partner.samsung.com>
        <CGME20190916100718eucas1p1efcbabdf9dbe17a062ae83b8c19ac256@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190916100704.26692-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Small fix moving the comment to line above making sure the lines do not
exceed 80 characters.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index fe885ca969af..059fa32d1a8f 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -103,7 +103,8 @@
 
 		timings_samsung_K3QF2F20DB_800mhz: lpddr3-timings@800000000 {
 			compatible	= "jedec,lpddr3-timings";
-			reg		= <800000000>; /* workaround: it shows max-freq */
+			/* workaround: 'reg' shows max-freq */
+			reg		= <800000000>;
 			min-freq	= <100000000>;
 			tRFC		= <65000>;
 			tRRD		= <6000>;
-- 
2.17.1
