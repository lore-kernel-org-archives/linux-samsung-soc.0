From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/3] Updates RTC driver for Samsung S3C64XX and newer SoCs
Date: Wed, 21 Jul 2010 17:57:43 +0900
Message-ID: <1279702666-13021-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53844 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751862Ab0GUJGM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 05:06:12 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it

This patch updates RTC driver for Samsung S3C64XX and newer SoCs.

NOTE: depends on previous RTC patch for clock enabling.

[PATCH 1/3] ARM: SAMSUNG: Updates RTC register for support Alarm IRQ and Time Tick.
[PATCH 2/3] rtc: rtc-s3c: Updates driver for S3C64XX and newer SoCs
[PATCH 3/3] rtc: rtc-s3c: Add BCD register initialization codes
