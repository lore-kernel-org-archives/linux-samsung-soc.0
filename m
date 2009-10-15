From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH v2 1/4] S3C: sdhci: Fix incorrect clock option for SDHCI base clock.
Date: Thu, 15 Oct 2009 14:48:18 +0900
Message-ID: <1255585698-31029-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:32874 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753161AbZJOFxR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Oct 2009 01:53:17 -0400
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.63)
	(envelope-from <thomas.ab@samsung.com>)
	id 1MyJGS-0006Pr-Tl
	for linux-samsung-soc@vger.kernel.org; Thu, 15 Oct 2009 07:52:40 +0200
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
	by meercat.kr.gnumonks.org with esmtp (Exim 4.68)
	(envelope-from <thomas.ab@samsung.com>)
	id 1MyJCE-00084k-6F
	for linux-samsung-soc@vger.kernel.org; Thu, 15 Oct 2009 14:48:18 +0900
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

The third base clock option for SDHCI controller in S3C64XX is
mout_epll. This patch removes mmc_bus clock and uses mout_epll
as the third clock option for SDHCI base clock.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-s3c6410/setup-sdhci.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c6410/setup-sdhci.c b/arch/arm/mach-s3c6410/setup-sdhci.c
index 20666f3..aaac505 100644
--- a/arch/arm/mach-s3c6410/setup-sdhci.c
+++ b/arch/arm/mach-s3c6410/setup-sdhci.c
@@ -29,7 +29,7 @@
 char *s3c6410_hsmmc_clksrcs[4] = {
 	[0] = "hsmmc",
 	[1] = "hsmmc",
-	[2] = "mmc_bus",
+	[2] = "mout_epll",
 	/* [3] = "48m", - note not succesfully used yet */
 };
 
-- 
1.5.3.4
