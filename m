From: thomas.ab@samsung.com
Subject: [PATCH 4/7] S3C64XX: Add clock source definition for IDE controller.
Date: Thu,  8 Oct 2009 15:45:14 +0900
Message-ID: <1254984314-28094-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:46318 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753955AbZJHGvV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Oct 2009 02:51:21 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Thomas Abraham <thomas.ab@samsung.com>, Abhilash Kesavan <a.kesavan@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

This patch adds clock source definition for S3C IDE controller.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/plat-s3c64xx/clock.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s3c64xx/clock.c b/arch/arm/plat-s3c64xx/clock.c
index 7a36e89..9de38bf 100644
--- a/arch/arm/plat-s3c64xx/clock.c
+++ b/arch/arm/plat-s3c64xx/clock.c
@@ -256,6 +256,12 @@ static struct clk init_clocks[] = {
 		.id		= -1,
 		.parent		= &clk_p,
 		.ctrlbit	= S3C_CLKCON_PCLK_AC97,
+	}, {
+		.name		= "cfcon",
+		.id		= -1,
+		.parent		= &clk_h,
+		.enable		= s3c64xx_hclk_ctrl,
+		.ctrlbit	= S3C_CLKCON_HCLK_IHOST
 	}
 };
 
-- 
1.5.3.4

