From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] Samsung: FIMC machine setup code
Date: Mon, 09 Aug 2010 09:51:51 +0200
Message-ID: <1281340315-26676-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:61529 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755602Ab0HIHwB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Aug 2010 03:52:01 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L6V00JWZKILY7@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Aug 2010 08:51:57 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L6V00AMJKILVS@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Aug 2010 08:51:57 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com, p.osciak@samsung.com

Hello,

This is a quick resend of a FIMC patches that enable the driver on
Aquila, GONI and SMDKC100 machines. The code has been rebased onto
latest kgene/for-next kernel tree. common-aquila-and-goni code has been
disabled until a proper and cleaner solution will be provided.

List of patches:

[PATCH 1/4] ARM: S5PV210: enable FIMC on Aquila
[PATCH 2/4] ARM: S5PV210: enable FIMC on Goni
[PATCH 3/4] ARM: S5PC100: enable FIMC on SMDKC100
[PATCH 4/4] ARM: S5PV210: Override FIMC driver name on Aquila board

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
