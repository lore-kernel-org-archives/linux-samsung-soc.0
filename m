From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] Platform fixes for s5p-fimc
Date: Mon, 06 Sep 2010 05:50:40 +0200
Message-ID: <1283745044-15514-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:18023 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755240Ab0IFDut (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 5 Sep 2010 23:50:49 -0400
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L8B00AW440NID@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Sep 2010 04:50:47 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L8B001GQ40MA4@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Sep 2010 04:50:47 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Hello,

This patch series fixes a bunch of bugs in s5p-fimc platform support.
Mainly it adds missing clocks, dma coherent masks and clock setup code
required on Aquila and Goni targets.

This is a pure bugfix series to get fimc driver working. I hope to get
it merged for 2.6.36-rc4.

The complete list of patches:

[PATCH 1/4] ARM: S5PC110: add fimc clocks.
[PATCH 2/4] ARM: Samsung: s5p-fimc: fix dma coherent mask
[PATCH 3/4] ARM: S5PC110: add common FIMC setup code
[PATCH 4/4] ARM: S5PC110: use common FIMC clock setup code

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
