From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] Update Samsung S5PC100 SoC support
Date: Tue, 13 Oct 2009 09:56:55 +0200
Message-ID: <1255420632-21116-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:31640 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759145AbZJMIKs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2009 04:10:48 -0400
Received: from eu_spt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0KRG006RK0V1ZQ50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2009 08:59:25 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KRG00GID0V0QL@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2009 08:59:25 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.arm.linux.org.uk, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com

Hello,

This patch series updates Samsung S5PC100 SoC support. S5PC100 platform
core has been extended with new clocks hierarchy implementation, gpio lib,
support for external and gpio interrupts and some basics of power
management (cpu idle and system reset). Also platform helpers for
s3c framebuffer, i2c and hsmmc drivers has been added.

All these patches has been tested on SMDKC100 board.

This patch series has been prepared against latest ARM Kernel tree from
http://ftp.arm.linux.org.uk/pub/linux/arm/kernel/git-cur/linux-2.6-arm.git/

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
