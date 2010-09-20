From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] ARM: S5PC110: Samsung Goni board update
Date: Mon, 20 Sep 2010 14:55:30 +0200
Message-ID: <1284987337-15365-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:51290 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753552Ab0ITMzm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Sep 2010 08:55:42 -0400
Received: from eu_spt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L9100MERQKS0K00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Sep 2010 13:55:40 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L910089TQKRRE@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Sep 2010 13:55:40 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Hello,

This patch series updates the devices supported by Samsung Goni board.
The patch series has been prepared against latest kgene/for-next kernel
tree.

This is a second version of this patch series. It has been updated to
fix the issues reported by Kukjin Kim and Mark Brown.

The complete list of patches:

[PATCHv2 1/7] ARM: S5PC110: update framebuffer setup information for Goni
[PATCHv2 2/7] ARM: S5PC110: fb setup for Goni - remove pixel clock
[PATCHv2 3/7] ARM: S5PC110: add support for S6E63M0 LCD controller on Goni board
[PATCHv2 4/7] ARM: S5PC110: Add si470x radio device to the GONI board
[PATCHv2 5/7] ARM: S5PV210: Enable USB HSOTG gadget build
[PATCHv2 6/7] ARM: S5PC110: add support for otg usb gadget on Goni board
[PATCHv2 7/7] ARM: S5PC110: add support for MMC regulators on Goni board

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
