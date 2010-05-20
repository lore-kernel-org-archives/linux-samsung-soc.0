From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/0] Add Watchdog support for Samsung SMDK6410, S5P6440 and S5Pv210
Date: Thu, 20 May 2010 16:21:27 +0900
Message-ID: <1274340092-10706-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:52640 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754234Ab0ETH2G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 May 2010 03:28:06 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patches add Watchdog support for SMDK6410, S5P6440 and S5PV210.

- Add HAVE_S3C2410_WATCHDOG for selecting watchgog driver compile in each machine
- Add S3C_DEV_WDT for watchdog device definitions
- Fix freeing memory part when memory region could not be allocated s3c2410_wdt
- Add machine dependent part for watchdog support

[PATCH 1/5] ARM: SAMSUNG: Move WDT device definitions in plat-samsung
[PATCH 2/5] [WATCHDOG] s3c2410_wdt - Avoid freeing memory, if memory region could not be allocated
[PATCH 3/5] ARM: SMDK6410: Add Watchdog support for SMDK6410
[PATCH 4/5] ARM: S5P6440: Add Watchdog support for S5P6440
[PATCH 5/5] ARM: S5PV210: Add Watchdog support for S5PV210
