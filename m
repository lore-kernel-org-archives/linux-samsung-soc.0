From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0117/1529] Fix typo
Date: Sat, 21 May 2016 13:51:29 +0200
Message-ID: <20160521115129.5498-1-andrea.gelmini@gelma.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:32868 "EHLO
	mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758AbcEULvg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 May 2016 07:51:36 -0400
Received: by mail-lf0-f66.google.com with SMTP id z203so630273lfd.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 May 2016 04:51:36 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, kgene@kernel.org, k.kozlowski@samsung.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/arm/mach-s3c24xx/iotiming-s3c2410.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/iotiming-s3c2410.c b/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
index 4cd13ab..65e5f9c 100644
--- a/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
+++ b/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
@@ -423,7 +423,7 @@ void s3c2410_iotiming_set(struct s3c_cpufreq_config *cfg,
  * @timings: The IO timing information to fill out.
  *
  * Calculate the @timings timing information from the current frequency
- * information in @cfg, and the new frequency configur
+ * information in @cfg, and the new frequency configuration
  * through all the IO banks, reading the state and then updating @iot
  * as necessary.
  *
-- 
2.8.2.534.g1f66975
