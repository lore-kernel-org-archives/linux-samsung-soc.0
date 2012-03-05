From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [RESEND 0/4] onenand: OneNAND board dependent probe and fixes for
 Samsung targets
Date: Mon, 05 Mar 2012 17:41:27 +0100
Message-ID: <1330965691-10301-1-git-send-email-l.majewski@samsung.com>
References: <1320914477-27885-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:22343 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752933Ab2CEQlh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Mar 2012 11:41:37 -0500
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M0F00K5S7PBZ210@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Mar 2012 16:41:35 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0F009LM7PBKY@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Mar 2012 16:41:35 +0000 (GMT)
In-reply-to: <1320914477-27885-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Scott Wood <scottwood@freescale.com>, Minkyu Kang <mk7.kang@samsung.com>

This patch sets add board dependent onenand probes.

Several fixes for GONI and Exynos4210 (C210_universal) targets have been added.

Tested at:
	Samsung S5PC110 GONI
        Samsung Exynos4210 (S5PC210 Universal)

Lukasz Majewski (4):
  onenand:samsung Target dependent OneNAND chip probe function
  onenand:samsung OneNAND chip probe functions added for GONI and
    Exynos4210
  onenand: Replace ONENAND_IS_MLC() test with ONENAND_HAS_4KB()
  onenand: samsung: Enable support OneNAND support at Samsung's
    Exynos4210

 board/samsung/goni/onenand.c           |    1 +
 board/samsung/universal_c210/onenand.c |    2 +
 drivers/mtd/onenand/onenand_base.c     |   88 +++++++++++++++++++++++--------
 drivers/mtd/onenand/samsung.c          |   10 ++++
 include/configs/s5pc210_universal.h    |    1 +
 include/linux/mtd/onenand.h            |    5 ++
 include/linux/mtd/samsung_onenand.h    |    2 +
 7 files changed, 86 insertions(+), 23 deletions(-)

-- 
1.7.2.3
