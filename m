From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/4] ARM: S5PV310: Add support S5PV310/S5PC210 CPUFREQ
Date: Sat, 18 Sep 2010 11:45:12 +0900
Message-ID: <1284777916-23257-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:42677 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753948Ab0IRDEJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Sep 2010 23:04:09 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch adds support CPUFREQ driver for S5PV310 and S5PC210.

NOTE: This patch dependes on following.
- ARM: S5PV310: Fix clkset_moutcore_list
- ARM: S5PV210: Add DMC map_desc table for supporting DMC access

[PATCH 1/4] ARM: S5PV310: Update CMU registers for CPUFREQ
[PATCH 2/4] ARM: S5PV310: Add DMC registers and map_desc
[PATCH 3/4] ARM: S5PV310: Add support CPUFREQ
[PATCH 4/4] ARM: S5PV310: Update Kconfig and Makefile for supporting CPUFREQ
