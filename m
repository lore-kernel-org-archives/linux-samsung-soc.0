From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH V2 0/3] ARM: S5PV310: Add support S5PV310/S5PC210 CPUFREQ
Date: Fri, 17 Dec 2010 17:14:32 +0900
Message-ID: <1292573675-15643-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:43192 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751139Ab0LQIb3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Dec 2010 03:31:29 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

This patch adds support CPUFREQ driver for S5PV310 and S5PC210.

Changes since V1:
- All level of ARMCLK use APLL only.
- During PLL change(lock time), MPLL is used for temporary CPU source clock

[PATCH V2 1/3] ARM: S5PV310: Update CMU registers for CUPFREQ
[PATCH V2 2/3] ARM: S5PV310: Add support CPUFREQ
[PATCH V2 3/3] ARM: S5PV310: Update Kconfig and Makefile for supporting CPUFREQ
