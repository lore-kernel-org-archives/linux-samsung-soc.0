From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Subject: [PATCH] watchdog: s3c2410_wdt: fix printk format compilation errors
Date: Thu, 15 Mar 2012 00:21:55 +0100
Message-ID: <1331767315-8290-1-git-send-email-GNUtoo@no-log.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp201.alice.it ([82.57.200.97]:58407 "EHLO smtp201.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758999Ab2CNXXB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Mar 2012 19:23:01 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Without that fix we have:
  drivers/watchdog/s3c2410_wdt.c: In function =E2=80=98watchdog_init=E2=
=80=99:
  drivers/watchdog/s3c2410_wdt.c:542:0: error: unterminated argument li=
st invoking macro "pr_info"
  [...]

This problem has been introduced by the commit 1ab73c46629484053953e678=
328b0a115a39ed3b
  "watchdog: Use pr_<fmt> and pr_<level>".

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 drivers/watchdog/s3c2410_wdt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_=
wdt.c
index 96b598c..cd6d688 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -521,7 +521,7 @@ static struct platform_driver s3c2410wdt_driver =3D=
 {
=20
 static int __init watchdog_init(void)
 {
-	pr_info("S3C2410 Watchdog Timer, (c) 2004 Simtec Electronics\n";
+	pr_info("S3C2410 Watchdog Timer, (c) 2004 Simtec Electronics\n");
=20
 	return platform_driver_register(&s3c2410wdt_driver);
 }
--=20
1.7.4.1
