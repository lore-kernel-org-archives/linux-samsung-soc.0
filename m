From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RFC 07/12] ARM: EXYNOS4: Add OF_DEV_AUXDATA for FIMC,
 FIMC-LITE and CSIS
Date: Mon, 10 Dec 2012 20:46:01 +0100
Message-ID: <1355168766-6068-8-git-send-email-s.nawrocki@samsung.com>
References: <1355168766-6068-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1355168766-6068-1-git-send-email-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, g.liakhovetski-Mmb7MZpHnFY@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Add these temporary OF_DEV_AUXDATA entries so we can use clocks
before common clock framework support for Exynos4 is available.

Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-exynos/mach-exynos4-dt.c |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index d6bdcfb..6d2eaf8 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -89,6 +89,22 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA1, "dma-pl330.1", NULL),
 	OF_DEV_AUXDATA("samsung,exynos4-fb", EXYNOS4_PA_FIMD0,
 				"exynos4-fb.0", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4210-csis", EXYNOS4_PA_MIPI_CSIS0,
+				"s5p-mipi-csis.0", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4210-csis", EXYNOS4_PA_MIPI_CSIS1,
+				"s5p-mipi-csis.1", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4212-fimc", EXYNOS4_PA_FIMC0,
+				"exynos4-fimc.0", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4212-fimc", EXYNOS4_PA_FIMC1,
+				"exynos4-fimc.1", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4212-fimc", EXYNOS4_PA_FIMC2,
+				"exynos4-fimc.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4212-fimc", EXYNOS4_PA_FIMC3,
+				"exynos4-fimc.3", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4212-fimc-lite", EXYNOS4_PA_FIMC_LITE(0),
+				"exynos-fimc-lite.0", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4212-fimc-lite", EXYNOS4_PA_FIMC_LITE(1),
+				"exynos-fimc-lite.1", NULL),
 	{},
 };
 
-- 
1.7.9.5
