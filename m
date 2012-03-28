From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/2] Fixes related to rtc-s3c
Date: Wed, 28 Mar 2012 16:20:35 +0530
Message-ID: <1332931837-3819-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:34010 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758114Ab2C1K61 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Mar 2012 06:58:27 -0400
Received: by yhmm54 with SMTP id m54so564210yhm.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Mar 2012 03:58:26 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, kgene.kim@samsung.com, patches@linaro.org

The patches are based on Kukjin's for-next branch and they fix a couple
of compile-time errors and warnings.

The patches have been only build-tested.

Tushar Behera (2):
  rtc: rtc-s3c: Fix compilation error
  rtc: rtc-s3c: Add placeholder for driver private data

 drivers/rtc/rtc-s3c.c |   31 ++++++++++++++++++++++---------
 1 files changed, 22 insertions(+), 9 deletions(-)

-- 
1.7.4.1
