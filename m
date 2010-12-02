From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/6] ARM: S5P: Add SROMC support and DM9000 Ethernet controller support on SMDKV210
Date: Thu,  2 Dec 2010 18:29:15 +0900
Message-ID: <1291282161-1992-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38931 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755428Ab0LBJnK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 04:43:10 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch moves regarding SROMC support code to plat-s5p for common usage of S5P SoCs.
And adds support DM9000 Ethernet Controller for SMDKV210 board.

[PATCH 1/6] ARM: S5P: Move the SROM register definitions to plat-s5p
[PATCH 2/6] ARM: S5P: Add SROM control register shift macros for other banks.
[PATCH 3/6] ARM: S5P: Add SROM bank 4 and 5 register offsets
[PATCH 4/6] ARM: S5P: Move SROM controller IO mapping to plat-s5p for S5P SoCs
[PATCH 5/6] ARM: S5PV210: Add SROM controller clock
[PATCH 6/6] ARM: S5PV210: Add DM9000 support on SMDKV210
