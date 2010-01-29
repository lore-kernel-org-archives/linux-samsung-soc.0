From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: S3C24XX: Move audio-simtec.h to plat-s3c24xx
Date: Fri, 29 Jan 2010 09:02:18 +0000
Message-ID: <1264755741-16184-8-git-send-email-ben-linux@fluff.org>
References: <1264755741-16184-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:33738 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756680Ab0A2JCY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Jan 2010 04:02:24 -0500
In-Reply-To: <1264755741-16184-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Continue the clearout of plat-s3c by moving audio-simtec.h to plat-s3c24xx
as there are no current implementations outside of this platform.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 .../include/plat/audio-simtec.h                    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename arch/arm/{plat-s3c => plat-s3c24xx}/include/plat/audio-simtec.h (95%)

diff --git a/arch/arm/plat-s3c/include/plat/audio-simtec.h b/arch/arm/plat-s3c24xx/include/plat/audio-simtec.h
similarity index 95%
rename from arch/arm/plat-s3c/include/plat/audio-simtec.h
rename to arch/arm/plat-s3c24xx/include/plat/audio-simtec.h
index 53a9365..de5e88f 100644
--- a/arch/arm/plat-s3c/include/plat/audio-simtec.h
+++ b/arch/arm/plat-s3c24xx/include/plat/audio-simtec.h
@@ -1,4 +1,4 @@
-/* arch/arm/plat-s3c/include/plat/audio-simtec.h
+/* arch/arm/plat-s3c24xx/include/plat/audio-simtec.h
  *
  * Copyright 2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
-- 
1.6.0.4
