From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Common plat-s5p fixes
Date: Mon, 17 May 2010 08:29:52 +0200
Message-ID: <1274077795-30873-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:31501 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753526Ab0EQGaA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 02:30:00 -0400
Received: from eu_spt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L2J00DN6WPY3B10@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 07:29:58 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L2J00BGLWPX2X@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 May 2010 07:29:58 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

Hello,

This patch series contains some core plat-s5p fixes, required for both
plat-s5pc1xx cleanup series as well as patches that add Samsung Aquila
board support. This patch series has been rebase onto next-samsung git
tree.

This is a resend of these patches. They were already posted as a part of
other patch series. However most of them are outdated and do not apply
onto the current next-samsung tree.

The series contain the following patches:

[PATCH 1/3] ARM: Samsung: fix broken timer irq base
[PATCH 2/3] ARM: Samsung: move common I2C0 device helpers to machine directories
[PATCH 3/3] ARM: Samsung: move driver strength gpio configuration helper to common dir
