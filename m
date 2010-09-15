From: Jaecheol Lee <jc.lee@samsung.com>
Subject: [PATCH 0/5] ARM: S5PV210: Add support CPUFREQ for S5PV210/S5PC110
Date: Wed, 15 Sep 2010 16:52:37 +0900
Message-ID: <1284537162-3129-1-git-send-email-jc.lee@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:48443 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752040Ab0IOIId (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Sep 2010 04:08:33 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com

This patch adds CPUFREQ for S5PV210/S5PC110.

[PATCH 1/5] ARM: S5PV210: Add support DMC map_desc table
[PATCH 2/5] ARM: S5PV210: Add struct clk_ops for clk_fout_apll
[PATCH 3/5] ARM: S5PV210: Add Register definition for CMU
[PATCH 4/5] ARM: S5PV210: Add support CPUFREQ
[PATCH 5/5] ARM: S5PV210: Update Kconfig and Makefile for supporting CPUFREQ driver
