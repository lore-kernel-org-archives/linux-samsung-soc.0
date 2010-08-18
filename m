From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 00/14] ARM: S5PV310: Updates clock
Date: Wed, 18 Aug 2010 23:01:10 +0900
Message-ID: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:43450 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752772Ab0HROWZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Aug 2010 10:22:25 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch updates clock for S5PV310/S5PC210.

[PATCH 01/14] ARM: S5PV310: Adds clock addresses for S5PV310
[PATCH 02/14] ARM: S5PV310: Removed unused clock
[PATCH 03/14] ARM: S5PV310: Adds clkset_aclk for removing clkset_aclk_xxx
[PATCH 04/14] ARM: S5PV310: Fix on PLL setting for S5PV310
[PATCH 05/14] ARM: S5PV310: Adds clk_sclk_usbphy0, _usbphy1, and _hdmiphy
[PATCH 06/14] ARM: S5PV310: Should be clk_sclk_apll not clk_mout_apll
[PATCH 07/14] ARM: S5PV310: Adds printing ACLK200, ACLK100, ACLK160 and ACLK133
[PATCH 08/14] ARM: S5PV310: Adds enable and ctrlbit for clk_vpllsrc
[PATCH 09/14] ARM: S5PV310: Adds SDMMC clock for S5PV310
[PATCH 10/14] ARM: S5PV310: Adds uart clocks
[PATCH 11/14] ARM: S5PV310: Bug fix on uclk1 and sclk_pwm
[PATCH 12/14] ARM: S5PV310: Add various clocks
[PATCH 13/14] ARM: S5PV310: Add video clocks
[PATCH 14/14] ARM: S5PV310: Adds various special clocks
