From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3] ARM: S5P: Add support for gpio interrupts
Date: Mon, 06 Sep 2010 11:12:21 +0200
Message-ID: <1283764347-460-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:37641 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859Ab0IFJMm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Sep 2010 05:12:42 -0400
Received: from eu_spt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L8B00GWCIX28660@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Sep 2010 10:12:38 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L8B00G42IX1WQ@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Sep 2010 10:12:38 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org, jy0922.shim@samsung.com

Hello,

This patch series adds support for gpio interrupts on Samsung S5P SoC
series (S5PC100 and S5PC110/S5PV210). It is based on the previous
version created by Joonyoung Shim (which is available from the 
"[PATCH v2 0/4] ARM: S5P: Support gpio interrupts" thread:
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/1662 ).

This version has been redesigned to assign irq numbers dynamically to
reduce resource waste. Such idea has proposed by Ben Dooks some time ago
(see "[PATCH] ARM: S5P: Dynamicly numbered GPIO interrupt support"
thread: http://comments.gmane.org/gmane.linux.kernel.samsung-soc/1198 ).

The last patch in this series is an example how to use the dynamically
registered gpio interrupt. The QT602240 touch screen device on Goni
machine requires it.

The patch series has been rebased onto latest kgene/for-next kernel
tree.

The complete list of patches:

[PATCH 1/6] ARM: Samsung: Add common s5p gpio interrupt support
[PATCH 2/6] ARM: S5PC110: add support for gpio interrupts
[PATCH 3/6] ARM: S5PC100: Use generic S5P gpio interrupts interface
[PATCH 4/6] ARM: S5PC100: Move external interrupt defines
[PATCH 5/6] ARM: Samsung: Add common samsung_gpiolib_to_irq function
[PATCH 6/6] ARM: S5PC110: GONI: Add support for QT602240 TS driver

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
