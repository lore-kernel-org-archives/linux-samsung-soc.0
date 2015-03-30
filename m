From: Matthew Leach <matthew@mattleach.net>
Subject: [PATCH] ARM: dts: exynos4412: Enable AX88760 USB hub on Origen board
Date: Mon, 30 Mar 2015 19:25:14 +0100
Message-ID: <1427739914-24862-1-git-send-email-matthew@mattleach.net>
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
To: linux-samsung-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Matthew Leach <matthew@mattleach.net>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Enable the Origen's usb phy and ohci devices in the device tree.  Also
add the "samsung,vbus-gpio" property to enable the GPX3(5) gpio pin so
the AX88760 hub is powered.

Signed-off-by: Matthew Leach <matthew@mattleach.net>
---
 arch/arm/boot/dts/exynos4412-origen.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index bd8b730..c810ca3 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -531,4 +531,19 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	exynos-usbphy@125B0000 {
+		status = "okay";
+	};
+
+	ehci@12580000 {
+		samsung,vbus-gpio = <&gpx3 5 1>;
+		status = "okay";
+		port@1{
+			status = "okay";
+		};
+		port@2 {
+			status = "okay";
+		};
+	};
 };
-- 
2.3.4
