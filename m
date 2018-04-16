From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/3] arm: dts: exynos: Add serial path for Rinato board to
 get earlycon support
Date: Mon, 16 Apr 2018 12:35:35 +0200
Message-ID: <20180416103537.29518-1-m.szyprowski@samsung.com>
References: <CGME20180416103544eucas1p2c393cdccdb79955b64e57ccc53456479@eucas1p2.samsung.com>
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
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add 'chosen' node with 'stdout-path' property to instruct kernel which
serial driver should be used for kernel console/logs. This allows to
enable earlycon messages by adding just 'earlycon' parameter to kernel
command line.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250-rinato.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 2c3460781cc6..2a6b828c01b7 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -24,6 +24,10 @@
 		i2c7 = &i2c_max77836;
 	};
 
+	chosen {
+		stdout-path = &serial_1;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg =  <0x40000000 0x1ff00000>;
-- 
2.15.0
