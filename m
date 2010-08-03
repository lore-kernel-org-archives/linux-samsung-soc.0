From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] SDHCI clock source definition cleanup
Date: Tue, 03 Aug 2010 13:09:52 +0200
Message-ID: <1280833794-11147-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:62444 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755965Ab0HCLKB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Aug 2010 07:10:01 -0400
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L6K006GKPON7M@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Aug 2010 12:09:59 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L6K0035LPOMLK@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Aug 2010 12:09:59 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Hello,

This short patch series performs a little cleanup in clock source
definitions for S5PC100 and S5PV210 SoCs.

A complete list of patches:
[PATCH 1/2] ARM: S5PC100: cleanup hsmmc clock definitions
[PATCH 2/2] ARM: S5PV210: cleanup hsmmc clock definitions

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
