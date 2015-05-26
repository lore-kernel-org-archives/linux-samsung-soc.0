From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v3] ARM: dts: Add SPI CS on exynos5250-snow
Date: Tue, 26 May 2015 12:41:23 +0200
Message-ID: <e1952e8c102a3b7a7f3f79c759c44093e0d11dc7.1438073049.git.hramrach@gmail.com>
References: <a5054dfad3d48c582b062b0536125c9bcff41f31.1438027526.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a5054dfad3d48c582b062b0536125c9bcff41f31.1438027526.git.hramrach@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Although there is only one choice of chipselect it is necessary to
specify it. The driver cannot claim the gpio otherwise.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
Acked-by: Javier Martinez Canillas <javier@osg.samsung.com>
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

--
 - don't move unrelated line
 - use symbolic GPIO_ACTIVE_HIGH
---
 arch/arm/boot/dts/exynos5250-snow.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index b7f4122..2d6a976 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -688,6 +688,7 @@
 	status = "okay";
 	samsung,spi-src-clk = <0>;
 	num-cs = <1>;
+	cs-gpios = <&gpa2 5 GPIO_ACTIVE_HIGH>;
 };
 
 &usbdrd_dwc3 {
-- 
2.1.4
