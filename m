From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v11 6/9] ARM: dts: exynos: add chipid label and syscon
 compatible
Date: Mon,  1 Jul 2019 15:11:35 +0200
Message-ID: <20190701131138.22666-7-l.luba@partner.samsung.com>
References: <20190701131138.22666-1-l.luba@partner.samsung.com>
        <CGME20190701131155eucas1p1f51297a17dd902fc431f62234ef5e677@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701131138.22666-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add the chipid label which allows to use it in phandle from other device.
Use syscon in compatible to get the regmap of the device register set.
The chipid is used in DMC during initialization to compare compatibility.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 67f9b4504a42..4801ca759feb 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -35,8 +35,8 @@
 		#size-cells = <1>;
 		ranges;
 
-		chipid@10000000 {
-			compatible = "samsung,exynos4210-chipid";
+		chipid: chipid@10000000 {
+			compatible = "samsung,exynos4210-chipid", "syscon";
 			reg = <0x10000000 0x100>;
 		};
 
-- 
2.17.1
