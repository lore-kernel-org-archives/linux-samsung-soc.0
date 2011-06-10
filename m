From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 0/5] ARM: Add SPDIF support for EXYNOS4
Date: Fri, 10 Jun 2011 12:04:22 +0530
Message-ID: <1307687667-9127-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:15797 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751803Ab1FJGiE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 02:38:04 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMK00EHSAF9XQI0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 15:38:02 +0900 (KST)
Received: from Hawshines.sisodomain.com (unknown [107.108.83.161])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LMK005R8AF8Q510@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 15:38:02 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com, lrg@ti.com, sbkim73@samsung.com, sw.youn@samsung.com, linux-samsung-soc@vger.kernel.org, linux-ar

EXYNOS4 supports S/PDIF transmitter simillar to the one in S5PV210.

This patchset adds the clock support, fixes improper gpio configs
and enables the device for SMDKV310.

 o To Kukjin Kim, Sangbeom Kim and Seungwhan Youn,
[PATCH 1/5] ARM: EXYNOS4: Add EPLL clock operations
[PATCH 2/5] ARM: EXYNOS4: Add sclk_spdif clocks
[PATCH 3/5] ARM: EXYNOS4: fix improper gpio configuration
[PATCH 4/5] ARM: EXYNOS4: Add SPDIF for SMDKV310

 o To Seungwhan Youn, Jassi Brar, Mark Brown and Liam Girdwood,
[PATCH 5/5] ASoC: SMDKV310: Enable SPDIF device

Best Regards,
Naveen Krishna Chatradhi
