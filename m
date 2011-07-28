From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH V4 14/14] ARM: SAMSUNG: Remove Samsung specific enum type
 for dma direction
Date: Thu, 28 Jul 2011 10:23:18 +0900
Message-ID: <001401cc4cc4$ef557d40$ce0077c0$%kim@samsung.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
 <1311557312-26107-15-git-send-email-boojin.kim@samsung.com>
 <CABb+yY3dwshghgXPuMyLzm=ArYdELBOqVf4AcxN77MV1jV8Ang@mail.gmail.com>
 <20110725211532.GF26735@ponder.secretlab.ca>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45872 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752863Ab1G1BXW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 21:23:22 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LP000FAIRTN3NC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 28 Jul 2011 10:23:20 +0900 (KST)
Received: from DOBOOJINKIM03 (12-23-120-72.csky.net [12.23.120.72])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LP0005ELRUW52@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 28 Jul 2011 10:23:20 +0900 (KST)
In-reply-to: <20110725211532.GF26735@ponder.secretlab.ca>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Grant Likely' <grant.likely@secretlab.ca>, 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>

Grant Likely Wrote:
> Likely
> Sent: Tuesday, July 26, 2011 6:16 AM
> To: Jassi Brar
> Cc: Boojin Kim; linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; Vinod Koul; Dan Williams; Kukjin Kim; Mark Brown
> Subject: Re: [PATCH V4 14/14] ARM: SAMSUNG: Remove Samsung specific
> enum type for dma direction
>
> On Mon, Jul 25, 2011 at 05:38:37PM +0530, Jassi Brar wrote:
> > On Mon, Jul 25, 2011 at 6:58 AM, Boojin Kim <boojin.kim@samsung.com>
> wrote:
> > > This patch removes the samsung specific enum type 's3c2410_dmasrc'
> > > and uses 'dma_data_direction' instead.
> > >
> > > Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> > > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> >
> > Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
> >
> > If this patch was first in the patchset, probably it could have been
> > already merged.
>
> Indeed.  If you move this to the front when you post the next version
> then it can be merged right away.
I tried to move it ahead. But It made some conflicts.
So, I pushed as it is on V5 release.
Sorry.. I would have noticed it before I release V5.

>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
