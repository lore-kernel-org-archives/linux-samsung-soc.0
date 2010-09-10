From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: S5PC110: Samsung Goni board update
Date: Fri, 10 Sep 2010 09:23:17 +0200
Message-ID: <1284103403-10696-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:34132 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751295Ab0IJHX3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 03:23:29 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L8I00C4CSJ2MG70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 08:23:27 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L8I00E0OSJ2JN@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 08:23:26 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Hello,

This patch series updates the devices supported by Samsung Goni board.
The patch series has been prepared against latest kgene/for-next kernel
tree.

The complete list of patches:

[PATCH 1/6] ARM: S5PC110: update framebuffer setup information for Goni
[PATCH 2/6] ARM: S5PC110: add support for S6E63M0 LCD controller on Goni board
[PATCH 3/6] ARM: S5PC110: Add si470x radio device to the GONI board
[PATCH 4/6] ARM: S5PV210: Enable USB HSOTG gadget build
[PATCH 5/6] ARM: S5PC110: add support for otg usb gadget on Goni board
[PATCH 6/6] ARM: S5PC110: add support for MMC regulators on Goni board

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
