From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] Add OneNAND devices to Aquila and GONI boards
Date: Fri, 25 Jun 2010 07:52:05 +0200
Message-ID: <1277445127-16025-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31676 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750825Ab0FYFwO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jun 2010 01:52:14 -0400
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L4K008DM2YY4D@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jun 2010 06:52:10 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L4K005RC2YXS9@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jun 2010 06:52:10 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

Hello,

This short patch serie adds OneNAND devices to Aquila and GONI boards.
The patches were earlier posted to mailing list but it looks they were
lost, so I decided to resend them again.

The series contains the following patches:

[PATCH 1/2] ARM: S5PV210: Add OneNAND device to the GONI board
[PATCH 2/2] ARM: S5PV210: Add OneNAND device to the Aquila board

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
