From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH V4 04/14] DMA: PL330: Add DMA_CYCLIC capability
Date: Mon, 25 Jul 2011 21:36:47 +0900
Message-ID: <002301cc4ac7$84ce6d50$8e6b47f0$%kim@samsung.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
 <1311557312-26107-5-git-send-email-boojin.kim@samsung.com>
 <20110725092749.GB9653@n2100.arm.linux.org.uk>
 <002001cc4ab6$0d7cd590$287680b0$%kim@samsung.com>
 <20110725103629.GF9653@n2100.arm.linux.org.uk>
 <1311590884.29703.2.camel@vkoul-mobl4>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53084 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751406Ab1GYMgt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 08:36:49 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOW00JDW317FDA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 21:36:47 +0900 (KST)
Received: from DOBOOJINKIM03 (12-23-120-72.csky.net [12.23.120.72])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOW00EVH31BGP@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 21:36:47 +0900 (KST)
In-reply-to: <1311590884.29703.2.camel@vkoul-mobl4>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vinod Koul' <vkoul@infradead.org>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: vinod.koul@intel.com, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Grant Likely' <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Dan Williams' <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

Vinod Koul Wrote:
> Sent: Monday, July 25, 2011 7:48 PM
> To: Russell King - ARM Linux
> Cc: vinod.koul@intel.com; Boojin Kim; 'Kukjin Kim'; 'Jassi Brar';
> 'Grant Likely'; linux-samsung-soc@vger.kernel.org; 'Mark Brown'; 'Dan
> Williams'; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH V4 04/14] DMA: PL330: Add DMA_CYCLIC capability
>
> On Mon, 2011-07-25 at 11:36 +0100, Russell King - ARM Linux wrote:
> > On Mon, Jul 25, 2011 at 07:31:45PM +0900, Boojin Kim wrote:
> > > > On Mon, Jul 25, 2011 at 10:28:22AM +0900, Boojin Kim wrote:
> > > > > +static void pl330_tasklet_cyclic(unsigned long data)
> > > > > +{
> > > > > +	struct dma_pl330_chan *pch = (struct dma_pl330_chan *)data;
> > > > > +	struct dma_pl330_desc *desc, *_dt;
> > > > > +	unsigned long flags;
> > > > > +	LIST_HEAD(list);
> > > > > +
> > > > > +	spin_lock_irqsave(&pch->lock, flags);
> > > > ...
> > > > > +			callback = desc->txd.callback;
> > > > > +			if (callback)
> > > > > +				callback(desc->txd.callback_param);
> > > >
> > > > On this again - what if the callback wants to terminate the DMA
> activity
> > > > because there's no more audio data to be sent/received from the
> device?
> > >
> > > Do you mean what is happened if the callback() is called after
> channel is
> > > terminated ?
> > > Or What is happened if Callback() calls 'dma_release_channel()' to
> terminate
> > > DMA?
> >
> > No.  I mean what if the callback wants to call
> dmaengine_terminate_all().
> you are supposed to drop the lock here, that way callback can call any
> DMA API, otherwise it will result in deadlock.
> This make me wonder you haven't read the documentation at all, please
> ensure you have read Documentation/dmaengine.txt before next posting
I found the deadlock problem that you post. I will fix it and read the 
document again.

> >
> > > > > +	if (!pch->cyclic_task) {
> > > > > +		pch->cyclic_task =
> > > > > +			kmalloc(sizeof(struct tasklet_struct),
> GFP_KERNEL);
> > > > > +		tasklet_init(pch->cyclic_task,
> > > > > +			pl330_tasklet_cyclic, (unsigned int)pch);
> > > >
> > > > Here you allocate memory for the cyclic task.  Above you set this
> pointer
> > > > to NULL.  That sounds like a memory leak to me.  Why are you
> kmallocing
> > > > this memory - why can't it be part of the dma_pl330_chan
> structure?  It's
> > > > only 28 bytes.
> > >
> > > It's my mistake. I should have been free of the memory.
> > >
> > > And the reason why I use kmalloc for 'cyclic_task' is following.
> > > This memory size for 'cyclic_tasklet' is the 896 bytes ( = the
> number of
> > > channel * sizeof(struct tasklet_struct)= 32*28) for each DMAC. And
> This
> > > memory size is increased according to the number of DMAC.
> > > And Samsung has the DMAC that is dedicated for Mem-to-Mem
> operation. If I
> > > make 'cyclic_task' be part of dma_pl330_chan, this DMAC that is
> dedicated
> > > for Mem-to-Mem operation should hold unused data.
> > > So, I think it's loss that all dma channels hold own 'cyclic_task'.
> >
> > Could you re-use the tasklet that already exists?
>
>
> --
> ~Vinod Koul
> Intel Corp.
