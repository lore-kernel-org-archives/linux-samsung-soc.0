From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 7/7] ASoC: Samsung: Update DMA interface
Date: Tue, 5 Jul 2011 12:04:04 -0600
Message-ID: <20110705180404.GA7810@ponder.secretlab.ca>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
 <1309781915-31549-8-git-send-email-kgene.kim@samsung.com>
 <20110704170259.GC28726@opensource.wolfsonmicro.com>
 <00bf01cc3ae3$d5a29150$80e7b3f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:53854 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752154Ab1GESEp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 14:04:45 -0400
Received: by qyk29 with SMTP id 29so1631925qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2011 11:04:44 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <00bf01cc3ae3$d5a29150$80e7b3f0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Liam Girdwood' <lrg@ti.com>, 'Boojin Kim' <boojin.kim@samsung.com>

On Tue, Jul 05, 2011 at 04:19:05PM +0900, Kukjin Kim wrote:
> Mark Brown wrote:
> > 
> Hi Mark,
> 
> Please refer to my other comment which includes block diagram, it can help
> our understanding about current Samsung DMA usage.
> 
> > Two questions here:
> > 
> > - It looks like a lot of this code can be shared between all the drivers
> >   using the dmaengine API.  Is there any reason not to factor it out?
> 
> Hmm...I'm not sure, but let us think/check your suggestions. Thanks :)
> 
> > - Should this not be adding a new driver for dmaengine based Samsung
> >   CPUs?  The ifdefs are very big.
> 
> OK, we will try.
> 
> Grant, I think, Mark's suggestion can support multiple platform...

Yes, it should.

g.
