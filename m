From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/3] [WATCHDOG] s3c2410_wdt - Support for Samsung SoCs and Bug fix on
Date: Thu, 20 May 2010 19:28:28 +0900
Message-ID: <1274351311-6879-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36979 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755387Ab0EWWtU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 23 May 2010 18:49:20 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Wim Van Sebroeck <wim@iguana.be>

This patches add Watchdog support for Samsung SoCs.

- Add HAVE_S3C2410_WATCHDOG to control inclusion of watchdog driver
- Fix on handling of the request_mem_region fail

[PATCH v2 1/3] [WATCHDOG] s3c2410_wdt - Add extra option to include watchdog for Samsung SoCs
[PATCH v2 2/3] ARM: SAMSUNG: Move WDT device definitions in plat-samsung
[PATCH v2 3/3] [WATCHDOG] s3c2410_wdt - Fix on handling of the request_mem_region fail
