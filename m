From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] rtc: rtc-s3c: fix compile error due to missing s3c_rtc_setpie
Date: Thu, 24 Mar 2011 22:09:33 +0200
Message-ID: <1300997373-28910-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:55007 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932069Ab1CXUL7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Mar 2011 16:11:59 -0400
Received: by bwz15 with SMTP id 15so391475bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Mar 2011 13:11:58 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, ben-linux@fluff.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

s3c_rtc_setpie was removed, and it resulted in compiler error:

drivers/rtc/rtc-s3c.c: In function =E2=80=98s3c_rtc_release=E2=80=99:
drivers/rtc/rtc-s3c.c:339:2: error: implicit declaration of function
=E2=80=98s3c_rtc_setpie=E2=80=99

=46ix it by removing s3c_rtc_release calls.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/rtc/rtc-s3c.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 7149649..b3466c4 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -336,7 +336,6 @@ static void s3c_rtc_release(struct device *dev)
=20
 	/* do not clear AIE here, it may be needed for wake */
=20
-	s3c_rtc_setpie(dev, 0);
 	free_irq(s3c_rtc_alarmno, rtc_dev);
 	free_irq(s3c_rtc_tickno, rtc_dev);
 }
@@ -408,7 +407,6 @@ static int __devexit s3c_rtc_remove(struct platform=
_device *dev)
 	platform_set_drvdata(dev, NULL);
 	rtc_device_unregister(rtc);
=20
-	s3c_rtc_setpie(&dev->dev, 0);
 	s3c_rtc_setaie(&dev->dev, 0);
=20
 	clk_disable(rtc_clk);
--=20
1.7.4.1
