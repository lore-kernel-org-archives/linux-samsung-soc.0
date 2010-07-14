From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3] Samsung Aquila & GONI update
Date: Wed, 14 Jul 2010 10:16:53 +0200
Message-ID: <1279095416-24871-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:63676 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752668Ab0GNIRE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jul 2010 04:17:04 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L5J00M7XGCB6R30@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Jul 2010 09:16:59 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L5J00MU3GCB2Z@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Jul 2010 09:16:59 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Hello,

This short patch series adds basic framebuffer defintion to Samsung GONI
board as well as PMIC8998 support for both Samsung Aquila and GONI
boards. MAX8998 PMIC driver has been accepted by regulator subsystem
maintainers and is already available in the 'next' kernel tree (see
commit 8d017ab9f81089cb5ffde0e354d13130c1c19999). 

Changes since v2:
- cleaned some tabs&spaces errors, renamed max8998_platform_data to
  {aquila,goni}_max8998_pdata
- removed some superfluous includes
(suggested by Kukjin Kim) 

Changes since v1:
- removed all consumer entries, will be readded with aproperiate devices
(suggested by Mark Brown)

The series contains the following patches:

[PATCH 1/3] ARM: S5PV210: GONI: add support for framebuffer
[PATCH 2/3] ARM: S5PV210: Aquila: add support for MAX8998 PMIC
[PATCH 3/3] ARM: S5PV210: GONI: add support for MAX8998 PMIC

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
