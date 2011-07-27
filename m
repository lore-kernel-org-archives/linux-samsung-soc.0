From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RFC PATCH] DMA: PL330: Update PL330 DMAC to support runtime PM
Date: Wed, 27 Jul 2011 18:43:46 +0900
Message-ID: <4E2FDDD2.3070106@samsung.com>
References: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com>
 <1311744697-10264-2-git-send-email-boojin.kim@samsung.com>
 <4E2FACC3.2010109@samsung.com> <20110727085348.GB21584@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59999 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752628Ab1G0JnR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 05:43:17 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOZ00LEGKBWEJN0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 18:43:15 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOZ00BFNKC3WF@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 18:43:15 +0900 (KST)
In-reply-to: <20110727085348.GB21584@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Boojin Kim <boojin.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>, Kyungmin Park <kyungmin.park@samsung.com>

Russell King - ARM Linux wrote:
> On Wed, Jul 27, 2011 at 03:14:27PM +0900, Chanwoo Choi wrote:
>> +#ifdef CONFIG_PM_RUNTIME
>> +	struct dma_pl330_chan *pch;
>> +	struct dma_pl330_dmac *pdmac;
>> +#endif
>>  
>>  	dma_cap_zero(mask);
>>  	dma_cap_set(info->cap, mask);
>>  
>>  	chan = dma_request_channel(mask, pl330_filter, (void *)dma_ch);
>>  
>> +#ifdef CONFIG_PM_RUNTIME
>> +	pch = container_of(chan, struct dma_pl330_chan, chan);
>> +	pdmac = pch->dmac;
>> +
>> +	pm_runtime_get_sync(pdmac->pif.dev);
>> +#endif
> 
> This is not the right way to do this.  The pm runtime stuff should be
> internal to the PL330 driver.  Take a moment to think about this:
> 
> You need to wake it up just before a transfer starts.  You need to
> put it back to sleep just after the last transfer has finished.
> That gives you a hint where the calls need to be.
> 
> That can only be done from within the PL330 driver.
> 

Thanks for your comment&hint.

I will repost the patch which support runtime pm of PL330 in internal to the PL330 driver.

Regards,
Chanwoo Choi
