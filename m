From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] Common plat-s5p updates
Date: Tue, 18 May 2010 12:23:34 +0200
Message-ID: <1274178216-12003-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:9521 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756310Ab0ERKXl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 May 2010 06:23:41 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L2M00JH227FVI70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 11:23:39 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L2M004PL27DCR@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 11:23:39 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

Hello,

This patch series contains some core plat-s5p updates, required for both
plat-s5pc1xx cleanup series as well as patches that add Samsung Aquila
board support. This patch series has been rebased onto next-samsung git
tree.

Changes since the previous version:
- updated copyright header in mach-s5pv210/setup-i2c0.c

This patch series has been sent earlier under the 'Common plat-s5p
fixes' thread.

The series contain the following patches:

[PATCH 1/2] ARM: Samsung: copy common I2C0 device helpers to machine directories
[PATCH 2/2] ARM: Samsung: move driver strength gpio configuration helper to common dir

Best regards,
Marek Szyprowski
