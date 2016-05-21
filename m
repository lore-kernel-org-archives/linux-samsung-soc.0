From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0123/1529] Fix typo
Date: Sat, 21 May 2016 13:52:20 +0200
Message-ID: <20160521115220.5810-1-andrea.gelmini@gelma.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35129 "EHLO
	mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758AbcEULw1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 May 2016 07:52:27 -0400
Received: by mail-lf0-f65.google.com with SMTP id p10so3960537lfb.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 May 2016 04:52:27 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, kgene@kernel.org, k.kozlowski@samsung.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/arm/plat-samsung/include/plat/cpu-freq-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/plat-samsung/include/plat/cpu-freq-core.h b/arch/arm/plat-samsung/include/plat/cpu-freq-core.h
index 317c523..37cf20e 100644
--- a/arch/arm/plat-samsung/include/plat/cpu-freq-core.h
+++ b/arch/arm/plat-samsung/include/plat/cpu-freq-core.h
@@ -39,7 +39,7 @@ struct s3c2410_iobank_timing {
 	unsigned int	tacs;
 	unsigned int	tcos;
 	unsigned int	tacc;
-	unsigned int	tcoh;		/* nCS hold afrer nOE/nWE */
+	unsigned int	tcoh;		/* nCS hold after nOE/nWE */
 	unsigned int	tcah;		/* Address hold after nCS */
 	unsigned char	nwait_en;	/* nWait enabled for bank. */
 };
-- 
2.8.2.534.g1f66975
