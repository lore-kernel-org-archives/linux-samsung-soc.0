From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V5 00/15] To use DMA generic APIs for Samsung DMA
Date: Thu, 11 Aug 2011 16:26:53 +0900
Message-ID: <015101cc57f8$0d7b1da0$287158e0$%kim@samsung.com>
References: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com>
 <CACRpkdZvbH1O608n_aa_nVi-Onhmt0Ay6X1yCgBVNES4o9hTrA@mail.gmail.com>
 <1312821923.1539.37.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57759 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751036Ab1HKH07 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Aug 2011 03:26:59 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPR00G715ZX3510@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Aug 2011 16:26:58 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPR00LSP60XM5@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Aug 2011 16:26:58 +0900 (KST)
In-reply-to: <1312821923.1539.37.camel@vkoul-udesk3>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'Koul, Vinod'" <vinod.koul@intel.com>, 'Boojin Kim' <boojin.kim@samsung.com>
Cc: 'Linus Walleij' <linus.walleij@linaro.org>, 'Russell King' <linux@arm.linux.org.uk>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Grant Likely' <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Dan Williams' <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

Koul, Vinod wrote:
> 
> On Thu, 2011-08-04 at 18:53 +0200, Linus Walleij wrote:
> > On Wed, Jul 27, 2011 at 7:31 AM, Boojin Kim <boojin.kim@samsung.com> wrote:
> >
> > > This patchset adds support DMA generic APIs for Samsung DMA.
> >
> > Patches look good to me,
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Acked-by: Vinod Koul <vinod.koul@intel.com>
> 
> Do you want these to go thru slave-dma tree or arm tree, I am okay with
> either...

Hi Vinod,

Thanks.

I'd like to keep its topic branch in my tree to avoid conflicts with other samsung stuff and I think, it should be merged into your slave-dma tree also for same reason.

git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git #next/topic-dma-pl330

Or if you want to make some branch for it in your tree, please let me know so that I can merge it in my tree also.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
