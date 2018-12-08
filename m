From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH] ARM: dts: exynos: Add all CPUs in cooling maps for odroid-X2.
Date: Sat,  8 Dec 2018 21:56:56 +0100
Message-ID: <20181208205656.15430-1-m.reichl@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: krzk@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Markus Reichl <m.reichl@fivetechno.de>, robh+dt@kernel.org, kgene@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Patch [1] ARM: dts: exynos: Add all CPUs in cooling maps did not
update exynos4412-prime.dtsi. This is not a problem with odroid-U3
using own map (with fan) but with odroid-X2 relying only on
exynos4412-prime.dtsi.

[1] https://patchwork.kernel.org/patch/10685765/

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
 arch/arm/boot/dts/exynos4412-prime.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-prime.dtsi b/arch/arm/boot/dts/exynos4412-prime.dtsi
index 8e7a7fb98124..d83fbd4e434c 100644
--- a/arch/arm/boot/dts/exynos4412-prime.dtsi
+++ b/arch/arm/boot/dts/exynos4412-prime.dtsi
@@ -30,9 +30,11 @@
 };
 
 &cooling_map0 {
-	cooling-device = <&cpu0 9 9>;
+	cooling-device = <&cpu0 9 9>, <&cpu1 9 9>,
+			 <&cpu2 9 9>, <&cpu3 9 9>;
 };
 
 &cooling_map1 {
-	cooling-device = <&cpu0 15 15>;
+	cooling-device = <&cpu0 15 15>, <&cpu1 15 15>,
+			 <&cpu2 15 15>, <&cpu3 15 15>;
 };
-- 
2.11.0
