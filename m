From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH RE-SEND 0/6] rtc: rtc-s3c: Fix rtc-s3c
Date: Fri,  8 Oct 2010 08:41:13 +0900
Message-ID: <1286494879-2932-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:46185 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751842Ab0JGXt5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 19:49:57 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, akpm@linux-foundation.org

This patches already have been submitted regarding mailing list.
Now...I'm re-sending this for handling by Andrew Morton.

Thanks.

[PATCH 1/6] rtc: rtc-s3c: Fix access unit from byte to word on RTCCON
[PATCH 2/6] rtc: rtc-s3c: Fix setting missing field of getalarm
[PATCH 3/6] rtc: rtc-s3c: Fix on support RTC Alarm
[PATCH 4/6] rtc: rtc-s3c: Fix debug message format on RTC
[PATCH 5/6] rtc: rtc-s3c: Fix on RTC initialization method
[PATCH 6/6] rtc: rtc-s3c: Add rtc_valid_tm in s3c_rtc_gettime()
