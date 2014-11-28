From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH RFT 2/2] arm: dts: disable CCI on exynos420 based arndale-octa
Date: Fri, 28 Nov 2014 20:20:09 +0530
Message-ID: <1417186209-5256-2-git-send-email-a.kesavan@samsung.com>
References: <1417186209-5256-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1417186209-5256-1-git-send-email-a.kesavan@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, khilman@kernel.org, nicolas.pitre@linaro.org, lorenzo.pieralisi@arm.com, punit.agrawal@arm.com, will.deacon@arm.com, mark.rutland@arm.com
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, b.zolnierkie@samsung.com, dianders@chromium.org, kgene@kernel.org, olof@lixom.net, kgene.kim@samsung.com, kesavan.abhilash@gmail.com, javier.martinez@collabora.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

The arndale-octa board was giving "imprecise external aborts" during
boot-up with MCPM enabled. CCI enablement of the boot cluster was found
to be the cause of these aborts (possibly because the secure f/w was not
allowing it). Hence, disable CCI for the arndale-octa board.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |    4 ++++
 arch/arm/boot/dts/exynos5420.dtsi             |    2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index aa7a7d7..db2c1c4 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -372,3 +372,7 @@
 &usbdrd_dwc3_1 {
 	dr_mode = "host";
 };
+
+&cci {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 517e50f..0a82ae7 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -120,7 +120,7 @@
 		};
 	};
 
-	cci@10d20000 {
+	cci: cci@10d20000 {
 		compatible = "arm,cci-400";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.9.5
