From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/8] ARM: S5PV310: Add support for Samsung S5PV310 SoC
Date: Fri, 25 Jun 2010 23:27:09 +0900
Message-ID: <1277476037-8806-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:37474 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756432Ab0FYObr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jun 2010 10:31:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch set adds support for Samsung S5PV310/S5PC210. The S5PV310
integrates a ARM Cortex A9 microprocessor with several other peripherals
to support features such as multimedia, storage, graphics and gaming.
The S5PV310 can be used in products such as Netbooks and Mobile devices.

This patch set consists of the following patches.

[PATCH 1/8] ARM: S5P: Remove fixed uart offset dependent code
[PATCH 2/8] ARM: S5PV310: Add new CPU initialization support
[PATCH 3/8] ARM: S5PV310: Add Clock and PLL support
[PATCH 4/8] ARM: S5PV310: Add IRQ support
[PATCH 5/8] ARM: S5PV310: Add Timer support
[PATCH 6/8] ARM: S5PV310: Add new Kconfig and Makefiles
[PATCH 7/8] ARM: S5PV310: Add Board support file
[PATCH 8/8] ARM: S5PV310: Add serial port support
