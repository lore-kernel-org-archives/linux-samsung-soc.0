From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH v2 0/6] ARM: S5PV210: Add support S5PV210/S5PC110 CPUFREQ
Date: Mon, 20 Sep 2010 15:04:49 +0900
Message-ID: <1284962695-8542-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38705 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751370Ab0ITGYj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Sep 2010 02:24:39 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

This patch adds CPUFREQ for S5PV210/S5PC110.

Changes since v1:

- Added MOUT_DMC0 and SCLK_DMC0 for checking the dmc0 clock in CPUFREQ driver.
- Removed hardcoding of DRAM refresh counter.
- Added to calculate refresh counter function based on DRAM operation freq.

[PATCH v2 1/6] ARM: S5PV210: Add DMC map_desc table for supporting DMC access
[PATCH v2 2/6] ARM: S5PV210: Add struct clk_ops for clk_fout_apll
[PATCH v2 3/6] ARM: S5PV210: Add MOUT_DMC0 and SCLK_DMC0 clocks
[PATCH v2 4/6] ARM: S5PV210: Add Register definition for CMU
[PATCH v2 5/6] ARM: S5PV210: Add support CPUFREQ
[PATCH v2 6/6] ARM: S5PV210: Update Kconfig and Makefile for supporting CPUFREQ driver
