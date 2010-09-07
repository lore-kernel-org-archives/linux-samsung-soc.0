From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/5] rtc: rtc-s3c: Fix RTC bugs for RTC-S3C
Date: Tue,  7 Sep 2010 14:29:36 +0900
Message-ID: <1283837381-9575-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45992 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752844Ab0IGFqq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 01:46:46 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it

This patch fixes on bugs of rtc-s3c.
However, each patch is independent.

This includes the following patches.

[PATCH 1/5] rtc: rtc-s3c: Fix access unit from byte to word on RTCCON
[PATCH 2/5] rtc: rtc-s3c: Fix setting missing field of getalarm
[PATCH 3/5] rtc: rtc-s3c: Fix on support RTC Alarm
[PATCH 4/5] rtc: rtc-s3c: Fix on RTC initialization method
[PATCH 5/5] rtc: rtc-s3c: Fix debug message format on RTC
