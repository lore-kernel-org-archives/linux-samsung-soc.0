From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: [PATCH] s3c2410fb: silence warning
Date: Tue, 09 Mar 2010 00:33:06 +0100
Message-ID: <876356o0ct.fsf@lechat.rtp-net.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lechat.rtp-net.org ([88.191.19.38]:38477 "EHLO
	lechat.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755682Ab0CHXbT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Mar 2010 18:31:19 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-fbdev@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org

--=-=-=



When building s3c2410fb with CPU_FREQ set, one gets :

drivers/video/s3c2410fb.c: In function 's3c2410fb_cpufreq_transition':
drivers/video/s3c2410fb.c:769: warning: unused variable 'freqs'

Remove this useless declaration to silence the warning.

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---

--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline; filename=fix_fb_warning.patch

---
 drivers/video/s3c2410fb.c |    1 	0 +	1 -	0 !
 1 file changed, 1 deletion(-)

Index: linux-2.6/drivers/video/s3c2410fb.c
===================================================================
--- linux-2.6.orig/drivers/video/s3c2410fb.c	2010-03-09 00:22:08.317640239 +0100
+++ linux-2.6/drivers/video/s3c2410fb.c	2010-03-09 00:22:33.117640575 +0100
@@ -766,7 +766,6 @@ static irqreturn_t s3c2410fb_irq(int irq
 static int s3c2410fb_cpufreq_transition(struct notifier_block *nb,
 					unsigned long val, void *data)
 {
-	struct cpufreq_freqs *freqs = data;
 	struct s3c2410fb_info *info;
 	struct fb_info *fbinfo;
 	long delta_f;

--=-=-=--
