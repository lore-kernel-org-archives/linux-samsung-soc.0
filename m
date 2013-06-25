From: Phil Carmody <phil.carmody@partner.samsung.com>
Subject: RE: [PATCH v2 6/8] ARM: dts: Add camera subsystem nodes to
 exynos4x12.dtsi
Date: Tue, 25 Jun 2013 08:24:32 +0000
Message-ID: <19E27FB8C8BBCC47BD08BAF8EB69E51E0FFD8601@ex1.seri.co.uk>
References: <1372097151-18122-1-git-send-email-s.nawrocki@samsung.com>
 <1372097151-18122-7-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:62955 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751292Ab3FYIYi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Jun 2013 04:24:38 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOX002XOWMLA8A0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Jun 2013 09:24:35 +0100 (BST)
In-reply-to: <1372097151-18122-7-git-send-email-s.nawrocki@samsung.com>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>
Cc: "t.figa@samsung.com" <t.figa@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "j.anaszewski@samsung.com" <j.anaszewski@samsung.com>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>

Sylwester Nawrocki wrote:

Add common camera node and Exynos4212/4412 specific nodes for
FIMC, MIPI-CSIS, FIMC-LITE and FIMC-IS devices.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4x12.dtsi |  118 +++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 0e24d85..f8cc1d0 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -26,6 +26,8 @@
                pinctrl1 = &pinctrl_1;
                pinctrl2 = &pinctrl_2;
                pinctrl3 = &pinctrl_3;
+               fimc-lite0 = &fimc_lite_0;
+               fimc-lite1 = &fimc_lite_1;
        };

        pd_isp: isp-power-domain@10023CA0 {
@@ -78,4 +80,120 @@
                clock-names = "sclk_fimg2d", "fimg2d";
                status = "disabled";
        };
+
+       camera {
+               clocks = <&clock 132>, <&clock 133>, <&clock 351>, <&clock 352>,
+                        <&clock 388>, <&clock 389>, <&clock 17>;
+               clock-names = "sclk_cam0", "sclk_cam1", "pxl_async0",
+                           "pxl_async1", "mux_cam0", "mux_cam1", "parent";
+
+               fimc_0: fimc@11800000 {
+                       compatible = "samsung,exynos4212-fimc";
+                       clocks = <&clock 256>, <&clock 128>, <&clock 384>, <&clock 17>;
+                       clock-names = "fimc", "sclk_fimc", "mux", "parent";
+                       samsung,pix-limits = <4224 8192 1920 4224>;
+                       samsung,mainscaler-ext;
+                       samsung,isp-wb;
+                       samsung,cam-if;
+               };
+
+               fimc_1: fimc@11810000 {
+                       compatible = "samsung,exynos4212-fimc";
+                       clocks = <&clock 257>, <&clock 129>, <&clock 385>, <&clock 17>;
+                       clock-names = "fimc", "sclk_fimc", "mux", "parent";
+                       samsung,pix-limits = <4224 8192 1920 4224>;
+                       samsung,mainscaler-ext;
+                       samsung,isp-wb;
+                       samsung,cam-if;
+               };
+
+               fimc_2: fimc@11820000 {
+                       compatible = "samsung,exynos4212-fimc";
+                       clocks = <&clock 258>, <&clock 130>, <&clock 386>, <&clock 17>;
+                       clock-names = "fimc", "sclk_fimc", "mux", "parent";
+                       samsung,pix-limits = <4224 8192 1920 4224>;
+                       samsung,mainscaler-ext;
+                       samsung,isp-wb;
+                       samsung,lcd-wb;
+                       samsung,cam-if;
+               };
+
+               fimc_3: fimc@11830000 {
+                       compatible = "samsung,exynos4212-fimc";
+                       clocks = <&clock 259>, <&clock 131>, <&clock 387>, <&clock 17>;
+                       clock-names = "fimc", "sclk_fimc", "mux", "parent";
+                       samsung,pix-limits = <1920 8192 1366 1920>;
+                       samsung,rotators = <0>;
+                       samsung,mainscaler-ext;
+                       samsung,isp-wb;
+                       samsung,lcd-wb;
+               };
+
+               csis_0: csis@11880000 {
+                       clocks = <&clock 260>, <&clock 134>, <&clock 390>, <&clock 17>;
+                       clock-names = "csis", "sclk_csis", "mux", "parent";
+               };
+
+               csis_1: csis@11890000 {
+                       clocks = <&clock 261>, <&clock 135>, <&clock 391>, <&clock 17>;
+                       clock-names = "csis", "sclk_csis", "mux", "parent";
+               };
+
+               fimc_lite_0: fimc-lite@12390000 {
+                       compatible = "samsung,exynos4212-fimc-lite";
+                       reg = <0x12390000 0x1000>;
+                       interrupts = <0 105 0>;
+                       samsung,power-domain = <&pd_isp>;
+                       clocks = <&clock 353>;
+                       clock-names = "flite";
+                       status = "disabled";
+               };
+
+               fimc_lite_1: fimc-lite@123A0000 {
+                       compatible = "samsung,exynos4212-fimc-lite";
+                       reg = <0x123A0000 0x1000>;
+                       interrupts = <0 106 0>;
+                       samsung,power-domain = <&pd_isp>;
+                       clocks = <&clock 354>;
+                       clock-names = "flite";
+                       status = "disabled";
+               };
+
+               fimc_is: fimc-is@12000000 {
+                       compatible = "samsung,exynos4212-fimc-is", "simple-bus";
+                       reg = <0x12000000 0x260000>;
+                       interrupts = <0 90 0>, <0 95 0>;
+                       samsung,power-domain = <&pd_isp>;
+                       clocks = <&clock 353>, <&clock 354>, <&clock 355>,
+                               <&clock 356>, <&clock 17>, <&clock 357>,
+                               <&clock 358>, <&clock 359>, <&clock 360>,
+                               <&clock 450>,<&clock 451>, <&clock 452>,
+                               <&clock 453>, <&clock 176>, <&clock 13>,
+                               <&clock 454>, <&clock 395>, <&clock 455>;
+                       clock-names = "lite0", "lite1", "ppmuispx",
+                                     "ppmuispmx", "mpll", "isp",


I notice a tiny typo in the documentation

--- a/Documentation/devicetree/bindings/media/exynos4-fimc-is.txt
+++ b/Documentation/devicetree/bindings/media/exynos4-fimc-is.txt
@@ -15,7 +15,7 @@ Required properties:
 - interrupts   : must contain two FIMC-IS interrupts, in order: ISP0, ISP1;
 - clocks       : list of clock specifiers, corresponding to entries in
                  clock-names property;
-- clock-names  : must contain "ppmuispx", "ppmuispx", "lite0", "lite1"
+- clock-names  : must contain "ppmuispx", "ppmuispmx", "lite0", "lite1"
                  "mpll", "sysreg", "isp", "drc", "fd", "mcuisp", "uart",
                  "ispdiv0", "ispdiv1", "mcuispdiv0", "mcuispdiv1", "aclk200",
                  "div_aclk200", "aclk400mcuisp", "div_aclk400mcuisp" entries,


+                                     "drc", "fd", "mcuisp",
+                                     "ispdiv0", "ispdiv1", "mcuispdiv0",
+                                     "mcuispdiv1", "uart", "aclk200",
+                                     "div_aclk200", "aclk400mcuisp",
+                                     "div_aclk400mcuisp";

"sysreg" is missing from that list, but is listed as required in the documentation.

+                       #address-cells = <1>;
+                       #size-cells = <1>;
+                       ranges;
+                       status = "disabled";
+
+                       pmu {
+                               reg = <0x10020000 0x3000>;
+                       };
+
+                       i2c1_isp: i2c-isp@12140000 {
+                               compatible = "samsung,exynos4212-i2c-isp";
+                               reg = <0x12130000 0x100>;

Typo 1214000 vs. 12130000?

+                               clocks = <&clock 370>;
+                               clock-names = "i2c_isp";
+                               #address-cells = <1>;
+                               #size-cells = <0>;
+                       };
+               };
+       };
 };

Cheers,
Phil
--
1.7.9.5
