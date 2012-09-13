From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/5] ARM: Add interface for registering and calling
 firmware-specific operations
Date: Thu, 13 Sep 2012 10:25:19 +0200
Message-ID: <7531144.4Y7oHlfebV@amdc1227>
References: <1347524018-19301-1-git-send-email-t.figa@samsung.com>
 <1347524018-19301-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15310 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754254Ab2IMIZz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Sep 2012 04:25:55 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAA00J7C4QCA1W0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Sep 2012 17:25:24 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAA00APQ4Q91X10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Sep 2012 17:25:24 +0900 (KST)
In-reply-to: <1347524018-19301-3-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net

On Thursday 13 of September 2012 10:13:35 Tomasz Figa wrote:
> In code using firmware ops:
> 
> 	__raw_writel(virt_to_phys(exynos4_secondary_startup),
> 		CPU1_BOOT_REG);
> 
> 	/* Call Exynos specific smc call */
> 	do_firmware_op(cpu_boot, cpu);

Typo, s/do_/call_/ .

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
