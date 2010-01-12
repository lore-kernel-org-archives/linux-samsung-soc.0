From: Ben Dooks <ben@trinity.fluff.org>
Subject: [PATCH] tmp - fix arch/arm/plat-s5pc1xx/clock.c
Date: Tue, 12 Jan 2010 04:20:11 +0000
Message-ID: <1263270017-25155-3-git-send-email-ben@trinity.fluff.org>
References: <1263270017-25155-1-git-send-email-ben@trinity.fluff.org>
 <1263270017-25155-2-git-send-email-ben@trinity.fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:40854 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753604Ab0ALEUW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 23:20:22 -0500
Received: from ben by trinity.fluff.org with local (Exim 4.69)
	(envelope-from <ben@trinity.fluff.org>)
	id 1NUYEr-0006Zy-G0
	for linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 04:20:17 +0000
In-Reply-To: <1263270017-25155-2-git-send-email-ben@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

From: Ben Dooks <ben-linux@fluff.org>

---
 arch/arm/plat-s5pc1xx/clock.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-s5pc1xx/clock.c b/arch/arm/plat-s5pc1xx/clock.c
index cc21a8b..0aff16d 100644
--- a/arch/arm/plat-s5pc1xx/clock.c
+++ b/arch/arm/plat-s5pc1xx/clock.c
@@ -705,7 +705,7 @@ void __init s5pc1xx_register_clocks(void)
 	s3c24xx_register_clocks(clks, ARRAY_SIZE(clks));
 
 	s3c_register_clocks(s5pc100_init_clocks,
-			    ARRAY_SIZE(s5pc100_init_clocks);
+			    ARRAY_SIZE(s5pc100_init_clocks));
 
 	clkp = s5pc100_init_clocks_disable;
 	size = ARRAY_SIZE(s5pc100_init_clocks_disable);
-- 
1.6.0.4
