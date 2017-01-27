From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] ARM: dts: exynos: Increase MFC left reserved memory region
 size
Date: Fri, 27 Jan 2017 17:10:46 -0300
Message-ID: <1485547846-12778-1-git-send-email-javier@osg.samsung.com>
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
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, linux-samsung-soc@vger.kernel.org, Thibault Saunier <thibault.saunier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Russell King <linux@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The sizes of the MFC reserved memory regions for CMA are 16 MiB for the
left bank and 8 MiB for the right bank. But this isn't enough to decode
high resolution videos so increase the size for the left bank to 36 MiB
which is enough for 1080p (1920x1080).

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 arch/arm/boot/dts/exynos-mfc-reserved-memory.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos-mfc-reserved-memory.dtsi b/arch/arm/boot/dts/exynos-mfc-reserved-memory.dtsi
index f78c14c82e17..25186ac4188d 100644
--- a/arch/arm/boot/dts/exynos-mfc-reserved-memory.dtsi
+++ b/arch/arm/boot/dts/exynos-mfc-reserved-memory.dtsi
@@ -17,7 +17,7 @@
 		mfc_left: region_mfc_left {
 			compatible = "shared-dma-pool";
 			no-map;
-			size = <0x1000000>;
+			size = <0x2400000>;
 			alignment = <0x100000>;
 		};
 
-- 
2.7.4
