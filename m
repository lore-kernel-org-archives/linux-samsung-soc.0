From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] Samsung Aquila & GONI update
Date: Thu, 01 Jul 2010 08:07:43 +0200
Message-ID: <1277964466-23891-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54058 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751808Ab0GAGIA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Jul 2010 02:08:00 -0400
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L4V0083L7P9YD@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Jul 2010 07:07:57 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L4V00JF47P935@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Jul 2010 07:07:57 +0100 (BST)
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

The series contains the following patches:

[PATCH 1/3] arm: s5pv210: GONI: add support for framebuffer
[PATCH 2/3] arm: s5pv210: Aquila: add support for MAX8998 PMIC
[PATCH 3/3] arm: s5pv210: GONI: add support for MAX8998 PMIC

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
