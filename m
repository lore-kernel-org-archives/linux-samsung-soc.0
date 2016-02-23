From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 4/6] clk: samsung: exynos5433: Drop RO registers from the
 save/restore lists
Date: Tue, 23 Feb 2016 13:14:30 +0100
Message-ID: <1456229672-13445-5-git-send-email-s.nawrocki@samsung.com>
References: <1456229672-13445-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57094 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751851AbcBWMSy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Feb 2016 07:18:54 -0500
In-reply-to: <1456229672-13445-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org, jonghwa3.lee@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Restoring read-only registers is of not much effect, drop them
from the respective lists.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 100 -----------------------------------
 1 file changed, 100 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index a1dfcb8..eb4d141 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -142,17 +142,6 @@ static unsigned long top_clk_regs[] __initdata = {
 	MUX_ENABLE_TOP_FSYS1,
 	MUX_ENABLE_TOP_PERIC0,
 	MUX_ENABLE_TOP_PERIC1,
-	MUX_STAT_TOP0,
-	MUX_STAT_TOP1,
-	MUX_STAT_TOP2,
-	MUX_STAT_TOP3,
-	MUX_STAT_TOP4,
-	MUX_STAT_TOP_MSCL,
-	MUX_STAT_TOP_CAM1,
-	MUX_STAT_TOP_FSYS0,
-	MUX_STAT_TOP_FSYS1,
-	MUX_STAT_TOP_PERIC0,
-	MUX_STAT_TOP_PERIC1,
 	DIV_TOP0,
 	DIV_TOP1,
 	DIV_TOP2,
@@ -170,22 +159,6 @@ static unsigned long top_clk_regs[] __initdata = {
 	DIV_TOP_PERIC3,
 	DIV_TOP_PERIC4,
 	DIV_TOP_PLL_FREQ_DET,
-	DIV_STAT_TOP0,
-	DIV_STAT_TOP1,
-	DIV_STAT_TOP2,
-	DIV_STAT_TOP3,
-	DIV_STAT_TOP4,
-	DIV_STAT_TOP_MSCL,
-	DIV_STAT_TOP_CAM10,
-	DIV_STAT_TOP_CAM11,
-	DIV_STAT_TOP_FSYS0,
-	DIV_STAT_TOP_FSYS1,
-	DIV_STAT_TOP_FSYS2,
-	DIV_STAT_TOP_PERIC0,
-	DIV_STAT_TOP_PERIC1,
-	DIV_STAT_TOP_PERIC2,
-	DIV_STAT_TOP_PERIC3,
-	DIV_STAT_TOP_PLL_FREQ_DET,
 	ENABLE_ACLK_TOP,
 	ENABLE_SCLK_TOP,
 	ENABLE_SCLK_TOP_MSCL,
@@ -999,26 +972,12 @@ static unsigned long mif_clk_regs[] __initdata = {
 	MUX_ENABLE_MIF5,
 	MUX_ENABLE_MIF6,
 	MUX_ENABLE_MIF7,
-	MUX_STAT_MIF0,
-	MUX_STAT_MIF1,
-	MUX_STAT_MIF2,
-	MUX_STAT_MIF3,
-	MUX_STAT_MIF4,
-	MUX_STAT_MIF5,
-	MUX_STAT_MIF6,
-	MUX_STAT_MIF7,
 	DIV_MIF1,
 	DIV_MIF2,
 	DIV_MIF3,
 	DIV_MIF4,
 	DIV_MIF5,
 	DIV_MIF_PLL_FREQ_DET,
-	DIV_STAT_MIF1,
-	DIV_STAT_MIF2,
-	DIV_STAT_MIF3,
-	DIV_STAT_MIF4,
-	DIV_STAT_MIF5,
-	DIV_STAT_MIF_PLL_FREQ_DET,
 	ENABLE_ACLK_MIF0,
 	ENABLE_ACLK_MIF1,
 	ENABLE_ACLK_MIF2,
@@ -1565,7 +1524,6 @@ CLK_OF_DECLARE(exynos5433_cmu_mif, "samsung,exynos5433-cmu-mif",
 
 static unsigned long peric_clk_regs[] __initdata = {
 	DIV_PERIC,
-	DIV_STAT_PERIC,
 	ENABLE_ACLK_PERIC,
 	ENABLE_PCLK_PERIC0,
 	ENABLE_PCLK_PERIC1,
@@ -2012,11 +1970,6 @@ static unsigned long fsys_clk_regs[] __initdata = {
 	MUX_ENABLE_FSYS2,
 	MUX_ENABLE_FSYS3,
 	MUX_ENABLE_FSYS4,
-	MUX_STAT_FSYS0,
-	MUX_STAT_FSYS1,
-	MUX_STAT_FSYS2,
-	MUX_STAT_FSYS3,
-	MUX_STAT_FSYS4,
 	MUX_IGNORE_FSYS2,
 	MUX_IGNORE_FSYS3,
 	ENABLE_ACLK_FSYS0,
@@ -2362,9 +2315,7 @@ CLK_OF_DECLARE(exynos5433_cmu_fsys, "samsung,exynos5433-cmu-fsys",
 static unsigned long g2d_clk_regs[] __initdata = {
 	MUX_SEL_G2D0,
 	MUX_SEL_ENABLE_G2D0,
-	MUX_SEL_STAT_G2D0,
 	DIV_G2D,
-	DIV_STAT_G2D,
 	DIV_ENABLE_ACLK_G2D,
 	DIV_ENABLE_ACLK_G2D_SECURE_SMMU_G2D,
 	DIV_ENABLE_PCLK_G2D,
@@ -2520,16 +2471,9 @@ static unsigned long disp_clk_regs[] __initdata = {
 	MUX_ENABLE_DISP2,
 	MUX_ENABLE_DISP3,
 	MUX_ENABLE_DISP4,
-	MUX_STAT_DISP0,
-	MUX_STAT_DISP1,
-	MUX_STAT_DISP2,
-	MUX_STAT_DISP3,
-	MUX_STAT_DISP4,
 	MUX_IGNORE_DISP2,
 	DIV_DISP,
 	DIV_DISP_PLL_FREQ_DET,
-	DIV_STAT_DISP,
-	DIV_STAT_DISP_PLL_FREQ_DET,
 	ENABLE_ACLK_DISP0,
 	ENABLE_ACLK_DISP1,
 	ENABLE_PCLK_DISP,
@@ -2923,11 +2867,8 @@ static unsigned long aud_clk_regs[] __initdata = {
 	MUX_SEL_AUD1,
 	MUX_ENABLE_AUD0,
 	MUX_ENABLE_AUD1,
-	MUX_STAT_AUD0,
 	DIV_AUD0,
 	DIV_AUD1,
-	DIV_STAT_AUD0,
-	DIV_STAT_AUD1,
 	ENABLE_ACLK_AUD,
 	ENABLE_PCLK_AUD,
 	ENABLE_SCLK_AUD0,
@@ -3091,7 +3032,6 @@ PNAME(mout_aclk_bus2_400_p)	= { "oscclk", "aclk_bus2_400", };
 
 #define CMU_BUS_COMMON_CLK_REGS	\
 	DIV_BUS,		\
-	DIV_STAT_BUS,		\
 	ENABLE_ACLK_BUS,	\
 	ENABLE_PCLK_BUS,	\
 	ENABLE_IP_BUS0,		\
@@ -3104,7 +3044,6 @@ static unsigned long bus01_clk_regs[] __initdata = {
 static unsigned long bus2_clk_regs[] __initdata = {
 	MUX_SEL_BUS2,
 	MUX_ENABLE_BUS2,
-	MUX_STAT_BUS2,
 	CMU_BUS_COMMON_CLK_REGS,
 };
 
@@ -3263,11 +3202,8 @@ static unsigned long g3d_clk_regs[] __initdata = {
 	G3D_PLL_FREQ_DET,
 	MUX_SEL_G3D,
 	MUX_ENABLE_G3D,
-	MUX_STAT_G3D,
 	DIV_G3D,
 	DIV_G3D_PLL_FREQ_DET,
-	DIV_STAT_G3D,
-	DIV_STAT_G3D_PLL_FREQ_DET,
 	ENABLE_ACLK_G3D,
 	ENABLE_PCLK_G3D,
 	ENABLE_SCLK_G3D,
@@ -3383,7 +3319,6 @@ CLK_OF_DECLARE(exynos5433_cmu_g3d, "samsung,exynos5433-cmu-g3d",
 static unsigned long gscl_clk_regs[] __initdata = {
 	MUX_SEL_GSCL,
 	MUX_ENABLE_GSCL,
-	MUX_STAT_GSCL,
 	ENABLE_ACLK_GSCL,
 	ENABLE_ACLK_GSCL_SECURE_SMMU_GSCL0,
 	ENABLE_ACLK_GSCL_SECURE_SMMU_GSCL1,
@@ -3547,15 +3482,9 @@ static unsigned long apollo_clk_regs[] __initdata = {
 	MUX_ENABLE_APOLLO0,
 	MUX_ENABLE_APOLLO1,
 	MUX_ENABLE_APOLLO2,
-	MUX_STAT_APOLLO0,
-	MUX_STAT_APOLLO1,
-	MUX_STAT_APOLLO2,
 	DIV_APOLLO0,
 	DIV_APOLLO1,
 	DIV_APOLLO_PLL_FREQ_DET,
-	DIV_STAT_APOLLO0,
-	DIV_STAT_APOLLO1,
-	DIV_STAT_APOLLO_PLL_FREQ_DET,
 	ENABLE_ACLK_APOLLO,
 	ENABLE_PCLK_APOLLO,
 	ENABLE_SCLK_APOLLO,
@@ -3739,15 +3668,9 @@ static unsigned long atlas_clk_regs[] __initdata = {
 	MUX_ENABLE_ATLAS0,
 	MUX_ENABLE_ATLAS1,
 	MUX_ENABLE_ATLAS2,
-	MUX_STAT_ATLAS0,
-	MUX_STAT_ATLAS1,
-	MUX_STAT_ATLAS2,
 	DIV_ATLAS0,
 	DIV_ATLAS1,
 	DIV_ATLAS_PLL_FREQ_DET,
-	DIV_STAT_ATLAS0,
-	DIV_STAT_ATLAS1,
-	DIV_STAT_ATLAS_PLL_FREQ_DET,
 	ENABLE_ACLK_ATLAS,
 	ENABLE_PCLK_ATLAS,
 	ENABLE_SCLK_ATLAS,
@@ -3941,10 +3864,7 @@ static unsigned long mscl_clk_regs[] __initdata = {
 	MUX_SEL_MSCL1,
 	MUX_ENABLE_MSCL0,
 	MUX_ENABLE_MSCL1,
-	MUX_STAT_MSCL0,
-	MUX_STAT_MSCL1,
 	DIV_MSCL,
-	DIV_STAT_MSCL,
 	ENABLE_ACLK_MSCL,
 	ENABLE_ACLK_MSCL_SECURE_SMMU_M2MSCALER0,
 	ENABLE_ACLK_MSCL_SECURE_SMMU_M2MSCALER1,
@@ -4101,9 +4021,7 @@ CLK_OF_DECLARE(exynos5433_cmu_mscl, "samsung,exynos5433-cmu-mscl",
 static unsigned long mfc_clk_regs[] __initdata = {
 	MUX_SEL_MFC,
 	MUX_ENABLE_MFC,
-	MUX_STAT_MFC,
 	DIV_MFC,
-	DIV_STAT_MFC,
 	ENABLE_ACLK_MFC,
 	ENABLE_ACLK_MFC_SECURE_SMMU_MFC,
 	ENABLE_PCLK_MFC,
@@ -4211,9 +4129,7 @@ CLK_OF_DECLARE(exynos5433_cmu_mfc, "samsung,exynos5433-cmu-mfc",
 static unsigned long hevc_clk_regs[] __initdata = {
 	MUX_SEL_HEVC,
 	MUX_ENABLE_HEVC,
-	MUX_STAT_HEVC,
 	DIV_HEVC,
-	DIV_STAT_HEVC,
 	ENABLE_ACLK_HEVC,
 	ENABLE_ACLK_HEVC_SECURE_SMMU_HEVC,
 	ENABLE_PCLK_HEVC,
@@ -4325,9 +4241,7 @@ CLK_OF_DECLARE(exynos5433_cmu_hevc, "samsung,exynos5433-cmu-hevc",
 static unsigned long isp_clk_regs[] __initdata = {
 	MUX_SEL_ISP,
 	MUX_ENABLE_ISP,
-	MUX_STAT_ISP,
 	DIV_ISP,
-	DIV_STAT_ISP,
 	ENABLE_ACLK_ISP0,
 	ENABLE_ACLK_ISP1,
 	ENABLE_ACLK_ISP2,
@@ -4607,20 +4521,11 @@ static unsigned long cam0_clk_regs[] __initdata = {
 	MUX_ENABLE_CAM02,
 	MUX_ENABLE_CAM03,
 	MUX_ENABLE_CAM04,
-	MUX_STAT_CAM00,
-	MUX_STAT_CAM01,
-	MUX_STAT_CAM02,
-	MUX_STAT_CAM03,
-	MUX_STAT_CAM04,
 	MUX_IGNORE_CAM01,
 	DIV_CAM00,
 	DIV_CAM01,
 	DIV_CAM02,
 	DIV_CAM03,
-	DIV_STAT_CAM00,
-	DIV_STAT_CAM01,
-	DIV_STAT_CAM02,
-	DIV_STAT_CAM03,
 	ENABLE_ACLK_CAM00,
 	ENABLE_ACLK_CAM01,
 	ENABLE_ACLK_CAM02,
@@ -5078,14 +4983,9 @@ static unsigned long cam1_clk_regs[] __initdata = {
 	MUX_ENABLE_CAM10,
 	MUX_ENABLE_CAM11,
 	MUX_ENABLE_CAM12,
-	MUX_STAT_CAM10,
-	MUX_STAT_CAM11,
-	MUX_STAT_CAM12,
 	MUX_IGNORE_CAM11,
 	DIV_CAM10,
 	DIV_CAM11,
-	DIV_STAT_CAM10,
-	DIV_STAT_CAM11,
 	ENABLE_ACLK_CAM10,
 	ENABLE_ACLK_CAM11,
 	ENABLE_ACLK_CAM12,
-- 
1.9.1
