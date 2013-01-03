From: Tomasz Figa <t.figa@samsung.com>
Subject: Early kernel hang with big DTB appended
Date: Thu, 03 Jan 2013 16:55 +0100
Message-ID: <7811936.npteFbuYu2@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62536 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753261Ab3ACPzH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jan 2013 10:55:07 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG2001R247NAMA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Jan 2013 00:55:06 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG20034V47SWB40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Jan 2013 00:55:05 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nico@linaro.org, bones@secretlab.ca, linux@arm.linux.org.uk, thomas.abraham@linaro.org, kgene.kim@samsung.com

Hi,

I'm observing strange behavior when booting 3.8-rc1 and -rc2 with appended 
DTB. The kernel hangs very early when the DTB is bigger than some 
threshold somewhere around 24 KiB. With fullest possible low level UART 
debugging (and printk patched to use printascii) I'm receiving following 
output:

Uncompressing Linux... done, booting the kernel.
Booting Linux on physical CPU 0xa00
Linux version 3.8.0-rc1-00073-gdf6efca-dirty (t.figa@amdc1227) (gcc 
version 4.5.2 (Gentoo 4.5.2 p1.2, pie-0.4.5) ) #2 SMP PREEMPT Thu Jan 3 
15:37:35 CET 2013
CPU: ARMv7 Processor [413fc090] revision 0 (ARMv7), cr=10c53c7d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache

I tested on two Exynos-based boards (exynos4210-trats and one internal 
exynos4412-based board) and same happens on both.

Do you have any ideas?

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
