From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 0/2] Fixes for s3c RTC driver
Date: Thu, 27 May 2010 23:28:42 +0200
Message-ID: <4BFEE40A.6000403@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f216.google.com ([209.85.219.216]:37266 "EHLO
	mail-ew0-f216.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755439Ab0E0V2q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 May 2010 17:28:46 -0400
Received: by ewy8 with SMTP id 8so137814ewy.28
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 May 2010 14:28:43 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, a.zummo@towertech.it, p_gortmaker@yahoo.com, Jiri.Pinkava@vscht.cz, akpm@linux-foundation.org

The first patch fixes a segfault when dereferencing a garbage pointer while
the second one ensures that the correct max_user_freq gets set.

These should probably go in mainline as soon as possible.

Maurus Cuelenaere (2):
  RTC: s3c: Initialize driver data before using it
  RTC: s3c: Initialize s3c_rtc_cpu_type before using it

 drivers/rtc/rtc-s3c.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)
