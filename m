From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: Removing pdma for SSDK5440
Date: Tue, 11 Jun 2013 19:18:38 +0900
Message-ID: <10b101ce668d$0a341390$1e9c3ab0$%kim@samsung.com>
References: <109601ce6679$fef2e410$fcd8ac30$%kim@samsung.com>
 <51B6E49D.7000408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42301 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751700Ab3FKKSk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 06:18:40 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO80033S4LVEEE0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Jun 2013 19:18:39 +0900 (KST)
In-reply-to: <51B6E49D.7000408@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Giridhar Maruthy' <giridhar.m@samsung.com>

Sylwester Nawrocki wrote:
> 
Hi Sylwester,

> On 06/11/2013 10:02 AM, Kukjin Kim wrote:
> > From: Giridhar Maruthy <giridhar.m@samsung.com>
> >
> > Since the pdma works only in secure mode, accessing the same
> > in hypervisor mode gives an abort. As we are not using pdma
> > anywhere (including spi), removing the same.
> >
> > Signed-off-by: Giridhar Maruthy <giridhar.m@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> I was wondering, wouldn't it be sufficient to add status = "disabled";
> in those pdma nodes, to avoid re-adding them in future ?

Yeah, could be. But the pdma will not be used on exynos5440 in future and if
some guy use it in non-secure mode, it will cause problem, so I want to
remove that.

> As for the DMA properties in the spi device nodes, they should indeed
> be removed, as generic DMA bindings would be used instead.
> 
Yes, agreed. So I'd prefer to remove that :-)

Thanks,
Kukjin
