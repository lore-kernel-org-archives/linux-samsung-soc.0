From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 4/7] arm: dts: Add syscon-{reboot,
 poweroff} nodes for exynos5410 SoC
Date: Mon, 19 Oct 2015 11:33:52 +0530
Message-ID: <1445234635-3950-5-git-send-email-alim.akhtar@samsung.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org
Cc: javier@osg.samsung.com, k.kozlowski@samsung.com, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds syscon-{reboot, poweroff} nodes to allow the
generic syscon-{reboot, poweroff} driver to reset/poweroff exynos5410 SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm/boot/dts/exynos5410.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 731eefd23fa9..b9bef8b5ffc9 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -102,6 +102,20 @@
 			reg = <0x10040000 0x5000>;
 		};
 
+		poweroff: syscon-poweroff {
+			compatible = "syscon-poweroff";
+			regmap = <&pmu_system_controller>;
+			offset = <0x330C>;
+			mask = <0x5200>;
+		};
+
+		reboot: syscon-reboot {
+			compatible = "syscon-reboot";
+			regmap = <&pmu_system_controller>;
+			offset = <0x0400>;
+			mask = <0x1>;
+		};
+
 		mct: mct@101C0000 {
 			compatible = "samsung,exynos4210-mct";
 			reg = <0x101C0000 0xB00>;
-- 
1.7.10.4
