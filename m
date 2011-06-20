From: Rajeshwari Shinde <rajeshwari.s@samsung.com>
Subject: [PATCH 0/3] ARM: Add SDMMC support for S5P64X0
Date: Mon, 20 Jun 2011 17:27:26 +0530
Message-ID: <1308571049-4412-1-git-send-email-rajeshwari.s@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57802 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751139Ab1FTLwM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 07:52:12 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN3006M17MO5020@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Jun 2011 20:52:10 +0900 (KST)
Received: from rajeshwari-linux.sisodomain.com ([107.108.215.115])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LN300LZR7MS0B@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Jun 2011 20:52:10 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, sbkim73@samsung.com
Cc: "rajeshwari.s" <rajeshwari.s@samsung.com>

From: rajeshwari.s <rajeshwari.s@samsung.com>

S5P64X0 supports 3 Channel MMC/SDHC/SDIO.

This patchset adds the setup files, gpio configs and enables the HSMMC device 
for S5P64X0.

 o To Kukjin Kim and Sangbeom Kim 
[PATCH 1/3] ARM: S5P64X0: Add HSMMC setup for host Controller
[PATCH 2/3] ARM: S5P64X0: Initialize default SDHCI devices and platform data
[PATCH 3/3] ARM: S5P64X0: Enable SDHCI support
---
