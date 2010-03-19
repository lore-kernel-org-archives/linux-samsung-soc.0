From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] ARM: S5P6440: Added PL330 support in plat-samsung for
	samsung S5P6440 soc.
Date: Fri, 19 Mar 2010 21:09:24 +0900
Message-ID: <00b201cac75d$06d308a0$147919e0$%kim@samsung.com>
References: <1268996540-15473-1-git-send-email-atul.dahiya@samsung.com>
 <1b68c6791003190410i77989864p7187957bfefbb94c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35257 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751700Ab0CSMJe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Mar 2010 08:09:34 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KZJ00JJW33V2Q@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Mar 2010 21:09:32 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KZJ0054P33VXC@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Mar 2010 21:09:31 +0900 (KST)
In-reply-to: <1b68c6791003190410i77989864p7187957bfefbb94c@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'jassi brar' <jassisinghbrar@gmail.com>, 'Atul Dahiya' <atul.dahiya@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

jassi brar wrote:
> On Fri, Mar 19, 2010 at 8:02 PM, Atul Dahiya <atul.dahiya@samsung.com> wrote:
> > This patch adds DMA pl330 mico code for S5P series in plat-samsung.This patch
> also
> > moves some common code from s3c2410 to plat-samsung which can also be
> used by pl330.
> Not sure if it's a correct approach when the mainline discussions have
> already made it clear that PL-330
> code shouldn't be Samsung specific.
> Also, the samsung internal DMA driver style is needlessly borrowed
> from s3c24xx dma. We don't
> need that unnecessarily complicated state machine, though the API
> should be kept.
Hi jassi,

I also agree your opinion.
DMA PL330 can be used by other SoCs.
So it has to be in the arch/arm/common/ or drivers/dma/.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
