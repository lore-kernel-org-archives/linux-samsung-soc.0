From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/2] Updates Samsung RTC driver for clock enabling support
Date: Wed, 21 Jul 2010 17:54:59 +0900
Message-ID: <1279702501-6803-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53849 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752184Ab0GUJGM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 05:06:12 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it

This patch updates RTC driver for clock enabling support.

[PATCH 1/2] ARM: S3C64XX: Move RTC clock from init_clocks to init_clocks_disable
[PATCH 2/2] rtc: rtc-s3c: Updates RTC driver for clock enabling support
