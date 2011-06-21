From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH V2 0/3] ARM: Add SPDIF support for EXYNOS4
Date: Tue, 21 Jun 2011 16:54:20 +0530
Message-ID: <1308655463-8787-1-git-send-email-ch.naveen@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11841 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754745Ab1FUL2w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 07:28:52 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN500B6X17VCHV0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Jun 2011 20:28:50 +0900 (KST)
Received: from Hawshines.sisodomain.com ([107.108.83.161])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LN500MT817XCL@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Jun 2011 20:28:50 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, jassisinghbrar@gmail.com, sbkim73@samsung.com, sw.youn@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

 o To Kukjin Kim, Sangbeom Kim, Jassi Brar and Seungwhan Youn

[PATCH v2 1/3] ARM: Samsung: Move duplicate code
 o This is a prerequisite for 2/3 and 3/3 patches thus mentioned as "v2".
[PATCH v2 2/3] ARM: EXYNOS4: Add sclk_spdif clocks.
 o v1 patch is https://patchwork.kernel.org/patch/867882/
[PATCH v2 3/3] ARM: EXYNOS4: Add EPLL clock operations
 o v1 patch is https://patchwork.kernel.org/patch/867872/

Best Regards,
Naveen Krishna Chatradhi
