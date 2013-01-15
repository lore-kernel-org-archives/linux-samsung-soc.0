From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 3/4] ARM: Exynos5250: Add clock information for dwc3-exynos
Date: Tue, 15 Jan 2013 19:08:31 +0530
Message-ID: <1358257112-19595-4-git-send-email-gautam.vivek@samsung.com>
References: <1358257112-19595-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1358257112-19595-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Adding necessary device clock to exynos5 needed for
the DWC3 controller.

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-exynos/clock-exynos5.c |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 0208c3a..13af020 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -757,6 +757,11 @@ static struct clk exynos5_init_clocks_off[] = {
 		.enable		= exynos5_clk_ip_fsys_ctrl ,
 		.ctrlbit	= (1 << 18),
 	}, {
+		.name		= "usbdrd30",
+		.parent		= &exynos5_clk_aclk_200.clk,
+		.enable		= exynos5_clk_ip_fsys_ctrl,
+		.ctrlbit	= (1 << 19),
+	}, {
 		.name		= "usbotg",
 		.enable		= exynos5_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 7),
@@ -1035,6 +1040,16 @@ static struct clksrc_sources exynos5_clkset_group = {
 	.nr_sources	= ARRAY_SIZE(exynos5_clkset_group_list),
 };
 
+struct clk *exynos5_clkset_usbdrd30_list[] = {
+	[0] = &exynos5_clk_mout_mpll.clk,
+	[1] = &exynos5_clk_mout_cpll.clk,
+};
+
+struct clksrc_sources exynos5_clkset_usbdrd30 = {
+	.sources        = exynos5_clkset_usbdrd30_list,
+	.nr_sources     = ARRAY_SIZE(exynos5_clkset_usbdrd30_list),
+};
+
 /* Possible clock sources for aclk_266_gscl_sub Mux */
 static struct clk *clk_src_gscl_266_list[] = {
 	[0] = &clk_ext_xtal_mux,
@@ -1329,6 +1344,15 @@ static struct clksrc_clk exynos5_clksrcs[] = {
 			.parent		= &exynos5_clk_mout_cpll.clk,
 		},
 		.reg_div = { .reg = EXYNOS5_CLKDIV_GEN, .shift = 4, .size = 3 },
+	}, {
+		.clk    = {
+			.name           = "sclk_usbdrd30",
+			.enable         = exynos5_clksrc_mask_fsys_ctrl,
+			.ctrlbit        = (1 << 28),
+		},
+		.sources = &exynos5_clkset_usbdrd30,
+		.reg_src = { .reg = EXYNOS5_CLKSRC_FSYS, .shift = 28, .size = 1 },
+		.reg_div = { .reg = EXYNOS5_CLKDIV_FSYS0, .shift = 24, .size = 4 },
 	},
 };
 
-- 
1.7.6.5
