From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 3/3] ARM: S5PV210: Change framebuffer window 0 size on GONI
Date: Fri, 07 Jan 2011 17:57:48 +0100
Message-ID: <1294419468-13700-4-git-send-email-s.nawrocki@samsung.com>
References: <1294419468-13700-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55974 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754555Ab1AGQ5z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Jan 2011 11:57:55 -0500
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LEN002BMWGFRN@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Jan 2011 16:57:52 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LEN00LBPWGFIS@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Jan 2011 16:57:51 +0000 (GMT)
In-reply-to: <1294419468-13700-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Increase virtual size of the frambuffer window 0
for the display panning support.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/mach-goni.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 2051cee..ed06f20 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -108,6 +108,8 @@ static struct s3c_fb_pd_win goni_fb_win0 = {
 	},
 	.max_bpp	= 32,
 	.default_bpp	= 16,
+	.virtual_x	= 480,
+	.virtual_y	= 2 * 800,
 };
 
 static struct s3c_fb_platdata goni_lcd_pdata __initdata = {
-- 
1.7.3.5
