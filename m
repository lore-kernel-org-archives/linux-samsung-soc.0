From: Pawel Osciak <p.osciak@samsung.com>
Subject: [PATCH 03/19] s3c-fb: fixed distortedness situation for the mode more
 then 24bpp.
Date: Fri, 09 Jul 2010 10:49:51 +0200
Message-ID: <1278665407-18002-4-git-send-email-p.osciak@samsung.com>
References: <1278665407-18002-1-git-send-email-p.osciak@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:64783 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752690Ab0GIIvM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Jul 2010 04:51:12 -0400
In-reply-to: <1278665407-18002-1-git-send-email-p.osciak@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, akpm@linux-foundation.org, InKi Dae <inki.dae@samsung.com>

From: InKi Dae <inki.dae@samsung.com>

it has been working fine at 16bpp but in case of pixel format more then
24bpp
it would occur distortedness situation on that mode. so this patch set
the word swap control bit of WINCONx to 1 as default value. but it
should be set to 0
in case that each ENLOCAL bit of WINCON0 ~ 2 registers is enabled.
this issue would be solved with local path feature soon.

Signed-off-by: InKi Dae <inki.dae@samsung.com>
Reviewed-by: KyungMin Park <kyungmin.park.samsung.com>
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Pawel Osciak <p.osciak@samsung.com>
---
 arch/arm/plat-samsung/include/plat/regs-fb.h |    1 +
 drivers/video/s3c-fb.c                       |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/regs-fb.h b/arch/arm/plat-samsung/include/plat/regs-fb.h
index 0ef806e..41c68ac 100644
--- a/arch/arm/plat-samsung/include/plat/regs-fb.h
+++ b/arch/arm/plat-samsung/include/plat/regs-fb.h
@@ -173,6 +173,7 @@
 #define WINCONx_BITSWP				(1 << 18)
 #define WINCONx_BYTSWP				(1 << 17)
 #define WINCONx_HAWSWP				(1 << 16)
+#define WINCONx_WSWP				(1 << 15)
 #define WINCONx_BURSTLEN_MASK			(0x3 << 9)
 #define WINCONx_BURSTLEN_SHIFT			(9)
 #define WINCONx_BURSTLEN_16WORD			(0x0 << 9)
diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
index c4639c4..9c46f95 100644
--- a/drivers/video/s3c-fb.c
+++ b/drivers/video/s3c-fb.c
@@ -424,6 +424,7 @@ static int s3c_fb_set_par(struct fb_info *info)
 		else
 			data |= WINCON0_BPPMODE_24BPP_888;
 
+		data |= WINCONx_WSWP;
 		data |= WINCONx_BURSTLEN_16WORD;
 		break;
 	}
-- 
1.7.1.569.g6f426
