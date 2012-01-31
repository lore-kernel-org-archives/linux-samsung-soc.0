From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] S3C24XX DMA resume regression fix
Date: Tue, 31 Jan 2012 20:27:23 +0900
Message-ID: <04a201cce00b$4d6aaac0$e8400040$%kim@samsung.com>
References: <1327065184-9805-1-git-send-email-dron0gus@gmail.com>
 <20120127122537.GF2056@build.ihdev.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:31196 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753167Ab2AaL1g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 06:27:36 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYN001F6UGTIE30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 31 Jan 2012 20:27:26 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYN00D2PUHN6A60@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 31 Jan 2012 20:27:25 +0900 (KST)
In-reply-to: <20120127122537.GF2056@build.ihdev.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sergey Lapin' <slapin@ossfans.org>, 'Gusakov Andrey' <dron0gus@gmail.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Sergei Shtylyov' <sshtylyov@ru.mvista.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Sergey Lapin wrote:
> 
> On Fri, Jan 20, 2012 at 05:13:04PM +0400, Gusakov Andrey wrote:
> > In commit bb072c3cf21d1c9a5a2eeb5a00679ee7bf39675b

Just the first 12 hex digits of the commit id is enough now as Linus said?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> > (Use struct syscore_ops for "core" power management)
> > suspend/resume hooks for each DMA channels were replaced with
> > hooks that suspend/resume all channels. s3c2410_dma_suspend
> > suspends channels from 0 to dma_channels. s3c2410_dma_resume
> > resumes channels in reverse order. So pointer should be
> > decremented insted of being incremented.
> Any news regarding this patch?
> >
> > Signed-off-by: Gusakov Andrey <dron0gus@gmail.com>
> > ---
> >  arch/arm/plat-s3c24xx/dma.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > v2: updated commit message with original commit summary
> >
> 
> All the best,
> S.
