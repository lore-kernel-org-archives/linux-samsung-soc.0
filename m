From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 3/4] ARM: dts: exynos4: add node for PL330 MDMA1 controller
Date: Thu, 22 Nov 2012 11:57:26 +0100
Message-ID: <201211221157.26615.b.zolnierkie@samsung.com>
References: <1351504796-24788-1-git-send-email-b.zolnierkie@samsung.com>
 <1351504796-24788-4-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1351504796-24788-4-git-send-email-b.zolnierkie@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, vinod.koul@intel.com, t.figa@samsung.com, jassisinghbrar@gmail.com, rob.herring@calxeda.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, dinguyen@altera.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


Hi Kukjin,

Could you also apply this patch?

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung Poland R&D Center


From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2] ARM: dts: exynos4: add node for PL330 MDMA1 controller

Add missing PL330 MDMA1 controller node to the device tree (DT).

[ Currently there is no problem with using 'non-secure' mdma1 address
  instead of 'secure' one on revision 0 of Exynos4210 SOC (as used by
  Universal C210 board) as this SOC revision is unsupported by DT. ]

Reviewed-by: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
v2: refreshed againt next-20121115 and added Reviewed-by tag

 arch/arm/boot/dts/exynos4.dtsi         |    6 ++++++
 arch/arm/mach-exynos/mach-exynos4-dt.c |    1 +
 2 files changed, 7 insertions(+)

Index: b/arch/arm/boot/dts/exynos4.dtsi
===================================================================
--- a/arch/arm/boot/dts/exynos4.dtsi	2012-11-22 11:40:51.000000000 +0100
+++ b/arch/arm/boot/dts/exynos4.dtsi	2012-11-22 11:53:29.520815274 +0100
@@ -244,5 +244,11 @@
 			reg = <0x12690000 0x1000>;
 			interrupts = <0 36 0>;
 		};
+
+		mdma1: mdma@12850000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x12850000 0x1000>;
+			interrupts = <0 34 0>;
+		};
 	};
 };
Index: b/arch/arm/mach-exynos/mach-exynos4-dt.c
===================================================================
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c	2012-11-22 11:40:51.000000000 +0100
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c	2012-11-22 11:53:55.248815271 +0100
@@ -77,6 +77,7 @@ static const struct of_dev_auxdata exyno
 				"exynos4210-spi.2", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA0, "dma-pl330.0", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA1, "dma-pl330.1", NULL),
+	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_MDMA1, "dma-pl330.2", NULL),
 	OF_DEV_AUXDATA("samsung,exynos4210-tmu", EXYNOS4_PA_TMU,
 				"exynos-tmu", NULL),
 	{},
