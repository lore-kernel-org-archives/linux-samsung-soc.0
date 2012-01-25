From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 5/6] ARM: SAMSUNG: Correct M-5MOLS sensor clock frequency on
 Nuri board
Date: Wed, 25 Jan 2012 15:23:26 +0100
Message-ID: <1327501407-1927-6-git-send-email-s.nawrocki@samsung.com>
References: <1327501407-1927-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:62684 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751373Ab2AYOXx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jan 2012 09:23:53 -0500
Received: from euspt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LYC00ACJYNRF9@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2012 14:23:51 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYC00395YNRDN@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2012 14:23:51 +0000 (GMT)
In-reply-to: <1327501407-1927-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

In order to keep the sensor's master clock frequency in valid range
when FIMC parent clock is xusbxti, the specified frequency must be
exactly 24MHZ, otherwise it's being set to too low value due to
rounding.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-universal_c210.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 44fc43e..0e3aeb9 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -973,7 +973,7 @@ static struct s5p_fimc_isp_info universal_camera_sensors[] = {
 		.bus_type	= FIMC_MIPI_CSI2,
 		.board_info	= &m5mols_board_info,
 		.i2c_bus_num	= 0,
-		.clk_frequency	= 21600000UL,
+		.clk_frequency	= 24000000UL,
 		.csi_data_align	= 32,
 	},
 };
-- 
1.7.8.3
