From: Sangbeom Kim <sbkim73@samsung.com>
Subject: Can't compile with exynos4_defconfig
Date: Fri, 03 Jun 2011 11:25:53 +0900
Message-ID: <03ae01cc2195$8fee3ae0$afcab0a0$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:62015 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751493Ab1FCCZz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jun 2011 22:25:55 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LM7006WM010ZIC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Jun 2011 11:25:53 +0900 (KST)
Received: from DOSBKIM7301 ([12.23.119.77])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LM700537035ND@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Jun 2011 11:25:53 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>

Hi,

By default exynos4_defconfig, 3.0-rc1 can't compile the code.
It seem to have dependency on usb configuration.

Error message:
arch/arm/plat-s5p/built-in.o: In function `s5p_ehci_set_platdata':
/home/cornus/tmp/linux-3.0-rc1/arch/arm/plat-s5p/dev-ehci.c:54: undefined
reference to `s5p_usb_phy_init'
/home/cornus/tmp/linux-3.0-rc1/arch/arm/plat-s5p/dev-ehci.c:54: undefined
reference to `s5p_usb_phy_init'
/home/cornus/tmp/linux-3.0-rc1/arch/arm/plat-s5p/dev-ehci.c:56: undefined
reference to `s5p_usb_phy_exit'
/home/cornus/tmp/linux-3.0-rc1/arch/arm/plat-s5p/dev-ehci.c:56: undefined
reference to `s5p_usb_phy_exit'
make: *** [.tmp_vmlinux1] Error 1 


Regards,
SB Kim
