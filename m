From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 7/7] ASoC: Samsung: Update DMA interface
Date: Tue, 05 Jul 2011 16:19:05 +0900
Message-ID: <00bf01cc3ae3$d5a29150$80e7b3f0$%kim@samsung.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
 <1309781915-31549-8-git-send-email-kgene.kim@samsung.com>
 <20110704170259.GC28726@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16472 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753664Ab1GEHTL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 03:19:11 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNU0085KMYZWL30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Jul 2011 16:19:10 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNU00IUMMZY2Q@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Jul 2011 16:19:10 +0900 (KST)
In-reply-to: <20110704170259.GC28726@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Liam Girdwood' <lrg@ti.com>, 'Boojin Kim' <boojin.kim@samsung.com>

Mark Brown wrote:
> 
Hi Mark,

Please refer to my other comment which includes block diagram, it can help
our understanding about current Samsung DMA usage.

> Two questions here:
> 
> - It looks like a lot of this code can be shared between all the drivers
>   using the dmaengine API.  Is there any reason not to factor it out?

Hmm...I'm not sure, but let us think/check your suggestions. Thanks :)

> - Should this not be adding a new driver for dmaengine based Samsung
>   CPUs?  The ifdefs are very big.

OK, we will try.

Grant, I think, Mark's suggestion can support multiple platform...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
