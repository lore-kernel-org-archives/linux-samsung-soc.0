From: Arnaud Patard <arnaud.patard@rtp-net.org>
Subject: [patch 3/3] s3c24xx_mci_set_platdata should be marked __init
Date: Thu, 22 Apr 2010 10:47:45 +0200
Message-ID: <20100422085504.975923735@lechat.rtp-net.org>
References: <20100422084742.111469156@lechat.rtp-net.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lechat.rtp-net.org ([88.191.19.38]:39390 "EHLO
	lechat.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753537Ab0DVI7u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Apr 2010 04:59:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Arnaud Patard <arnaud.patard@rtp-net.org>

Hi,
Content-Disposition: inline; filename=mci_platdata.patch

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---
 arch/arm/plat-s3c24xx/devs.c |    2 	1 +	1 -	0 !
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6/arch/arm/plat-s3c24xx/devs.c
===================================================================
--- linux-2.6.orig/arch/arm/plat-s3c24xx/devs.c	2010-04-21 21:41:04.604110022 +0200
+++ linux-2.6/arch/arm/plat-s3c24xx/devs.c	2010-04-21 22:02:40.564150565 +0200
@@ -371,7 +371,7 @@ struct platform_device s3c_device_sdi = 
 
 EXPORT_SYMBOL(s3c_device_sdi);
 
-void s3c24xx_mci_set_platdata(struct s3c24xx_mci_pdata *pdata)
+void __init s3c24xx_mci_set_platdata(struct s3c24xx_mci_pdata *pdata)
 {
 	struct s3c24xx_mci_pdata *npd;
 

-- 
