From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 2/2] ARM: dts: exynos: Use correct mfc_pd async-bridge clock
 for Exynos5420
Date: Thu, 19 Jan 2017 19:29:55 -0300
Message-ID: <1484864995-10679-2-git-send-email-javier@osg.samsung.com>
References: <1484864995-10679-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484864995-10679-1-git-send-email-javier@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Russell King <linux@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Commit 94aed538e032 ("ARM: dts: exynos: Add async-bridge clock to MFC
power domain for Exynos5420") fixed an imprecise external abort error
when the MFC registers were tried to be accessed and the needed clock
for the asynchronous bridges were gated.

But according to the Exynos5420 manual the "Gating AXI clock for MFC"
is not CLK_ACLK333 but CLK_MFC.

The end effect is the same because CLK_ACLK333 is a parent of CLK_MFC
but the correct clock should be used instead.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 arch/arm/boot/dts/exynos5420.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 906a1a42a7ea..ffb148ea91d6 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -294,7 +294,7 @@
 			reg = <0x10044060 0x20>;
 			clocks = <&clock CLK_FIN_PLL>,
 				 <&clock CLK_MOUT_USER_ACLK333>,
-				 <&clock CLK_ACLK333>;
+				 <&clock CLK_MFC>;
 			clock-names = "oscclk", "clk0","asb0";
 			#power-domain-cells = <0>;
 		};
-- 
2.7.4
