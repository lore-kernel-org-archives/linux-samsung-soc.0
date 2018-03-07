From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/4] ARM: dts: exynos5250: Add #sound-dai-cells property to
 hdmi device node
Date: Wed, 07 Mar 2018 18:27:08 +0100
Message-ID: <20180307172711.15697-1-s.nawrocki@samsung.com>
References: <CGME20180307172723epcas1p1b8879bb555737cab7406a172b7d13a56@epcas1p1.samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org, kgene@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This property is required for specifying link between the HDMI IP block
and the SoC's audio subsystem.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 56626d1a4235..71d2ede118e3 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -700,6 +700,7 @@
 					"sclk_hdmiphy", "mout_hdmi";
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			phy = <&hdmiphy>;
+			#sound-dai-cells = <0>;
 			status = "disabled";
 		};
 
-- 
2.14.2
