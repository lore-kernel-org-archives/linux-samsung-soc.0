From: Humberto Silva Naves <hsnaves@gmail.com>
Subject: [PATCH 1/3] clk: exynos5410: Add the definitions of new clock registers
Date: Wed, 30 Jul 2014 16:36:01 +0200
Message-ID: <1406730963-30658-1-git-send-email-hsnaves@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:53727 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752834AbaG3OgP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jul 2014 10:36:15 -0400
Received: by mail-wi0-f175.google.com with SMTP id ho1so7623846wib.14
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2014 07:36:12 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Tomasz Figa <t.figa@samsung.com>, Humberto Silva Naves <hsnaves@gmail.com>

Added clock register definitions for the majority of the relevant
clocks inside the SoC, including the definitions of all PLL's clocks.
The definitions are now ordered by name, in order to make the
driver more readable and reduce the chances of potential conflicts
when adding new entries. The different register groups (SRC, DIV, PLL,
GATE, etc) are separated by a blank line.

Signed-off-by: Humberto Silva Naves <hsnaves@gmail.com>
---
 drivers/clk/samsung/clk-exynos5410.c |  144 ++++++++++++++++++++++++++++------
 1 file changed, 122 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
index 231475b..72a533e 100644
--- a/drivers/clk/samsung/clk-exynos5410.c
+++ b/drivers/clk/samsung/clk-exynos5410.c
@@ -19,39 +19,139 @@
 
 #include "clk.h"
 
-#define APLL_LOCK               0x0
-#define APLL_CON0               0x100
-#define CPLL_LOCK               0x10020
-#define CPLL_CON0               0x10120
-#define MPLL_LOCK               0x4000
-#define MPLL_CON0               0x4100
-#define BPLL_LOCK               0x20010
-#define BPLL_CON0               0x20110
-#define KPLL_LOCK               0x28000
-#define KPLL_CON0               0x28100
+#define APLL_CON0		0x100
+#define APLL_LOCK		0x0
+#define BPLL_CON0		0x20110
+#define BPLL_LOCK		0x20010
+#define CPLL_CON0		0x10120
+#define CPLL_CON1		0x10124
+#define CPLL_LOCK		0x10020
+#define DPLL_CON0		0x10128
+#define DPLL_CON1		0x1012C
+#define DPLL_LOCK		0x10030
+#define EPLL_CON0		0x10130
+#define EPLL_CON1		0x10134
+#define EPLL_CON2		0x10138
+#define EPLL_LOCK		0x10040
+#define IPLL_CON0		0x10150
+#define IPLL_CON1		0x10154
+#define IPLL_LOCK		0x10060
+#define KPLL_CON0		0x28100
+#define KPLL_LOCK		0x28000
+#define MPLL_CON0		0x4100
+#define MPLL_LOCK		0x4000
+#define VPLL_CON0		0x10140
+#define VPLL_CON1		0x10144
+#define VPLL_CON2		0x10148
+#define VPLL_LOCK		0x10050
 
-#define SRC_CPU			0x200
-#define DIV_CPU0		0x500
+#define SRC_CDREX		0x20200
+#define SRC_CPERI0		0x4200
 #define SRC_CPERI1		0x4204
-#define DIV_TOP0		0x10510
-#define DIV_TOP1		0x10514
-#define DIV_FSYS1		0x1054c
-#define DIV_FSYS2		0x10550
-#define DIV_PERIC0		0x10558
+#define SRC_CPU			0x200
+#define SRC_DISP0_0		0x10224
+#define SRC_DISP0_1		0x10228
+#define SRC_DISP1_0		0x1022C
+#define SRC_DISP1_1		0x10230
+#define SRC_FSYS		0x10244
+#define SRC_GSCL		0x10220
+#define SRC_KFC			0x28200
+#define SRC_MAU			0x10240
+#define SRC_PERIC0		0x10250
+#define SRC_PERIC1		0x10254
 #define SRC_TOP0		0x10210
 #define SRC_TOP1		0x10214
 #define SRC_TOP2		0x10218
-#define SRC_FSYS		0x10244
-#define SRC_PERIC0		0x10250
+#define SRC_TOP3		0x1021C
+
+#define SRC_MASK_DISP0_0	0x10324
+#define SRC_MASK_DISP0_1	0x10328
+#define SRC_MASK_DISP1_0	0x1032C
+#define SRC_MASK_DISP1_1	0x10330
 #define SRC_MASK_FSYS		0x10340
+#define SRC_MASK_GEN		0x10344
+#define SRC_MASK_GSCL		0x10320
+#define SRC_MASK_MAU		0x10334
 #define SRC_MASK_PERIC0		0x10350
+#define SRC_MASK_PERIC1		0x10354
+#define SRC_MASK_TOP		0x10310
+
+#define DIV_CDREX		0x20500
+#define DIV_CDREX2		0x20504
+#define DIV_CPERI0		0x4500
+#define DIV_CPERI1		0x4504
+#define DIV_CPU0		0x500
+#define DIV_CPU1		0x504
+#define DIV_DISP0_0		0x10524
+#define DIV_DISP0_1		0x10528
+#define DIV_DISP1_0		0x1052C
+#define DIV_DISP1_1		0x10530
+#define DIV_FSYS0		0x10548
+#define DIV_FSYS1		0x1054C
+#define DIV_FSYS2		0x10550
+#define DIV_FSYS3		0x10554
+#define DIV_GEN			0x1053C
+#define DIV_GSCL		0x10520
+#define DIV_G2D			0x8500
+#define DIV_ISP0		0x0C300
+#define DIV_ISP1		0x0C304
+#define DIV_ISP2		0x0C308
+#define DIV_KFC0		0x28500
+#define DIV_MAU			0x10544
+#define DIV_PERIC0		0x10558
+#define DIV_PERIC1		0x1055C
+#define DIV_PERIC2		0x10560
+#define DIV_PERIC3		0x10564
+#define DIV_PERIC4		0x10568
+#define DIV_PERIC5		0x1056C
+#define DIV_TOP0		0x10510
+#define DIV_TOP1		0x10514
+#define DIV_TOP2		0x10518
+#define DIV_TOP3		0x1051C
+#define DIV2_RATIO0		0x10590
+#define DIV2_RATIO1		0x10594
+
+#define GATE_BUS_CDREX		0x20700
+#define GATE_BUS_CPU		0x700
+#define GATE_BUS_DISP0		0x10724
+#define GATE_BUS_DISP1		0x10728
 #define GATE_BUS_FSYS0		0x10740
+#define GATE_BUS_FSYS1		0x10744
+#define GATE_BUS_GEN		0x1073C
+#define GATE_BUS_GSCL0		0x10710
+#define GATE_BUS_GSCL1		0x10720
+#define GATE_BUS_G3D		0x10738
+#define GATE_BUS_MFC		0x10734
+
+#define GATE_IP_CDREX		0x20900
+#define GATE_IP_CORE		0x4900
+#define GATE_IP_DISP0		0x10924
+#define GATE_IP_DISP1		0x10928
 #define GATE_IP_FSYS		0x10944
+#define GATE_IP_GEN		0x10934
+#define GATE_IP_GSCL0		0x10910
+#define GATE_IP_GSCL1		0x10920
+#define GATE_IP_G2D		0x8800
+#define GATE_IP_G3D		0x10930
+#define GATE_IP_ISP0		0x0C800
+#define GATE_IP_ISP1		0x0C804
+#define GATE_IP_MFC		0x1092C
 #define GATE_IP_PERIC		0x10950
 #define GATE_IP_PERIS		0x10960
-#define SRC_CDREX		0x20200
-#define SRC_KFC			0x28200
-#define DIV_KFC0		0x28500
+
+#define GATE_TOP_SCLK_DISP0	0x10824
+#define GATE_TOP_SCLK_DISP1	0x10828
+#define GATE_TOP_SCLK_FSYS	0x10840
+#define GATE_TOP_SCLK_GEN	0x1082C
+#define GATE_TOP_SCLK_GSCL	0x10820
+#define GATE_TOP_SCLK_MAU	0x1083C
+#define GATE_TOP_SCLK_PERIC	0x10850
+
+#define GATE_SCLK_CPU		0x800
+#define SCLK_DIV_ISP		0x10580
+#define SCLK_DIV_ISP1		0x10584
+#define SCLK_SRC_ISP		0x10270
+
 
 /* list of PLLs */
 enum exynos5410_plls {
-- 
1.7.10.4
