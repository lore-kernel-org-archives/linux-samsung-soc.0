From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/6] ARM: SAMSUNG: Increase virtual framebuffer size on
 Universal C210 board
Date: Wed, 25 Jan 2012 15:23:22 +0100
Message-ID: <1327501407-1927-2-git-send-email-s.nawrocki@samsung.com>
References: <1327501407-1927-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:20544 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751185Ab2AYOXx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jan 2012 09:23:53 -0500
Received: from euspt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LYC001NUYNRFN60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2012 14:23:51 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYC0001EYNQPP@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2012 14:23:50 +0000 (GMT)
In-reply-to: <1327501407-1927-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Increase framebuffer virtual size to enable display panning.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-universal_c210.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index dd75101..0e01f04 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -817,6 +817,8 @@ static struct s3c_fb_pd_win universal_fb_win0 = {
 	},
 	.max_bpp	= 32,
 	.default_bpp	= 16,
+	.virtual_x	= 480,
+	.virtual_y	= 2 * 800,
 };
 
 static struct s3c_fb_platdata universal_lcd_pdata __initdata = {
-- 
1.7.8.3
