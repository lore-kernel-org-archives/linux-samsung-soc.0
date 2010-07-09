From: Pawel Osciak <p.osciak@samsung.com>
Subject: [PATCH 14/19] s3c-fb: window 3 of 64xx+ does not have an osd_d register
Date: Fri, 09 Jul 2010 10:50:02 +0200
Message-ID: <1278665407-18002-15-git-send-email-p.osciak@samsung.com>
References: <1278665407-18002-1-git-send-email-p.osciak@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:39640 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754538Ab0GIIvs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Jul 2010 04:51:48 -0400
In-reply-to: <1278665407-18002-1-git-send-email-p.osciak@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, akpm@linux-foundation.org

Signed-off-by: Pawel Osciak <p.osciak@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/video/s3c-fb.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
index 2e82adf..6cbddc4 100644
--- a/drivers/video/s3c-fb.c
+++ b/drivers/video/s3c-fb.c
@@ -1434,7 +1434,6 @@ static struct s3c_fb_win_variant s3c_fb_data_64xx_wins[] __devinitdata = {
 	},
 	[3] = {
 		.has_osd_c	= 1,
-		.has_osd_d	= 1,
 		.palette_sz	= 16,
 		.palette_16bpp	= 1,
 		.valid_bpp	= (VALID_BPP124  | VALID_BPP(16) |
-- 
1.7.1.569.g6f426
