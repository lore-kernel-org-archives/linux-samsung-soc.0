From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH v2 1/2] DMA: PL330: Merge PL330 driver into drivers/dma/
Date: Wed, 08 Feb 2012 10:10:30 +0900
Message-ID: <003101cce5fe$734b9990$59e2ccb0$%kim@samsung.com>
References: <1323654668-32504-1-git-send-email-boojin.kim@samsung.com>
 <20120105145425.GW11810@n2100.arm.linux.org.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:29477 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756261Ab2BHBKc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Feb 2012 20:10:32 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ100GI4V96RID0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Feb 2012 10:10:30 +0900 (KST)
Received: from DOBOOJINKIM03 ([12.23.119.77])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ100K09V9ILR40@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 08 Feb 2012 10:10:30 +0900 (KST)
In-reply-to: <20120105145425.GW11810@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Vinod Koul' <vinod.koul@intel.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Jassi Brar' <jassisinghbrar@gmail.com>, linux-arm-kernel@lists.infradead.org

Russell King - ARM Linux wrote:
>
> Now that the PL330 code is entirely out of arch/arm, the header should no
> longer be in asm/hardware/pl330.h.
>
> Definitions private to the driver should be in drivers/dma/pl330.c or a
> header file co-located.  Other definitions for interfaces to that driver
> (eg, platform data) should be in include/linux/amba.
>
> That can be the subject of a follow-up patch if this is already finalized.
>
Sorry to late response. I believed my reply was sent. But, It maybe be not.
Anyway.. get to the point.
Pl08x also has asm/hardware/pl080.h to include hw specific information.
It seems to be same purpose with asm/hardware/pl330.h
Do you mean both asm/hardware/pl080.h and asm/hardware/pl330.h should be moved to include/linux/amba?

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
