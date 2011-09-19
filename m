From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v8 00/16] To use DMA generic APIs for Samsung DMA
Date: Mon, 19 Sep 2011 19:23:17 +0900
Message-ID: <001601cc76b6$2627cdd0$72776970$%kim@samsung.com>
References: <1314924284-25554-1-git-send-email-boojin.kim@samsung.com>
 <1315980099.26251.498.camel@vkoul-udesk3>
 <CABb+yY25NTbtRPOw-KH8U4zA1Bo8q0BDM8SXyrsobG7NEv8edg@mail.gmail.com>
 <1315999032.26251.501.camel@vkoul-udesk3>
 <CAJe_ZhdrPMbBOkfwg=PFyVU14eT0Gc0=rtKwEiQCH5-Q5-CtVQ@mail.gmail.com>
 <1316401174.21359.3.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52507 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755016Ab1ISKXU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Sep 2011 06:23:20 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRR00B2WM6U6100@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 19:23:18 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LRR00F6NM6UYZ70@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 19:23:18 +0900 (KST)
In-reply-to: <1316401174.21359.3.camel@vkoul-udesk3>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vinod Koul' <vinod.koul@intel.com>, 'Jassi Brar' <jaswinder.singh@linaro.org>
Cc: 'Russell King' <linux@arm.linux.org.uk>, 'Boojin Kim' <boojin.kim@samsung.com>, 'Linus Walleij' <linus.walleij@linaro.org>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Grant Likely' <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Dan Williams' <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

Vinod Koul wrote:
> 
> On Wed, 2011-09-14 at 17:03 +0530, Jassi Brar wrote:
> > On 14 September 2011 16:47, Vinod Koul <vinod.koul@intel.com> wrote:
> >
> > >> The changelog for [PATCH v8 04/16] is misleading - we don't need any
> > >> modification for the reason mentioned in changelog. But the modification
> > >> has positive side-effect of preventing callbacks during terminate_all which
> > >> is no way understood from the changelog. So I would like to changelog
> > >> corrected.
> > > I thought change log was correct in depicting what patch does and Boojin
> > > had replied.... I will check again...
> >
> > I didn't reply because I ran out of ways to explain the same thing in
> > different words.
> I checked again the patch, change log and your comments.
> I agree with current change log, and also your observation is right but
> that is just a side effect, which IMO should be best left to developer
> to choose or not, in this case she ignored it
> 
> So no changes to this and I a ready to merge it to my next in a day or
> two...
> 
So as a note, pulled git://git.infradead.org/users/vkoul/slave-dma.git samsung_dma for other regarding dma patches in arch/arm/ samsung stuff.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
