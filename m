From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] clk: exynos4: fix g3d clocks
Date: Mon, 22 Sep 2014 14:17:12 +0200
Message-ID: <1411388232-6271-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:63611 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753491AbaIVMR2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 08:17:28 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NCA00IO0Y9TK910@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Sep 2014 13:20:17 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

sclk_g3d clock doesn't have enable/disable bits, but the driver hijacked
g3d gate clock bits for this purpose and didn't provide real g3d clock
at all. This patch fixes this issue by adding proper definition for g3d
clock and removing incorrect access to GATE_IP_G3D register in sclk_g3d.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index ac163d7f5bc3..111be8469e3d 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -733,8 +733,7 @@ static struct samsung_div_clock exynos4_div_clks[] __initdata = {
 	DIV(0, "div_csis0", "mout_csis0", DIV_CAM, 24, 4),
 	DIV(0, "div_csis1", "mout_csis1", DIV_CAM, 28, 4),
 	DIV(CLK_SCLK_MFC, "sclk_mfc", "mout_mfc", DIV_MFC, 0, 4),
-	DIV_F(0, "div_g3d", "mout_g3d", DIV_G3D, 0, 4,
-			CLK_SET_RATE_PARENT, 0),
+	DIV(CLK_SCLK_G3D, "sclk_g3d", "mout_g3d", DIV_G3D, 0, 4),
 	DIV(0, "div_fimd0", "mout_fimd0", DIV_LCD0, 0, 4),
 	DIV(0, "div_mipi0", "mout_mipi0", DIV_LCD0, 16, 4),
 	DIV(0, "div_audio0", "mout_audio0", DIV_MAUDIO, 0, 4),
@@ -857,8 +856,7 @@ static struct samsung_gate_clock exynos4_gate_clks[] __initdata = {
 		0),
 	GATE(CLK_TSI, "tsi", "aclk133", GATE_IP_FSYS, 4, 0, 0),
 	GATE(CLK_SROMC, "sromc", "aclk133", GATE_IP_FSYS, 11, 0, 0),
-	GATE(CLK_SCLK_G3D, "sclk_g3d", "div_g3d", GATE_IP_G3D, 0,
-			CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_G3D, "g3d", "aclk200", GATE_IP_G3D, 0, 0, 0),
 	GATE(CLK_PPMUG3D, "ppmug3d", "aclk200", GATE_IP_G3D, 1, 0, 0),
 	GATE(CLK_USB_DEVICE, "usb_device", "aclk133", GATE_IP_FSYS, 13, 0, 0),
 	GATE(CLK_ONENAND, "onenand", "aclk133", GATE_IP_FSYS, 15, 0, 0),
-- 
1.9.2
