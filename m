From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: [PATCH] mach-s3c2410/cpu-freq.c: fix build
Date: Tue, 09 Mar 2010 00:23:27 +0100
Message-ID: <87aauio0sw.fsf@lechat.rtp-net.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lechat.rtp-net.org ([88.191.19.38]:38473 "EHLO
	lechat.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751070Ab0CHXbJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Mar 2010 18:31:09 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org

--=-=-=


When CPU_FREQ_S3C24XX_DEBUGFS is set and S3C2410_IOTIMING, I'm getting :

arch/arm/mach-s3c2410/built-in.o:(.data+0x218): undefined reference to `s3c2410_iotiming_debugfs'

This patch add missing #ifdef

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---

--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline;
 filename=s3c2410_iotiming_debugfs_buildfix.patch

 arch/arm/mach-s3c2410/cpu-freq.c |    2 	2 +	0 -	0 !
 1 file changed, 2 insertions(+)

Index: linux-2.6/arch/arm/mach-s3c2410/cpu-freq.c
===================================================================
--- linux-2.6.orig/arch/arm/mach-s3c2410/cpu-freq.c	2010-03-09 00:11:48.409640117 +0100
+++ linux-2.6/arch/arm/mach-s3c2410/cpu-freq.c	2010-03-09 00:15:06.641680942 +0100
@@ -112,7 +112,9 @@ static struct s3c_cpufreq_info s3c2410_c
 	.set_divs	= s3c2410_cpufreq_setdivs,
 	.calc_divs	= s3c2410_cpufreq_calcdivs,
 
+#ifdef CONFIG_S3C2410_IOTIMING
 	.debug_io_show	= s3c_cpufreq_debugfs_call(s3c2410_iotiming_debugfs),
+#endif
 };
 
 static int s3c2410_cpufreq_add(struct sys_device *sysdev)

--=-=-=--
