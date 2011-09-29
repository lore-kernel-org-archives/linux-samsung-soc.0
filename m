From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/2] ARM: EXYNOS4: Add support for MCT PPI
Date: Thu, 29 Sep 2011 16:24:22 +0900
Message-ID: <008e01cc7e78$cf8e8160$6eab8420$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25116 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753218Ab1I2HYY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Sep 2011 03:24:24 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS9007VYWKAUKB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Sep 2011 16:24:22 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LS900B9DWKMUK00@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 29 Sep 2011 16:24:22 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Marc Zyngier' <marc.zyngier@arm.com>, 'Russell King' <rmk+kernel@arm.linux.org.uk>, chaos.youn@samsung.com

This patch is required to support upcoming Samsung SoCs.

Current MCT can support only SPI for local timers but upcoming EXYNOS SoCs
doesn't have SPI for local timers.

NOTE:
This patches will not work with Marc Zyngier's "ARM: gic: consolidate
PPI handling". It means if his patch is applied, this should be dropped
and re-worked.

[PATCH 1/2] ARM: EXYNOS4: Add support PPI in external GIC
[PATCH 2/2] ARM: EXYNOS4: Add support MCT PPI for EXYNOS4212

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
