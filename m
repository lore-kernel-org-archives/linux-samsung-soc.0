From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 7/9] s3c-fb: window 3 of 64xx+ does not have an osd_d register
Date: Wed, 16 Jun 2010 11:34:50 +0200
Message-ID: <1276680892-14760-8-git-send-email-m.szyprowski@samsung.com>
References: <1275296935-2693-1-git-send-email-p.osciak@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:13518 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755031Ab0FPJfT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jun 2010 05:35:19 -0400
In-reply-to: <1275296935-2693-1-git-send-email-p.osciak@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, p.osciak@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

From: Pawel Osciak <p.osciak@samsung.com>

Fix incorrectly defined OSD_D register for S3C64xx SoCs.

Signed-off-by: Pawel Osciak <p.osciak@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/video/s3c-fb.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
index 6131ebb..0a93fca 100644
--- a/drivers/video/s3c-fb.c
+++ b/drivers/video/s3c-fb.c
@@ -1437,7 +1437,6 @@ static struct s3c_fb_win_variant s3c_fb_data_64xx_wins[] __devinitdata = {
 	},
 	[3] = {
 		.has_osd_c	= 1,
-		.has_osd_d	= 1,
 		.palette_sz	= 16,
 		.palette_16bpp	= 1,
 		.valid_bpp	= (VALID_BPP124  | VALID_BPP(16) |
-- 
1.7.1.240.g225c
