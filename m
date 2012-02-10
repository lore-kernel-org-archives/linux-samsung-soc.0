From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] regarding PL330 driver for rmk or arm-soc, and	slave-dma
Date: Fri, 10 Feb 2012 20:58:47 +0900
Message-ID: <012b01cce7eb$58baf500$0a30df00$%kim@samsung.com>
References: <010601cce7e1$5850a600$08f1f200$%kim@samsung.com>
 <20120210110800.GU889@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52180 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754727Ab2BJL6v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 06:58:51 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ600FHGELVZ8U0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 20:58:50 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ600AZXELZXE50@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 20:58:50 +0900 (KST)
In-reply-to: <20120210110800.GU889@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: arnd@arndb.de, 'Olof Johansson' <olof@lixom.net>, 'Vinod Koul' <vinod.koul@intel.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Boojin Kim' <boojin.kim@samsung.com>

Russell King - ARM Linux wrote:
> 
> On Fri, Feb 10, 2012 at 07:47:12PM +0900, Kukjin Kim wrote:
> >  arch/arm/common/Kconfig                        |    3 -
> >  arch/arm/common/Makefile                       |    1 -
> >  arch/arm/common/pl330.c                        | 1959
-----------------------
> -
> >  arch/arm/include/asm/hardware/pl330.h          |  338 +++--
> 
> I think I've already said this, but I'm going to say it again.
> 
> Code in arch/arm/include/asm/hardware/pl330.h which is only used by
> drivers/dma/pl330.c, needs to move to drivers/dma/pl330.h or into
> drivers/dma/pl330.c itself.
> 
> Anything else left over which needs to be used by others can go into
> include/linux/amba/pl330.h.
> 
OK, I agree. I will address comment from you, then submit it and re-send
'pull request' in the beginning of next week.

If any other problem, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
