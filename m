From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 12/12] ASoC: Samsung: Update DMA interface
Date: Sat, 16 Jul 2011 09:01:40 +0900
Message-ID: <034301cc434b$8f0eecf0$ad2cc6d0$%kim@samsung.com>
References: <1310546857-6304-1-git-send-email-kgene.kim@samsung.com>
 <1310546857-6304-13-git-send-email-kgene.kim@samsung.com>
 <20110713235709.GE9770@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59836 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750934Ab1GPABu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2011 20:01:50 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOE00D22G306920@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 09:01:49 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOE001EYG301A@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 09:01:49 +0900 (KST)
In-reply-to: <20110713235709.GE9770@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Liam Girdwood' <lrg@ti.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Linus Walleij' <linus.walleij@linaro.org>, 'Boojin Kim' <boojin.kim@samsung.com>

Mark Brown wrote:
> 
> On Wed, Jul 13, 2011 at 05:47:37PM +0900, Kukjin Kim wrote:
> 
> > -static inline bool s3c_dma_has_circular(void)
> > +static inline bool dma_has_circular(void)
> >  {
> >  	return false;
> >  }
> 
> The namespacing here doesn't look great, this is still a Samsung
> specific internal API.
> 

OK, will keep it.

> Otherwise this looks good.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
