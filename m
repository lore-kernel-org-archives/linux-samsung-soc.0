From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] SMDKC100 fixes
Date: Tue, 18 May 2010 11:30:47 +0200
Message-ID: <1274175049-21847-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33092 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753391Ab0ERJ5i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 May 2010 05:57:38 -0400
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2M00JUC100HM@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 10:57:36 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L2M005PP0ZY85@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 10:57:36 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

Hello,

This patch series introduces 2 fixes to SMDKC100 board setup code. On
request I've separated them from the s5pc1xx cleanup patch series.

This patch series includes:

[PATCH 1/2] ARM: SMDKC100: fix frame buffer definitions
[PATCH 2/2] ARM: SMDKC100: remove magic values from uart setup structures

Best regards,
Marek Szyprowski
